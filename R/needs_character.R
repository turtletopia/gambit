#' @export
needs_character <- function(param, expr, ..., any_missing = FALSE, min_len = NULL, max_len = NULL, null_ok = FALSE) {
  ellipsis::check_dots_empty()

  expr <- rlang::enexpr(expr)
  expr <- rlang::call_match(
    call = expr,
    fn = get(rlang::call_name(expr))
  )

  expect_fails(expr, param, TRUE)
  expect_fails(expr, param, 156L)
  expect_fails(expr, param, list("string"))

  if (!any_missing) {
    expect_fails(expr, param, c("string", NA_character_))
  }

  if (!null_ok) {
    expect_fails(expr, param, NULL)
  }

  if (!is.null(min_len) && min_len > 0L) {
    expect_fails(expr, param, character())
    expect_fails(
      expr, param,
      sprintf("string%i", seq_len(min_len - 1L))
    )
  }

  if (!is.null(max_len)) {
    expect_fails(
      expr, param,
      sprintf("string%i", seq_len(max_len + 1L))
    )
  }
}
