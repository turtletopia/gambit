fails_for <- function(param, expr, failures) {
  checkmate::assert_string(param)
  checkmate::assert_list(failures)

  quo <- rlang::enquo(expr)
  expr <- rlang::quo_get_expr(quo)
  checkmate::assert_true(rlang::is_call_simple(expr))

  fn <- rlang::eval_bare(
    expr[[1]],
    env = rlang::quo_get_env(quo)
  )
  checkmate::assert_choice(param, rlang::fn_fmls_names(fn))

  expr <- rlang::call_match(call = expr, fn = fn)
  quo <- rlang::quo_set_expr(quo, expr)

  for (failure in failures) {
    expect_fails(quo, param, failure)
  }
}
