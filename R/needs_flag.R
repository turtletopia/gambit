#' Test a parameter that needs a flag
#'
#' @description
#' Runs a series of expectations with incorrect parameter values expecting errors. The values are selected to cover
#' all different manners of incorrect input.
#'
#' A flag is defined as single logical value.
#'
#' @inherit needs_scalar details return
#'
#' @inheritParams needs_scalar
#'
#' @return Nothing, called for its side effect of running expectations.
#'
#' @examples
#' needs_flag(
#'   "any.missing",
#'   checkmate::test_integer(5L, any.missing = TRUE)
#' )
#' @export
needs_flag <- function(param, expr, ..., na_ok = FALSE, null_ok = FALSE) {
  ellipsis::check_dots_empty()

  checkmate::assert_string(param)
  checkmate::assert_flag(na_ok)
  checkmate::assert_flag(null_ok)

  expr <- rlang::enexpr(expr)
  checkmate::assert_class(expr, "call")
  checkmate::assert_true(rlang::is_call_simple(expr))
  fn <- rlang::eval_bare(expr[[1]])
  checkmate::assert_choice(param, rlang::fn_fmls_names(fn))
  expr <- rlang::call_match(call = expr, fn = fn)

  expect_fails(expr, param, 156L)
  expect_fails(expr, param, "TRUE")
  expect_fails(expr, param, list("TRUE"))
  expect_fails(expr, param, c(TRUE, FALSE))
  expect_fails(expr, param, logical())

  if (!na_ok) {
    expect_fails(expr, param, NA)
  }

  if (!null_ok) {
    expect_fails(expr, param, NULL)
  }
}
