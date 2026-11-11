#' Test a parameter that needs a count
#'
#' @description
#' Runs a series of expectations with incorrect parameter values expecting errors. The values are selected to cover
#' all different manners of incorrect input.
#'
#' A count is defined as single non-negative integer (or integerish number).
#'
#' @inherit fails_for details return
#'
#' @inheritParams needs_scalar
#' @param positive `logical(1)`\cr
#'  Whether to require positive value (i.e. disallow zero).
#'
#' @seealso [checkmate::assert_count()] for \pkg{checkmate} counterpart.
#'
#' @export
needs_count <- function(param, expr, ..., na_ok = FALSE, positive = FALSE, null_ok = FALSE) {
  ellipsis::check_dots_empty()

  checkmate::assert_flag(na_ok)
  checkmate::assert_flag(positive)
  checkmate::assert_flag(null_ok)

  failures <- list(
    TRUE,
    "156",
    list(156L),
    156.5,
    c(156L, 157L),
    integer(),
    -4L
  )

  if (!na_ok) {
    failures <- append(failures, list(
      NA_integer_
    ))
  }

  if (positive) {
    failures <- append(failures, list(
      0L
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
