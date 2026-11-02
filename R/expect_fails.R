# TODO: Consider using httptest2::expect_no_request() because tests shouldn't connect to the internet
expect_fails <- function(quo, param, value) {
  # This mock fixes issue where rlang::expr_deparse() would print vectors in angle brackets <>
  #  which made expression execution fail
  testthat::local_mocked_bindings(
    # TODO: Implement own `deparse()` counterpart (e.g. `to_snapshot()`) that handles envs and symbols
    expr_deparse = function(x, ...) { deparse(x) },
    .package = "testthat"
  )

  quo <- rlang::call_modify(quo, "{param}" := value)
  rlang::inject(
    testthat::expect_snapshot(
      !!rlang::quo_get_expr(quo),
      # TODO: Decide what the default should be and whether to allow configuration
      cran = TRUE,
      error = TRUE
    ),
    env = rlang::quo_get_env(quo)
  )
}
