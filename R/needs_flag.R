#' Test a parameter that needs a flag
#'
#' @description
#' Runs a series of expectations with incorrect parameter values expecting errors. The values are selected to cover
#' all different manners of incorrect input.
#'
#' A flag is defined as single logical value.
#'
#' @inherit fails_for details return
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

  checkmate::assert_flag(na_ok)
  checkmate::assert_flag(null_ok)

  failures <- list(
    156L,
    "TRUE",
    list("TRUE"),
    c(TRUE, FALSE),
    logical()
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
