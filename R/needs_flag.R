#' @export
needs_flag <- function(param, expr, ..., na_ok = FALSE, null_ok = FALSE) {
  ellipsis::check_dots_empty()

  expr <- rlang::enexpr(expr)
  expr <- rlang::call_match(
    call = expr,
    fn = get(rlang::call_name(expr))
  )

  expect_fails(expr, param, 156L)
  expect_fails(expr, param, "TRUE")
  expect_fails(expr, param, list("TRUE"))
  expect_fails(expr, param, c(TRUE, FALSE))
  expect_fails(expr, param, logical())

  if (!na_ok) {
    expect_fails(expr, param, NA)
  }

  if (!null_ok) {
    expect_fails(expr, param, NULL)
  }
}
