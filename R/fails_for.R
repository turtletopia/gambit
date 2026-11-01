#' Test a parameter against failing values
#'
#' @description
#' Runs a series of expectations with incorrect parameter values expecting errors. The values are supplied by the user.
#'
#' @details
#' Uses [testthat::expect_snapshot()] under the hood.
#'
#' @param param `character(1)`\cr
#'  Name of the parameter to test.
#' @param expr `call(1)`\cr
#'  Example call to the tested function that does not fail.
#' @param failures `list()`\cr
#'  Values that should fail assertions when passed to the tested function as `param` value.
#'
#' @return Nothing, called for its side effect of running expectations.
#'
#' @examples
#' fails_for(
#'   "os",
#'   checkmate::test_os("linux"),
#'   list(
#'     0L,
#'     character(),
#'     "chromium"
#'   )
#' )
#' @export
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
