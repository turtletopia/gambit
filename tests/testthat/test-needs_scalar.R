# Example call -----------------------------------------------------------------
test_that("succeeds with a locally defined function", {
  test_function <- function(x) {
    checkmate::assert_scalar(x)
  }

  needs_scalar(
    "x",
    test_function(x = 3L)
  )
})

test_that("succeeds with an imported function", {
  needs_scalar(
    "n.chars",
    checkmate::test_string("test", n.chars = 4L),
    null_ok = TRUE
  )
})

# Parameter changes ------------------------------------------------------------
test_that("by default, tests NULL and NA", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_scalar(
    "x",
    ignored()
  )

  expect_contains(failures, list(NULL, NA))
})

test_that("if `null_ok` then doesn't test NULL", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_scalar(
    "x",
    ignored(),
    null_ok = TRUE
  )

  expect_contains(failures, list(NA))
  expect_disjoint(failures, list(NULL))
})

test_that("if `na_ok` then doesn't test NA", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_scalar(
    "x",
    ignored(),
    na_ok = TRUE
  )

  expect_contains(failures, list(NULL))
  expect_disjoint(failures, list(NA))
})

# Parameter assertions ---------------------------------------------------------
test_that("`param` must be a string", {
  needs_string(
    "param",
    needs_scalar("x", identity(x = 0L))
  )
})

test_that("`param` must be one of tested function parameters", {
  expect_snapshot(
    needs_scalar("y", identity(x = 0L)),
    cran = TRUE,
    error = TRUE
  )
})

test_that("`na_ok` must be a flag", {
  needs_flag(
    "na_ok",
    needs_scalar("x", identity(x = 0L))
  )
})

test_that("`null_ok` must be a flag", {
  needs_flag(
    "null_ok",
    needs_scalar("x", identity(x = 0L))
  )
})
