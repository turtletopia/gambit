#' Test a parameter that needs a single atomic value
#'
#' @description
#' Runs a series of expectations with incorrect parameter values expecting errors. The values are selected to cover
#' all different manners of incorrect input.
#'
#' @details
#' Uses [testthat::expect_snapshot()] under the hood.
#'
#' @inherit fails_for details return
#'
#' @inheritParams fails_for
#' @param ...
#'  Reserved for future extensions and must be empty.
#' @param na_ok `logical(1)`\cr
#'  Whether missing values are allowed or not.
#' @param null_ok `logical(1)`\cr
#'  Whether `NULL` is also allowed or not.
#'
#' @return Nothing, called for its side effect of running expectations.
#'
#' @examples
#' test_function <- function(x) {
#'   checkmate::assert_scalar(x)
#' }
#'
#' needs_scalar(
#'   "x",
#'   test_function(x = 3L)
#' )
#' @export
needs_scalar <- function(param, expr, ..., na_ok = FALSE, null_ok = FALSE) {
  ellipsis::check_dots_empty()

  checkmate::assert_flag(na_ok)
  checkmate::assert_flag(null_ok)

  failures <- list(
    list(1L),
    c(TRUE, FALSE),
    character()
  )

  if (!na_ok) {
    failures <- append(failures, list(
      NA
    ))
  }

  if (!null_ok) {
    failures <- append(failures, list(
      NULL
    ))
  }

  rlang::inject(
    fails_for(param, !!rlang::enquo(expr), failures)
  )
}
