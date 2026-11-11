#' Test a parameter that needs a single integerish value
#'
#' @description
#' Runs a series of expectations with incorrect parameter values expecting errors. The values are selected to cover
#' all different manners of incorrect input.
#'
#' @inherit fails_for details return
#'
#' @inheritParams needs_scalar
#' @param lower `numeric(1)`\cr
#'  Minimum value of the parameter.
#' @param upper `numeric(1)`\cr
#'  Maximum value of the parameter.
#'
#' @seealso [checkmate::assert_int()] for \pkg{checkmate} counterpart.
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

  checkmate::assert_flag(na_ok)
  checkmate::assert_number(lower)
  checkmate::assert_number(upper, lower = lower)
  checkmate::assert_flag(null_ok)

  failures <- list(
    TRUE,
    "156",
    list(156L),
    156.5,
    c(156L, 157L),
    integer()
  )

  if (!na_ok) {
    failures <- append(failures, list(
      NA_integer_
    ))
  }

  if (lower > -Inf) {
    failures <- append(failures, list(
      -Inf,
      ceiling(lower) - 1L
    ))
  }

  if (upper < Inf) {
    failures <- append(failures, list(
      Inf,
      floor(upper) + 1L
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
