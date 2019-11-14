#include <webnetpp/webnetpp.hpp>
#include <iostream>
#include <sstream>
#include <stdlib.h>

int main ()
{
	int pass = 0;
	webnetpp::webnetpp app;
	app.route ("/{.*}", [&](std::string user) {
				return app.render("./bin/template.html", {{"username", user}});
			}
		)
	;

	const unsigned short port = 8888;
	const unsigned char cores = ((std::thread::hardware_concurrency () - 1 > 0) ? (std::thread::hardware_concurrency () - 1) : 1);
	std::cout << "Listening on :" << port << " with " << (int)cores << " cores" << std::endl;
	app.run (port, cores);
}
