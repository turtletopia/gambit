#' Test a parameter that needs a single atomic value
#'
#' @description
#' Runs a series of expectations with incorrect parameter values expecting errors. The values are selected to cover
#' all different manners of incorrect input.
#'
#' @details
#' Uses [testthat::expect_snapshot()] under the hood.
#'
#' @param param `character(1)`\cr
#'  Name of the parameter to test.
#' @param expr `call(1)`\cr
#'  Example call to the tested function that does not fail.
#' @param ...
#'  Reserved for future extensions and must be empty.
#' @param na_ok `logical(1)`\cr
#'  Whether missing values are allowed or not.
#' @param null_ok `logical(1)`\cr
#'  Whether `NULL` is also allowed or not.
#'
#' @return Nothing, called for its side effect of running expectations.
#'
#' @export
needs_scalar <- function(param, expr, ..., na_ok = FALSE, null_ok = FALSE) {
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

  expect_fails(expr, param, list(1L))
  expect_fails(expr, param, c(TRUE, FALSE))
  expect_fails(expr, param, character())

  if (!na_ok) {
    expect_fails(expr, param, NA)
  }

  if (!null_ok) {
    expect_fails(expr, param, NULL)
  }
}
