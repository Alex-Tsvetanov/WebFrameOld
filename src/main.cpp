#include <webnetpp/webnetpp.hpp>
#include <iostream>
#include <sstream>
#include <stdlib.h>

int main ()
{
	int pass = 0;
	webnetpp::webnetpp app;
	app .set_static("./src/static", "/static")
	 	.set_templates("./src/static/templates")
		.handle("404", [&](std::string path) {
			return "Error 404: " + path + " was not found.";
		})
		.handle("500", [&](std::string reason) {
			return "Error 500: Internal server error: " + reason + ".";
		})
		.route ("/{text}", [&](std::string user) {
				return app.render("template.html", {{"username", user}});
			}
		)
		.route ("/{number}", [&](int steps) {
				for (int i = 0 ; i < (1 << steps); i ++)
				{
					pass += rand();
				}
				return "Hello World!";
			}
		)
		.route ("/text/{text}", [&](int steps) {
				for (int i = 0 ; i < (1 << steps); i ++)
				{
					pass += rand();
				}
				return "Hello World!";
			}
		)
	;

	const unsigned short port = 8888;
	const unsigned char cores = ((std::thread::hardware_concurrency () - 1 > 0) ? (std::thread::hardware_concurrency () - 1) : 1);
	std::cout << "Listening on :" << port << " with " << (int)cores << " cores" << std::endl;
	app.run (port, cores);
}
