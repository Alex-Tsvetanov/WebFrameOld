#define _WIN32_WINNT 0x0A00
#include <webpp/webpp.hpp>
#include <iostream>
#include <sstream>

int main ()
{
	webpp::webpp app;
	app.set_static ("/static")
	   //EXTENDED_VERSION: .route ("/", webpp::respond_manager ().set ([]() {
	   //EXTENDED_VERSION:  	std::cout << "hello world\r\n" << std::endl;		
	   //EXTENDED_VERSION:  	return webpp::response (webpp::status_line ("200", "1.1"), {}, "<h1>I love you! I'm working</h1>");
	   //EXTENDED_VERSION: }))
	   //EXTENDED_VERSION: .route ("/users/{user:[a-zA-Z0-9]*}", webpp::respond_manager ().set ([](webpp::path_vars v) {
	   //EXTENDED_VERSION:  	for (auto& x : v)
	   //EXTENDED_VERSION:  		std::cout << x.first << " " << x.second << std::endl; 
	   //EXTENDED_VERSION:  	return webpp::response ();
	   //EXTENDED_VERSION: }))
	   //EXTENDED_VERSION: .route ("/contest/{id#int:[0-9]*}", webpp::respond_manager ().set ([](webpp::path_vars v) {
	   //EXTENDED_VERSION:  	for (auto& x : v.vars)
	   //EXTENDED_VERSION:  		std::cout << x.first << " " << x.second.value << " " << x.second.type << std::endl; 
	   //EXTENDED_VERSION: 	int id = v["id"];
	   //EXTENDED_VERSION: 	std::string s (v["id"]);
	   //EXTENDED_VERSION: 	std::cout << "int = " << id << " string = " << s << std::endl;
	   //EXTENDED_VERSION:  	return webpp::response ();
	   //EXTENDED_VERSION: }))
	   //EXTENDED_VERSION: .route ("/users/{user:[a-zA-Z0-9]*}/{tab:.*}", webpp::respond_manager ().set ([](webpp::path_vars v) {
	   //EXTENDED_VERSION:  	for (auto& x : v)
	   //EXTENDED_VERSION:  		std::cout << x.first << " " << x.second << std::endl; 
	   //EXTENDED_VERSION:  	return webpp::response ();
	   //EXTENDED_VERSION: }))
	   .route ("/", []() {
	     	return webpp::response (webpp::status_line ("200"), {{"Content-Type", "text/html; charset=utf-8"}}, "<h1>I love you! I'm working</h1>");
	   })
	   .route ("/users/{user:[a-zA-Z0-9]*}", [](webpp::path_vars v) {
			std::stringstream ss;
			for (auto& x : v.vars)
				ss << x.first << " " << x.second.value << " " << x.second.type << "<br>"; 
	     	return webpp::response (webpp::status_line ("200"), {{"Content-Type", "text/html; charset=utf-8"}}, "<h1>" + ss.str () + "</h1>");
	   })
	   .route ("/contest/{id#int:[0-9]*}", [](webpp::path_vars v) {
	    	for (auto& x : v.vars) {
				std::cout << x.first << " " << x.second.value << " " << x.second.type << std::endl; 
			}
			int id = v["id"];
			std::string s (v["id"]);
			std::cout << "int = " << id << " string = " << s << std::endl;
	    	return webpp::response ();
	   })
	   //SIMPLIFIED_VERSION: .route ("/contest/{id#int}", [](webpp::path_vars v) {
	   //SIMPLIFIED_VERSION:  	for (auto& x : v.vars)
	   //SIMPLIFIED_VERSION:  		std::cout << x.first << " " << x.second.value << " " << x.second.type << std::endl; 
	   //SIMPLIFIED_VERSION:  	return webpp::response ();
	   //SIMPLIFIED_VERSION: })
	   .route ("/users/{user:[a-zA-Z0-9]*}/{tab:.*}", [](webpp::path_vars v) {
			for (auto& x : v.vars)
				std::cout << x.first << " " << x.second.value << " " << x.second.type << std::endl; 
			return webpp::response ();
	   })
	;

	const unsigned short port = 8888;
	const unsigned char cores = ((std::thread::hardware_concurrency () - 1 > 0) ? (std::thread::hardware_concurrency () - 1) : 1);
	std::cout << "Listening on :" << port << " with " << (int)cores << " cores" << std::endl;
	app.run (port, cores);
}
