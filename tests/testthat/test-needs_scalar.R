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
test_arg_param(needs_scalar)

# `na_ok` ----------------------------------------------------------------------
test_arg_na_ok(needs_scalar)

# `null_ok` --------------------------------------------------------------------
test_arg_null_ok(needs_scalar)
