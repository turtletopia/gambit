#' Test a parameter that needs a string
#'
#' @description
#' Runs a series of expectations with incorrect parameter values expecting errors. The values are selected to cover
#' all different manners of incorrect input.
#'
#' @inherit needs_scalar details return
#'
#' @inheritParams needs_scalar
#' @param n_chars `integer(1) | NULL`\cr
#'  Exact length of the string. If specified, can't specify `min_chars` nor `max_chars`.
#' @param min_chars `integer(1) | NULL`\cr
#'  Minimum length of the string.
#' @param max_chars `integer(1) | NULL`\cr
#'  Maximum length of the string.
#'
#' @examples
#' needs_string(
#'   "pattern",
#'   checkmate::test_string("test", pattern = "st$"),
#'   null_ok = TRUE
#' )
#' @export
needs_string <- function(param, expr, ..., na_ok = FALSE, n_chars = NULL, min_chars = NULL, max_chars = NULL, null_ok = FALSE) {
  ellipsis::check_dots_empty()

  checkmate::assert_string(param)
  checkmate::assert_flag(na_ok)
  checkmate::assert_count(n_chars, null.ok = TRUE)
  checkmate::assert_count(min_chars, null.ok = TRUE)
  checkmate::assert_count(max_chars, null.ok = TRUE)
  checkmate::assert_false(
    !is.null(n_chars) && (!is.null(min_chars) || !is.null(max_chars))
  )
  checkmate::assert_flag(null_ok)

  expr <- rlang::enexpr(expr)
  checkmate::assert_class(expr, "call")
  checkmate::assert_true(rlang::is_call_simple(expr))
  fn <- rlang::eval_bare(expr[[1]])
  checkmate::assert_choice(param, rlang::fn_fmls_names(fn))
  expr <- rlang::call_match(call = expr, fn = fn)

  expect_fails(expr, param, TRUE)
  expect_fails(expr, param, 156L)
  expect_fails(expr, param, list("string"))
  expect_fails(expr, param, c("string", "second"))
  expect_fails(expr, param, character())

  if (!na_ok) {
    expect_fails(expr, param, NA_character_)
  }

  if (!is.null(n_chars)) {
    expect_fails(
      expr, param,
      paste0(
        rep("x", times = n_chars - 1L),
        collapse = ""
      )
    )
    expect_fails(
      expr, param,
      paste0(
        rep("x", times = n_chars + 1L),
        collapse = ""
      )
    )
  }

  if (!is.null(min_chars) && min_chars > 0L) {
    expect_fails(expr, param, "")
    expect_fails(
      expr, param,
      paste0(
        rep("x", times = min_chars - 1L),
        collapse = ""
      )
    )
  }

  if (!is.null(max_chars)) {
    expect_fails(
      expr, param,
      paste0(
        rep("x", times = max_chars + 1L),
        collapse = ""
      )
    )
  }

  if (!null_ok) {
    expect_fails(expr, param, NULL)
  }
}
