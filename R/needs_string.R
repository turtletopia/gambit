#' @export
needs_string <- function(param, expr, ..., na_ok = FALSE, n_chars = NULL, min_chars = NULL, max_chars = NULL, null_ok = FALSE) {
  ellipsis::check_dots_empty()

  expr <- rlang::enexpr(expr)
  expr <- rlang::call_match(
    call = expr,
    fn = get(rlang::call_name(expr))
  )

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
