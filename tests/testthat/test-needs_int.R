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
test_arg_param(needs_int)

# `na_ok` ----------------------------------------------------------------------
test_arg_na_ok(needs_int, NA_value = NA_integer_)

# `lower` ----------------------------------------------------------------------
test_arg_lower(needs_int, checkmate::test_int)

# `upper` ----------------------------------------------------------------------
test_arg_upper(needs_int, checkmate::test_int)

# `null_ok` --------------------------------------------------------------------
test_arg_null_ok(needs_int)
