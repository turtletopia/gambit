# `null_ok` --------------------------------------------------------------------
test_arg_null_ok <- function(needs_fn) {
  needs_fn_sym <- rlang::ensym(needs_fn)

  test_that("if `null_ok` then doesn't test NULL", {
    testthat::local_mocked_bindings(
      fails_for = function(expr, param, failures) { failures }
    )

    failures <- needs_fn(
      "x",
      ignored(),
      null_ok = FALSE
    )

    expect_contains(failures, list(NULL))

    failures_2 <- needs_fn(
      "x",
      ignored(),
      null_ok = TRUE
    )

    expect_disjoint(failures_2, list(NULL))
    expect_in(failures_2, failures)
  })

  test_that("`null_ok` must be a flag", {
    rlang::inject(
      needs_flag(
        "null_ok",
        (!!needs_fn_sym)("x", identity(x = 0L))
      )
    )
  })
}
