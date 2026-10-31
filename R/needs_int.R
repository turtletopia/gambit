#' Test a parameter that needs a single integerish value
#'
#' @description
#' Runs a series of expectations with incorrect parameter values expecting errors. The values are selected to cover
#' all different manners of incorrect input.
#'
#' @inherit needs_scalar details return
#'
#' @inheritParams needs_scalar
#' @param lower `numeric(1)`\cr
#'  Minimum value of the parameter.
#' @param upper `numeric(1)`\cr
#'  Maximum value of the parameter.
#'
#' @examples
#' needs_int(
#'   "min.chars",
#'   checkmate::test_string("test", min.chars = 3),
#'   null_ok = TRUE
#' )
#' @export
needs_int <- function(param, expr, ..., na_ok = FALSE, lower = -Inf, upper = Inf, null_ok = FALSE) {
  ellipsis::check_dots_empty()

  checkmate::assert_string(param)
  checkmate::assert_flag(na_ok)
  checkmate::assert_number(lower)
  checkmate::assert_number(upper)
  checkmate::assert_flag(null_ok)

  expr <- rlang::enexpr(expr)
  checkmate::assert_class(expr, "call")
  checkmate::assert_true(rlang::is_call_simple(expr))
  fn <- rlang::eval_bare(expr[[1]])
  checkmate::assert_choice(param, rlang::fn_fmls_names(fn))
  expr <- rlang::call_match(call = expr, fn = fn)

  expect_fails(expr, param, TRUE)
  expect_fails(expr, param, "156")
  expect_fails(expr, param, list(156L))
  expect_fails(expr, param, 15.6)
  expect_fails(expr, param, c(156L, 157L))
  expect_fails(expr, param, integer())

  if (!na_ok) {
    expect_fails(expr, param, NA_integer_)
  }

  if (lower > -Inf) {
    expect_fails(expr, param, -Inf)
    expect_fails(expr, param, ceiling(lower) - 1L)
  }

  if (upper < Inf) {
    expect_fails(expr, param, Inf)
    expect_fails(expr, param, floor(upper) + 1L)
  }

  if (!null_ok) {
    expect_fails(expr, param, NULL)
  }
}
