# Example call -----------------------------------------------------------------
test_that("succeeds with a locally defined function", {
  test_function <- function(x) {
    checkmate::assert_flag(x)
  }

  needs_flag(
    "x",
    test_function(x = TRUE)
  )
})

test_that("succeeds with an imported function", {
  needs_flag(
    "any.missing",
    checkmate::test_integer(5L, any.missing = TRUE)
  )
})

# Defaults ---------------------------------------------------------------------
test_that("by default, tests 2+-length vector and 0-length vector", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_flag(
    "x",
    ignored()
  )

  expect_exists(failures, \(failure) {
    checkmate::test_vector(failure, min.len = 2L)
  })
  expect_exists(failures, \(failure) {
    checkmate::test_vector(failure, len = 0L)
  })
})

test_that("by default, tests a scalar of mismatched type", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_flag(
    "x",
    ignored()
  )

  expect_exists(failures, \(failure) {
    checkmate::test_scalar(failure) && !checkmate::test_flag(failure)
  })
})

# `param` ----------------------------------------------------------------------
test_that("`param` must be a string", {
  needs_string(
    "param",
    needs_flag("x", identity(x = 0L))
  )
})

test_that("`param` must be one of tested function parameters", {
  expect_snapshot(
    needs_flag("y", identity(x = 0L)),
    cran = TRUE,
    error = TRUE
  )
})

# `na_ok` ----------------------------------------------------------------------
test_that("if `na_ok` then doesn't test NA", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_flag(
    "x",
    ignored(),
    na_ok = FALSE
  )

  expect_contains(failures, list(NA))

  failures_2 <- needs_flag(
    "x",
    ignored(),
    na_ok = TRUE
  )

  expect_disjoint(failures_2, list(NA))
  expect_in(failures_2, failures)
})

test_that("`na_ok` must be a flag", {
  needs_flag(
    "na_ok",
    needs_flag("x", identity(x = 0L))
  )
})

# `null_ok` --------------------------------------------------------------------
test_that("if `null_ok` then doesn't test NULL", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_flag(
    "x",
    ignored(),
    null_ok = FALSE
  )

  expect_contains(failures, list(NULL))

  failures_2 <- needs_flag(
    "x",
    ignored(),
    null_ok = TRUE
  )

  expect_disjoint(failures_2, list(NULL))
  expect_in(failures_2, failures)
})

test_that("`null_ok` must be a flag", {
  needs_flag(
    "null_ok",
    needs_flag("x", identity(x = 0L))
  )
})
