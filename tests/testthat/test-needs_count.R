# Example call -----------------------------------------------------------------
test_that("succeeds with a locally defined function", {
  test_function <- function(x) {
    checkmate::assert_count(x)
  }

  needs_count(
    "x",
    test_function(x = 0L)
  )
})

test_that("succeeds with an imported function", {
  skip("Yet to find an example")
})

# Defaults ---------------------------------------------------------------------
test_that("by default, tests 2+-length vector and 0-length vector", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_count(
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

  failures <- needs_count(
    "x",
    ignored()
  )

  expect_exists(failures, \(failure) {
    checkmate::test_scalar(failure) && !checkmate::test_number(failure)
  })
})

test_that("by default, tests a number not convertible to int", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_count(
    "x",
    ignored()
  )

  expect_exists(failures, \(failure) {
    checkmate::test_number(failure) && !checkmate::test_int(failure)
  })
})

test_that("by default, tests a negative integer", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_count(
    "x",
    ignored()
  )

  expect_exists(failures, \(failure) {
    checkmate::test_int(failure, upper = -1L)
  })
})

# `param` ----------------------------------------------------------------------
test_arg_param(needs_count)

# `na_ok` ----------------------------------------------------------------------
test_arg_na_ok(needs_count, NA_value = NA_integer_)

# `positive` -------------------------------------------------------------------
test_that("if `positive` then tests a zero", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_count(
    "x",
    ignored(),
    positive = TRUE
  )

  expect_contains(failures, list(0L))

  failures_2 <- needs_count(
    "x",
    ignored(),
    positive = FALSE
  )

  expect_disjoint(failures_2, list(0L))
  expect_in(failures_2, failures)
})

test_that("`positive` must be a flag", {
  needs_flag(
    "positive",
    needs_count("x", identity(x = 0L))
  )
})

# `null_ok` --------------------------------------------------------------------
test_arg_null_ok(needs_count)
