# TODO: Consider using httptest2::expect_no_request() because tests shouldn't connect to the internet
expect_fails <- function(expr, param, value) {
  # This mock fixes issue where rlang::expr_deparse() would print vectors in angle brackets <>
  #  which made expression execution fail
  testthat::local_mocked_bindings(
    expr_deparse = function(x, ...) { deparse(x) },
    .package = "testthat"
  )

  call <- rlang::call_modify(expr, "{param}" := value)
  rlang::inject(
    testthat::expect_snapshot(
      !!call,
      # TODO: Decide what the default should be and whether to allow configuration
      cran = TRUE,
      error = TRUE
    )
  )
}
