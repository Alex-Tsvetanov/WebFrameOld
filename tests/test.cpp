#include <tests/moka/moka.h>

Moka::Context main ("**TODO: A clean label**", [](Moka::Context& it) {
});

int main ()
{
	std::cout << "===============================  Testing  ===============================\n";
	Moka::Report report;
	main.test(report);
	report.print();
	return 0;
}

