#pragma once 

#ifdef _WIN32
	// #define _WIN32_WINNT 0x0501
	#define WIN32_LEAN_AND_MEAN
	#include <winsock2.h>
	#include <winsock.h>
	#include <windows.h>
	#define SO_REUSEPORT SO_BROADCAST
	using socklen_t = int;
	#include <thread>
	#define mingw_stdthread std
	#include <stopwatch.h>
#else
	#include <sys/socket.h> 
	#include <netinet/in.h> 
	#include <filesystem>
	#include <thread>
#endif

/*
#if defined(__cplusplus) && __cplusplus >= 201703L && defined(__has_include)
	#if __has_include(<filesystem>)
		#define GHC_USE_STD_FS
		#include <filesystem>
		namespace fs = std::filesystem;
	#endif
#endif
*/
#ifndef GHC_USE_STD_FS
	#include <ghc/filesystem.hpp>
	namespace fs = ghc::filesystem;
#endif

#include <type_traits>
#include <iomanip>
#include <webnetpp/base.hpp>
#include <map>
#include <set>
#include <string>
#include <functional>

#include <utility>
#include <chrono>

#include <ios>
#include <iostream>

#include <unistd.h> 
#include <stdio.h> 
#include <stdlib.h> 
#include <string.h> 

#include <webnetpp/file.hpp>
#include <webnetpp/lambda2function.hpp>

namespace webnetpp
{
	class webnetpp;

	#include <webnetpp/respond_manager.hpp>

	class webnetpp
	{
		private:
			struct cmp { bool operator () (const auto& a, const auto& b) const { return (&a) < (&b); }};
			std::map < 
				std::pair < std::vector < std::string >,               // var type
							std::regex >,                              // regex 
				responcer,
				cmp> routes;
			std::set < fs::path > static_folders;

			static std::pair < std::vector < std::string >, // var type
							std::regex >                // regex 
			                             convert_path_to_regex (std::string str)
			{
				std::vector < std::string > v;
				std::string format = "^";
				for (size_t i = 0 ; i < str.size () ; i ++)
				{
					if (str [i] == '{')
					{
						std::string var_type;
						for (i ++ ; i < str.size () and str [i] != '}' ; i ++)
						{
							if (str [i] == ':') break;
							var_type += str [i];
						}
						if (var_type == "") var_type = "string";
						if (str[i] == '}')
						{
							i -= var_type.size() + 1;
							var_type = "string";
						}
						v.push_back (var_type);
						format += "(";
						for (i ++ ; i < str.size () and str [i] != '}' ; i ++)
						{
							if (str [i] == ':') break;
							format += str [i];
						}
						format += ")";
					}
					else 
					{
						format += str [i];
					}
				}
				format += "$";
				return {v, std::regex (format)};
			}

			SynchronizedFile logger;
			SynchronizedFile errors;
			SynchronizedFile performancer;
		public:

			auto get_routes () const 
			{
				return this->routes;
			}

			webnetpp& set_performancer (std::ostream& _performancer = std::clog)
			{
				performancer = SynchronizedFile(_performancer);
				return *this;
			}

			webnetpp& set_logger (std::ostream& _logger = std::clog)
			{
				logger = SynchronizedFile(_logger);
				return *this;
			}

			webnetpp& set_error_logger (std::ostream& _logger = std::clog)
			{
				errors = SynchronizedFile(_logger);
				return *this;
			}

			webnetpp& set_static (std::string path)
			{
				fs::path p = fs::relative (path);
				static_folders.insert (p);
				return *this;
			}

			static response get_file(std::string path)
			{
				return response (status_line ("200"), {{"Content-Type", "text/html; charset=utf-8"}}, path);
			}

			template<typename Ret, typename... Ts>
			webnetpp& route (std::string path, std::function<Ret(Ts...)> const& res)
			{
				auto x = convert_path_to_regex (path);
				if (routes.find (x) == routes.end ())
					routes [x] = responcer(res);
				else // rewriting path
					routes [x] = responcer(res);
				return *this;
			}

			template<typename F>
			webnetpp& route (std::string path, F _res)
			{
				const auto res = wrap(_res);
				auto x = convert_path_to_regex (path);
				if (routes.find (x) == routes.end ())
					routes [x] = responcer(res);
				else // rewriting path
					routes [x] = responcer(res);
				return *this;
			}
			
			response respond (const std::string& path)
			{
				// this->logger << "Requested: " << req.uri << "\n";
				std::smatch pieces_match;
				for (const auto &s : routes)
				{
					std::regex pieces_regex(s.first.second);
					if (std::regex_match (path, pieces_match, pieces_regex)) {
						std::ssub_match sub_match = pieces_match[0];
						std::string piece = sub_match.str();
						if (piece == path)
						{
							path_vars params;
							for (size_t i = 1; i < pieces_match.size(); ++i) {
								sub_match = pieces_match[i];
								piece = sub_match.str();
								params += path_vars::var(piece, s.first.first[i - 1]);
							}
							return s.second.call(params); 
						}
					}
				}
				return response (status_line ("1.1", "404"));
			}
			
			response respond (const request& req)
			{
				return respond (req.uri);
			}

			response respond (const char* p)
			{
				return respond (std::string(p));
			}

