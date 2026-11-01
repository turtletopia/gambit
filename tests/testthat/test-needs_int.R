# Example call -----------------------------------------------------------------
test_that("succeeds with a locally defined function", {
  test_function <- function(x) {
    checkmate::assert_int(x)
  }

  needs_int(
    "x",
    test_function(x = 0L)
  )
})

test_that("succeeds with an imported function", {
  needs_int(
    "min.chars",
    checkmate::test_string("test", min.chars = 3),
    null_ok = TRUE
  )
})

# Parameter changes ------------------------------------------------------------
test_that("by default, tests NULL and NA", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_int(
    "x",
    ignored()
  )

  expect_contains(failures, list(NULL, NA_integer_))
})

test_that("if `null_ok` then doesn't test NULL", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_int(
    "x",
    ignored(),
    null_ok = TRUE
  )

  expect_contains(failures, list(NA_integer_))
  expect_disjoint(failures, list(NULL))
})

test_that("if `na_ok` then doesn't test NA", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_int(
    "x",
    ignored(),
    na_ok = TRUE
  )

  expect_contains(failures, list(NULL))
  expect_disjoint(failures, list(NA_integer_))
})

test_that("if `lower` above -Inf then tests a too low value", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_int(
    "x",
    ignored(),
    lower = 5
  )

  expect_contains(failures, list(NULL, NA_integer_, -Inf, 4L))
})

test_that("if `upper` below Inf then tests a too high value", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_int(
    "x",
    ignored(),
    upper = 5
  )

  expect_contains(failures, list(NULL, NA_integer_, Inf, 6L))
})

# Parameter assertions ---------------------------------------------------------
test_that("`param` must be a string", {
  needs_string(
    "param",
    needs_int("x", identity(x = 0L))
  )
})

test_that("`param` must be one of tested function parameters", {
  expect_snapshot(
    needs_int("y", identity(x = 0L)),
    cran = TRUE,
    error = TRUE
  )
})

test_that("`na_ok` must be a flag", {
  needs_flag(
    "na_ok",
    needs_int("x", identity(x = 0L))
  )
})

test_that("`lower` must be a number or NULL", {
  skip("Not implemented yet")
  needs_number(
    "lower",
    needs_int("x", identity(x = 0L)),
    null_ok = TRUE
  )
})

test_that("`upper` must be a number or NULL", {
  skip("Not implemented yet")
  needs_number(
    "upper",
    needs_int("x", identity(x = 0L)),
    null_ok = TRUE
  )
})

test_that("`null_ok` must be a flag", {
  needs_flag(
    "null_ok",
    needs_int("x", identity(x = 0L))
  )
})
