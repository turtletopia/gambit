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

# Defaults ---------------------------------------------------------------------
test_that("by default, tests 2+-length vector and 0-length vector", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_scalar(
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

# `param` ----------------------------------------------------------------------
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

# `na_ok` ----------------------------------------------------------------------
test_that("if `na_ok` then doesn't test NA", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_scalar(
    "x",
    ignored(),
    na_ok = FALSE
  )

  expect_contains(failures, list(NA))

  failures_2 <- needs_scalar(
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
    needs_scalar("x", identity(x = 0L))
  )
})

# `null_ok` --------------------------------------------------------------------
test_that("if `null_ok` then doesn't test NULL", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_scalar(
    "x",
    ignored(),
    null_ok = FALSE
  )

  expect_contains(failures, list(NULL))

  failures_2 <- needs_scalar(
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
    needs_scalar("x", identity(x = 0L))
  )
})
