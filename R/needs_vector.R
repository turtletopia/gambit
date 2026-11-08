#' Test a parameter that needs a vector
#'
#' @description
#' Runs a series of expectations with incorrect parameter values expecting errors. The values are selected to cover
#' all different manners of incorrect input.
#'
#' @inherit fails_for details return
#'
#' @inheritParams needs_scalar
#' @param strict `logical(1)`\cr
#'  Whether to disallow the vector to have additional attributes; if `FALSE`, allows e.g. factors and data frames.
#' @param any_missing `logical(1)`\cr
#'  Whether missing values are allowed or not.
#' @param all_missing `logical(1)`\cr
#'  Whether vectors with no non-missing values are allowed or not.
#' @param len `integer(1) | NULL`\cr
#'  Exact length of the vector. If specified, can't specify `min_len` nor `max_len`.
#' @param min_len `integer(1)`\cr
#'  Minimum length of the vector.
#' @param max_len `integer(1)`\cr
#'  Maximum length of the vector. Must be more than `min_len`. If these were to be equal, set `len` instead.
#' @param unique `logical(1)`\cr
#'  Whether all values must be unique or not.
#'
#' @examples
#' needs_vector(
#'   "subset.of",
#'   checkmate::test_names(letters[1:5], subset.of = letters),
#'   any_missing = FALSE,
#'   null_ok = TRUE
#' )
#' @export
needs_vector <- function(
  param, expr, ...,
  strict = FALSE, any_missing = TRUE, all_missing = TRUE,
  len = NULL, min_len = 0L, max_len = Inf, unique = FALSE, null_ok = FALSE
) {
  # TODO: Think about `named`
  ellipsis::check_dots_empty()

  checkmate::assert_flag(strict)
  checkmate::assert_flag(any_missing)
  checkmate::assert_flag(all_missing)
  assert_bounds(len, min_len, max_len)
  checkmate::assert_flag(unique)
  checkmate::assert_flag(null_ok)

  failures <- list(
    # rlang::env(),
    # rlang::sym("test")
  )

  if (strict) {
    failures <- append(failures, list(
      structure(
        1:5,
        color = "violet"
      )
    ))
  }

  if (!any_missing) {
    failures <- append(failures, list(
      c(1:5, NA_integer_)
    ))
  }

  if (!all_missing) {
    failures <- append(failures, list(
      c(NA, NA, NA),
      numeric()
    ))
  }

  if (!is.null(len)) {
    failures <- append(failures, list(
      rep("x", times = len - 1L),
      rep("x", times = len + 1L)
    ))
  }

  if (min_len > 0L) {
    failures <- append(failures, list(
      character(),
      rep("x", times = min_len - 1L)
    ))
  }

  if (max_len < Inf) {
    failures <- append(failures, list(
      rep("x", times = max_len + 1L)
    ))
  }

  if (unique) {
    failures <- append(failures, list(
      c(TRUE, FALSE, TRUE)
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
