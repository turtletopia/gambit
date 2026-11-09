#' Test a parameter that needs a logical vector
#'
#' @description
#' Runs a series of expectations with incorrect parameter values expecting errors. The values are selected to cover
#' all different manners of incorrect input.
#'
#' @inherit fails_for details return
#'
#' @inheritParams needs_vector
#' @param typed_missing `logical(1)`\cr
#'  Whether `NA` of non-numeric types should be marked as invalid or not.
#'
#' @seealso [checkmate::assert_logical()] for \pkg{checkmate} counterpart.
#'
#' @export
needs_logical <- function(
  param, expr, ...,
  any_missing = TRUE, all_missing = TRUE,
  len = NULL, min_len = 0L, max_len = Inf, unique = FALSE,
  typed_missing = TRUE, null_ok = FALSE
) {
  ellipsis::check_dots_empty()

  checkmate::assert_flag(any_missing)
  checkmate::assert_flag(all_missing)
  assert_bounds(len, min_len, max_len)
  checkmate::assert_flag(unique)
  checkmate::assert_flag(typed_missing)
  checkmate::assert_flag(null_ok)

  failures <- list(
    156L,
    "TRUE",
    list(TRUE)
  )

  if (!any_missing) {
    failures <- append(failures, list(
      c(TRUE, FALSE, NA)
    ))
  }

  if (!all_missing) {
    failures <- append(failures, list(
      c(NA, NA, NA),
      logical()
    ))
  }

  if (!is.null(len)) {
    failures <- append(failures, list(
      rep(TRUE, times = len - 1L),
      rep(TRUE, times = len + 1L)
    ))
  }

  if (min_len > 0L) {
    failures <- append(failures, list(
      logical(),
      rep(TRUE, times = min_len - 1L)
    ))
  }

  if (max_len < Inf) {
    failures <- append(failures, list(
      rep(TRUE, times = max_len + 1L)
    ))
  }

  if (unique) {
    failures <- append(failures, list(
      c(TRUE, FALSE, TRUE)
    ))
  }

  if (typed_missing) {
    failures <- append(failures, list(
      NA_character_
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
