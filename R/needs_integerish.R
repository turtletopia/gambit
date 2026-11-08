#' Test if parameter needs an integerish vector
#'
#' @description
#' Runs a series of expectations with incorrect parameter values expecting errors. The values are selected to cover
#' all different manners of incorrect input.
#'
#' An integerish vector is one that can be safely converted to integer, i.e. integer vectors and numeric vectors with
#' values sufficiently close to integers.
#'
#' @inherit fails_for details return
#'
#' @inheritParams needs_vector
#' @param lower `numeric(1)`\cr
#'  Minimum value, all elements of the parameter must be greater than or equal to.
#' @param upper `numeric(1)`\cr
#'  Maximum value, all elements of the parameter must be lower than or equal to.
#' @param sorted `logical(1)`\cr
#'  Whether elements must be sorted in ascending order.
#' @param typed_missing `logical(1)`\cr
#'  Whether `NA` of non-numeric types should be marked as invalid or not.
#'
#' @export
needs_integerish <- function(
  param, expr, ...,
  lower = -Inf, upper = Inf, any_missing = TRUE, all_missing = TRUE,
  len = NULL, min_len = 0L, max_len = Inf, unique = FALSE, sorted = FALSE,
  typed_missing = TRUE, null_ok = FALSE
) {
  ellipsis::check_dots_empty()

  checkmate::assert_number(lower)
  checkmate::assert_number(upper, lower = lower)
  checkmate::assert_flag(any_missing)
  checkmate::assert_flag(all_missing)
  assert_bounds(len, min_len, max_len)
  checkmate::assert_flag(unique)
  checkmate::assert_flag(sorted)
  checkmate::assert_flag(typed_missing)
  checkmate::assert_flag(null_ok)

  failures <- list(
    TRUE,
    "string",
    list(156L),
    c(156, 156.5)
  )

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

  if (!any_missing) {
    failures <- append(failures, list(
      c(156L, NA_integer_)
    ))
  }

  if (!all_missing) {
    failures <- append(failures, list(
      c(NA_real_, NA_real_, NA_real_),
      numeric()
    ))
  }

  if (!is.null(len)) {
    failures <- append(failures, list(
      seq_len(len - 1L),
      seq_len(len + 1L)
    ))
  }

  if (min_len > 0L) {
    failures <- append(failures, list(
      integer(),
      seq_len(min_len - 1L)
    ))
  }

  if (max_len < Inf) {
    failures <- append(failures, list(
      seq_len(max_len + 1L)
    ))
  }

  if (unique) {
    failures <- append(failures, list(
      c(1L, 156L, 1L)
    ))
  }

  if (sorted) {
    failures <- append(failures, list(
      5:1
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
