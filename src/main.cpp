#include <webnetpp/webnetpp.hpp>
#include <iostream>
#include <sstream>
#include <stdlib.h>

int main ()
{
	int pass = 0;
	webnetpp::webnetpp app;
	app.set_logger (std::cout)
	   .set_error_logger (std::cout)
	   .set_performancer (std::cout)
	   .route ("/{steps#int:[0-9]*}", [&pass](webnetpp::path_vars v) {
		   	int steps = v["steps"];
		   	for (int i = 0 ; i < (1 << steps); i ++)
			{
				pass += rand();
			}
	     	return webnetpp::response (webnetpp::status_line ("200"), {{"Content-Type", "text/html; charset=utf-8"}}, "Hello World!");
	   })
	;

	const unsigned short port = 8888;
	const unsigned char cores = ((std::thread::hardware_concurrency () - 1 > 0) ? (std::thread::hardware_concurrency () - 1) : 1);
	std::cout << "Listening on :" << port << " with " << (int)cores << " cores" << std::endl;
	app.run (port, cores);
	std::cout << "maika ti";
}
