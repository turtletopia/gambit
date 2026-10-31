#' @export
needs_int <- function(param, expr, ..., na_ok = FALSE, lower = -Inf, upper = Inf, null_ok = FALSE) {
  ellipsis::check_dots_empty()

  expr <- rlang::enexpr(expr)
  expr <- rlang::call_match(
    call = expr,
    fn = get(rlang::call_name(expr))
  )

  expect_fails(expr, param, TRUE)
  expect_fails(expr, param, "156")
  expect_fails(expr, param, list(156L))
  expect_fails(expr, param, 15.6)
  expect_fails(expr, param, c(156L, 157L))
  expect_fails(expr, param, integer())

  if (!na_ok) {
    expect_fails(expr, param, NA_integer_)
  }

  if (lower > -Inf) {
    expect_fails(expr, param, -Inf)
    expect_fails(expr, param, lower - 1L)
  }

  if (upper < Inf) {
    expect_fails(expr, param, Inf)
    expect_fails(expr, param, upper + 1L)
  }

  if (!null_ok) {
    expect_fails(expr, param, NULL)
  }
}
