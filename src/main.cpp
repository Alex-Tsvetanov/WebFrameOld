
#include <webnetpp/webnetpp.hpp>
#include <iostream>
#include <sstream>
#include <stdlib.h>

int main ()
{
	webnetpp::webnetpp app;
	app.route ("/", []() {
						return "Hello, World!";
					}
		)
	   .route ("/{steps:[0-9]+}", [](int steps) {
						std::stringstream res;
						res << "Hello World! We are " << steps;
						return res.str();
					}
		)
	   .route ("/user/{[0-9]+}", [](int id) {
						std::stringstream res;
						res << "Hello! Your Id is " << id;
						return res.str();
					}
		)
	;

	const unsigned short port = 8888;
	const unsigned char cores = ((std::thread::hardware_concurrency () - 1 > 0) ? (std::thread::hardware_concurrency () - 1) : 1);
	std::cout << "Listening on :" << port << " with " << (int)cores << " cores" << std::endl;
	app.run (port, cores);
}
