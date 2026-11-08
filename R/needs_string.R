#' Test a parameter that needs a string
#'
#' @description
#' Runs a series of expectations with incorrect parameter values expecting errors. The values are selected to cover
#' all different manners of incorrect input.
#'
#' @inherit fails_for details return
#'
#' @inheritParams needs_scalar
#' @param n_chars `integer(1) | NULL`\cr
#'  Exact length of the string. If specified, can't specify `min_chars` nor `max_chars`.
#' @param min_chars `integer(1)`\cr
#'  Minimum length of the string.
#' @param max_chars `integer(1)`\cr
#'  Maximum length of all strings. Must be more than `min_chars`. If these were to be equal, set `n_chars` instead.
#'
#' @seealso [checkmate::assert_string()] for \pkg{checkmate} counterpart.
#'
#' @examples
#' needs_string(
#'   "pattern",
#'   checkmate::test_string("test", pattern = "st$"),
#'   null_ok = TRUE
#' )
#' @export
needs_string <- function(param, expr, ..., na_ok = FALSE, n_chars = NULL, min_chars = 0L, max_chars = Inf, null_ok = FALSE) {
  ellipsis::check_dots_empty()

  checkmate::assert_flag(na_ok)
  assert_bounds(n_chars, min_chars, max_chars)
  checkmate::assert_flag(null_ok)

  failures <- list(
    TRUE,
    156L,
    list("string"),
    c("string", "second"),
    character()
  )

  if (!na_ok) {
    failures <- append(failures, list(
      NA_character_
    ))
  }

  # TODO: Handle case of `n_chars` = 0 (incl. other such args and other functions)
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

  if (!null_ok) {
    failures <- append(failures, list(
      NULL
    ))
  }

  rlang::inject(
    fails_for(param, !!rlang::enquo(expr), failures)
  )
}