			void run (unsigned short PORT, unsigned int threads, unsigned requests = -1)
			{
				#ifdef __WIN32__
					WSADATA wsa;
					
					// this->logger << "Initialising Winsock...\n";
					if (WSAStartup(MAKEWORD(2,2),&wsa) != 0)
					{
						this->errors << "Failed. Error Code: " << WSAGetLastError() << "\n";
						exit(1);
					}
					
					// this->logger << "Initialised.\n";
				#endif
				#ifndef __WIN32__
				int32_t server_fd;
				#else
				SOCKET server_fd;
				#endif
				int valread;
				struct sockaddr_in address; 
				#ifndef __WIN32__
				char opt = 1; 
				#endif
				int addrlen = sizeof(address); 
				   
				// Creating socket file descriptor 
				#ifdef __WIN32__
					if((server_fd = socket(AF_INET , SOCK_STREAM , 0 )) == INVALID_SOCKET)
					{
						this->errors << "Could not create socket: " << WSAGetLastError() << "\n";
						throw std::ios_base::failure ("Socket failed"); 
					}
				#else
					if ((server_fd = socket(AF_INET, SOCK_STREAM, 0)) == 0) 
					{ 
						this->errors << "socket failed\n"; 
						throw std::ios_base::failure ("Socket failed"); 
					} 
				#endif
				// this->logger << "socket done\n"; 
				
				#ifndef __WIN32__
					// Forcefully attaching socket to the port
					if (setsockopt(server_fd, SOL_SOCKET, SO_REUSEADDR | SO_REUSEPORT, 
																&opt, sizeof(opt))) 
					{ 
						printf("setsockopt failed %d\n", server_fd); 
						perror("setsockopt"); 
						throw std::ios_base::failure ("Setsockopt"); 
					} 

					printf("setsockopt done %d\n", (int)opt); 
					address.sin_family = AF_INET; 
					address.sin_addr.s_addr = INADDR_ANY; 
					address.sin_port = htons (PORT); 
					
					// Forcefully attaching socket to the port 8080 
					if (bind(server_fd, (struct sockaddr *)&address,  
												sizeof(address))<0) 
					{ 
						perror("bind failed"); 
						throw std::ios_base::failure ("Socket failed"); 
					} 

					printf("bind done\n"); 
					if (listen(server_fd, SOMAXCONN) < 0) 
					{ 
						perror("listen"); 
						throw std::ios_base::failure ("Listen"); 
					}
				#else
					address.sin_addr.s_addr = INADDR_ANY;
					address.sin_family = AF_INET;
					address.sin_port = htons (PORT); 
					if (bind(server_fd, (struct sockaddr *)&address,  
												sizeof(address))<0)
					{
						// this->errors << "Server: bind() failed with error " << WSAGetLastError() << "\n";
						WSACleanup();
						exit(-1);
					}
					else{}
						// this->logger << "Server: bind() failed with error " << WSAGetLastError() << "\n";

					// this->logger << "bind done\n"; 
					if (listen(server_fd, SOMAXCONN) < 0) 
					{ 
						perror("listen"); 
						throw std::ios_base::failure ("Listen"); 
					}
				#endif

				// this->logger << "Listening\n"; 

				auto accept_req = [&] (int new_socket, size_t id) {
					// clock_t start = clock();
					char buffer[8196] = {0}; 
					#ifndef __WIN32__
					valread = read (new_socket, buffer, 8196); 
					#else
					valread = recv (new_socket, buffer, 8196, 0); 
					#endif
					// this->logger << "Accepted data:\n" << buffer << "\n--------- END-OF-DATA ------------\n"; 

					if (strlen (buffer) == 0)
					{
						// this->logger << "================= EMPTY-BUFFER ===============\n";
						this->busy [id] = false;
						return ;
					}

					response res;
					request r (buffer);
					// this->logger << "================= PARSING-BUFFER ===============\n";
					// this->logger << r.to_string () << "\n";
					// this->logger << "--------- PARSED ------------\n"; 
					res = this->respond (r);
					res.set_http (r.http);
					std::string s = res.to_string ();
					send (new_socket, s.c_str (), s.size (), 0);
					shutdown (new_socket, 2);
					this->busy [id] = false;
					// clock_t end = clock();
					// this->performancer << ((double(end-start))/CLOCKS_PER_SEC) << "\n";
					return;
				};
				threads = std::min(threads, requests);
				threads_ptr = new mingw_stdthread::thread* [threads];
				busy = new bool [threads];
				for (size_t i = 0 ; i < threads ; i ++)
				{
					threads_ptr [i] = nullptr;
					busy [i] = false;
				}
				while (requests >= 1)
				{
					bool is_there_thread = false;
					size_t i = 0;
					while (!is_there_thread)
						for (i = 0 ; i < threads ; i ++)
							if (threads_ptr [i] == nullptr)
							{
								busy [i] = true;
								is_there_thread = true;
								break;
							}
							else if (busy [i] == false)
							{
								delete threads_ptr [i];
								busy [i] = true;
								is_there_thread = true;
								break;
							}
					int new_socket; 
					if ((new_socket = accept(server_fd, (struct sockaddr *)&address,  
									   (socklen_t*)&addrlen))<0) 
					{ 
						// this->errors << "Failed to connect to client\n";
						continue;
					} 
					threads_ptr [i] = new mingw_stdthread::thread (accept_req, new_socket, i);
					threads_ptr [i]->detach ();
					requests --;
				}
				for (size_t i = 0 ; i < threads ; i ++)
				{
					if (busy [i])
					{
						while (busy [i]) {	}
					}
				}
				return;
			}

		private:
			mingw_stdthread::thread** threads_ptr;
			bool* busy;
	};
}
