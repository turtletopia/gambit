# Example call -----------------------------------------------------------------
test_that("succeeds with a locally defined function", {
  test_function <- function(x) {
    checkmate::assert_string(x)
  }

  needs_string(
    "x",
    test_function(x = "test")
  )
})

test_that("succeeds with an imported function", {
  needs_string(
    "pattern",
    checkmate::test_string("test", pattern = "st$"),
    null_ok = TRUE
  )
})

# Defaults ---------------------------------------------------------------------
test_that("by default, tests 2+-length vector and 0-length vector", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_string(
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

  failures <- needs_string(
    "x",
    ignored()
  )

  expect_exists(failures, \(failure) {
    checkmate::test_scalar(failure) && !checkmate::test_string(failure)
  })
})

# `param` ----------------------------------------------------------------------
test_arg_param(needs_string)

# `na_ok` ----------------------------------------------------------------------
test_arg_na_ok(needs_string, NA_value = NA_character_)

# `n_chars` --------------------------------------------------------------------
test_arg_n_chars(needs_string, checkmate::test_string)

# `min_chars` ------------------------------------------------------------------
test_arg_min_chars(needs_string, checkmate::test_string)

# `max_chars` ------------------------------------------------------------------
test_arg_max_chars(needs_string, checkmate::test_string)

# `null_ok` --------------------------------------------------------------------
test_arg_null_ok(needs_string)
