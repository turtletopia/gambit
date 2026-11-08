#' Test a parameter that needs a character vector
#'
#' @description
#' Runs a series of expectations with incorrect parameter values expecting errors. The values are selected to cover
#' all different manners of incorrect input.
#'
#' @inherit fails_for details return
#'
#' @inheritParams needs_vector
#' @param n_chars `integer(1) | NULL`\cr
#'  Exact length of all strings. If specified, can't specify `min_chars` nor `max_chars`.
#' @param min_chars `integer(1)`\cr
#'  Minimum length of all strings.
#' @param max_chars `integer(1)`\cr
#'  Maximum length of all strings. Must be more than `min_chars`. If these were to be equal, set `n_chars` instead.
#' @param sorted `logical(1)`\cr
#'  Whether elements must be sorted in ascending order.
#' @param typed_missing `logical(1)`\cr
#'  Whether `NA` of non-numeric types should be marked as invalid or not.
#'
#' @seealso [checkmate::assert_character()] for \pkg{checkmate} counterpart.
#'
#' @examples
#' needs_character(
#'   "subset.of",
#'   checkmate::test_names(letters, subset.of = letters),
#'   any_missing = FALSE,
#'   null_ok = TRUE
#' )
#' @export
needs_character <- function(
  param, expr, ...,
  n_chars = NULL, min_chars = 0L, max_chars = Inf, any_missing = TRUE, all_missing = TRUE,
  len = NULL, min_len = 0L, max_len = Inf, unique = FALSE, sorted = FALSE,
  typed_missing = TRUE, null_ok = FALSE
) {
  ellipsis::check_dots_empty()

  assert_bounds(n_chars, min_chars, max_chars)
  checkmate::assert_flag(any_missing)
  checkmate::assert_flag(all_missing)
  assert_bounds(len, min_len, max_len)
  checkmate::assert_flag(unique)
  checkmate::assert_flag(sorted)
  checkmate::assert_flag(typed_missing)
  checkmate::assert_flag(null_ok)

  failures <- list(
    TRUE,
    156L,
    list("string")
  )

  if (!is.null(n_chars)) {
    failures <- append(failures, list(
      paste0(
        rep("x", times = n_chars - 1L),
        collapse = ""
      ),
      paste0(
        rep("x", times = n_chars + 1L),
        collapse = ""
      )
    ))
  }

  if (min_chars > 0L) {
    failures <- append(failures, list(
      "",
      paste0(
        rep("x", times = min_chars - 1L),
        collapse = ""
      )
    ))
  }

  if (max_chars < Inf) {
    failures <- append(failures, list(
      paste0(
        rep("x", times = max_chars + 1L),
        collapse = ""
      )
    ))
  }

  if (!any_missing) {
    failures <- append(failures, list(
      c("string", NA_character_)
    ))
  }

  if (!all_missing) {
    failures <- append(failures, list(
      c(NA_character_, NA_character_, NA_character_),
      character()
    ))
  }

  if (!is.null(len)) {
    failures <- append(failures, list(
      sprintf("string%i", seq_len(len - 1L)),
      sprintf("string%i", seq_len(len + 1L))
    ))
  }

  if (min_len > 0L) {
    failures <- append(failures, list(
      character(),
      sprintf("string%i", seq_len(min_len - 1L))
    ))
  }

  if (max_len < Inf) {
    failures <- append(failures, list(
      sprintf("string%i", seq_len(max_len + 1L))
    ))
  }

  if (unique) {
    failures <- append(failures, list(
      c("one", "two", "one")
    ))
  }

  if (sorted) {
    failures <- append(failures, list(
      c("later", "earlier")
    ))
  }

  if (typed_missing) {
    failures <- append(failures, list(
      NA_integer_
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
