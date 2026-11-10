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
test_arg_param(needs_flag)

# `na_ok` ----------------------------------------------------------------------
test_arg_na_ok(needs_flag)

# `null_ok` --------------------------------------------------------------------
test_arg_null_ok(needs_flag)
