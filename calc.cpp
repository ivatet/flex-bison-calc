#include <iostream>
#include <string>
#include <map>

typedef std::map<std::string, int> var_map;
static var_map calc_var_map;

#ifdef __cplusplus
extern "C" {
#endif

#include "calc.tab.h"

void calc_set_var(const char *s, int val)
{
	calc_var_map[s] = val;

	std::cout << val << std::endl;
}

int calc_get_var(const char *s, int *val)
{
	var_map::iterator it = calc_var_map.find(s);

	if (it != calc_var_map.end()) {
		*val = it->second;
		return 0;
	} else {
		std::cerr << "variable " << s << " is not set" <<std::endl;
		return -1;
	}
}

void calc_expr(int val)
{
	std::cout << val << std::endl;
}

void calc_error(const char *s)
{
	std::cout << s << std::endl;
}

#ifdef __cplusplus
}
#endif

int main(int argc, char *argv[])
{
	yyparse();
	return 0;
}
