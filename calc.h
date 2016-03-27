#ifndef __CALC_H__
#define __CALC_H__

#ifdef __cplusplus
extern "C" {
#endif

void calc_set_var(const char *s, int val);
int calc_get_var(const char *s, int *val);

void calc_expr(int val);
void calc_error(const char *s);

#ifdef __cplusplus
}
#endif

#endif /* __CALC_H__ */
