#' @export
needs_integerish <- function(param, expr, ..., lower = -Inf, upper = Inf, any_missing = FALSE, min_len = NULL, max_len = NULL, null_ok = FALSE) {
  ellipsis::check_dots_empty()

  expr <- rlang::enexpr(expr)
  expr <- rlang::call_match(
    call = expr,
    fn = get(rlang::call_name(expr))
  )

  expect_fails(expr, param, TRUE)
  expect_fails(expr, param, "string")
  expect_fails(expr, param, list(156L))

  if (!any_missing) {
    expect_fails(expr, param, c(156L, NA_integer_))
  }

  if (!null_ok) {
    expect_fails(expr, param, NULL)
  }

  if (lower > -Inf) {
    expect_fails(expr, param, -Inf)
    expect_fails(expr, param, lower - 1L)
  }

  if (upper < Inf) {
    expect_fails(expr, param, Inf)
    expect_fails(expr, param, upper + 1L)
  }

  if (!is.null(min_len) && min_len > 0L) {
    expect_fails(expr, param, integer())
    expect_fails(
      expr, param,
      seq_len(min_len - 1L)
    )
  }

  if (!is.null(max_len)) {
    expect_fails(
      expr, param,
      seq_len(max_len + 1L)
    )
  }
}
