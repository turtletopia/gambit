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

# Defaults ---------------------------------------------------------------------
test_that("by default, tests 2+-length vector and 0-length vector", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_int(
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

  failures <- needs_int(
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

  failures <- needs_int(
    "x",
    ignored()
  )

  expect_exists(failures, \(failure) {
    checkmate::test_number(failure) && !checkmate::test_int(failure)
  })
})

# `param` ----------------------------------------------------------------------
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

# `na_ok` ----------------------------------------------------------------------
test_that("if `na_ok` then doesn't test NA", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_int(
    "x",
    ignored(),
    na_ok = FALSE
  )

  expect_contains(failures, list(NA_integer_))

  failures_2 <- needs_int(
    "x",
    ignored(),
    na_ok = TRUE
  )

  expect_disjoint(failures_2, list(NA_integer_))
  expect_in(failures_2, failures)
})

test_that("`na_ok` must be a flag", {
  needs_flag(
    "na_ok",
    needs_int("x", identity(x = 0L))
  )
})

# `lower` ----------------------------------------------------------------------
test_that("if `lower` above -Inf then tests a too low value", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_int(
    "x",
    ignored(),
    lower = 5L
  )

  expect_exists(failures, \(failure) {
    checkmate::test_int(failure, upper = 4L)
  })

  failures_2 <- needs_int(
    "x",
    ignored(),
    lower = -Inf
  )

  expect_in(failures_2, failures)
})

test_that("`lower` must be a number", {
  skip("Not implemented yet")
  needs_number(
    "lower",
    needs_int("x", identity(x = 0L))
  )
})

# `upper` ----------------------------------------------------------------------
test_that("if `upper` below Inf then tests a too high value", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_int(
    "x",
    ignored(),
    upper = 5L
  )

  expect_exists(failures, \(failure) {
    checkmate::test_int(failure, lower = 6L)
  })

  failures_2 <- needs_int(
    "x",
    ignored(),
    upper = Inf
  )

  expect_in(failures_2, failures)
})

test_that("`upper` must be a number", {
  skip("Not implemented yet")
  needs_number(
    "upper",
    needs_int("x", identity(x = 0L))
  )
})

test_that("`upper` must not be less than `lower`", {
  expect_snapshot(
    needs_int("x", identity(x = 0L), lower = 5L, upper = 3L),
    cran = TRUE,
    error = TRUE
  )
})

# `null_ok` --------------------------------------------------------------------
test_that("if `null_ok` then doesn't test NULL", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_int(
    "x",
    ignored(),
    null_ok = FALSE
  )

  expect_contains(failures, list(NULL))

  failures_2 <- needs_int(
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
    needs_int("x", identity(x = 0L))
  )
})
