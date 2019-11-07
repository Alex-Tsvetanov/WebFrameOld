#include <moka/moka.h>
#include <webnetpp/webnetpp.hpp>

#include <stdio.h>
std::ostream* nil;

Moka::Context all ("**Web++ framework - testing**", [](Moka::Context& it) {
	it.should("Response with 200 and the testing string", []() {
		const std::string text = "sample";
	
		webnetpp::webnetpp app;
		app
		.set_logger(*nil)
		.set_error_logger(*nil)
		.route ("/", [text]() { // static setup
				return webnetpp::response (webnetpp::status_line ("200"), {{"Content-Type", "text/html; charset=utf-8"}}, text);
		});
		
		auto r = (*app.get_routes().begin()).second.call(webnetpp::path_vars());
		must_equal(r.to_string(), "HTTP/ 200 OK\nContent-Type: text/html; charset=utf-8\n\n" + text);
	});
	it.should("Response with 1.1/201 and the username", []() {
		const std::string username = "sample username";
	
		webnetpp::webnetpp app;
		app
		.set_logger(*nil)
		.set_error_logger(*nil)
		.route ("/{username:.*}", [](webnetpp::path_vars v) { // static setup
				return webnetpp::response (webnetpp::status_line ("1.1", "201"), {{"Content-Type", "text/html; charset=utf-8"}}, v["username"]);
		});
		
		auto r = (*app.get_routes().begin()).second.call(webnetpp::path_vars({{"username", username}}));
		must_equal("HTTP/1.1 201 Created\nContent-Type: text/html; charset=utf-8\n\n" + username, r.to_string());
	});
	it.should("Response with 1.1/201, the username and a custom header", []() {
		const std::string username = "sample username", testing_header="testing header";
	
		webnetpp::webnetpp app;
		app
		.set_logger(*nil)
		.set_error_logger(*nil)
		.route ("/{username:.*}", [testing_header](webnetpp::path_vars v) { // static setup
				return webnetpp::response (webnetpp::status_line ("1.1", "201"), {{"Custom-header", testing_header}, {"Content-Type", "text/html; charset=utf-8"}}, v["username"]);
		});
		
		auto r = (*app.get_routes().begin()).second.call(webnetpp::path_vars({{"username", username}}));
		must_equal("HTTP/1.1 201 Created\nContent-Type: text/html; charset=utf-8\nCustom-header: " + testing_header + "\n\n" + username, r.to_string());
	});
	it.should("Pass functional test", [](){
		bool ended = false;
		auto server = [&ended]()
		{
			std::filebuf performance;
			performance.open ("./bin/log/performance.txt",std::ios::out);
			std::ostream performancer (&performance);
			webnetpp::webnetpp app;
			app
			.set_logger(*nil)
			.set_error_logger(*nil)
			.set_performancer(performancer)
			.route ("/", [](webnetpp::path_vars v) { // static setup
					return webnetpp::response (webnetpp::status_line ("1.1", "200"), {{"Content-Type", "text/html; charset=utf-8"}}, "<h1>Hello, World!</h1>");
			})
			.run(8888, 1, 1);
			ended = true;
		};
		std::thread th(server);
		th.detach();
		// sending a single request to /
		system("curl http://localhost:8888/ >> ./bin/log/curl.txt 2>> ./bin/log/log.txt");
		while (not ended) {	}
			
		std::filebuf fb;
		fb.open ("./bin/log/curl.txt",std::ios::in);
		std::istream fin (&fb);
		std::string response; 
		std::getline(fin, response);
		must_equal(response, "<h1>Hello, World!</h1>");
	});
});

int main ()
{
	std::filebuf fb;
	fb.open ("./bin/log/buffer.txt", std::ios::out);
	std::ostream nill (&fb);

	nil = &nill;

	std::cout << "===============================  Testing  ===============================\n";

	Moka::Report report;
	all.test(report);
	report.print();

	return 0;
}