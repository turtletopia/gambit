# Example call -----------------------------------------------------------------
test_that("succeeds with a correct call", {
  test_function <- function(x) {
    checkmate::assert_scalar(x)
  }

  needs_scalar(
    "x",
    test_function(x = 3L)
  )

  needs_scalar(
    "n.chars",
    checkmate::test_string("test", n.chars = 4L),
    null_ok = TRUE
  )
})

# Parameter changes ------------------------------------------------------------
test_that("by default, tests NULL and NA", {
  tested <- rlang::env(values = list())
  testthat::local_mocked_bindings(
    expect_fails = function(expr, param, value) {
      tested$values <- append(tested$values, list(value))
    }
  )

  test_function <- function(x) {
    checkmate::assert_scalar(x)
  }

  needs_scalar(
    "x",
    test_function(x = 3L)
  )

  expect_contains(tested$values, list(NULL, NA))
})

test_that("if `null_ok` then doesn't test NULL", {
  tested <- rlang::env(values = list())
  testthat::local_mocked_bindings(
    expect_fails = function(expr, param, value) {
      tested$values <- append(tested$values, list(value))
    }
  )

  test_function <- function(x) {
    checkmate::assert_scalar(x, null.ok = TRUE)
  }

  needs_scalar(
    "x",
    test_function(x = 3L),
    null_ok = TRUE
  )

  expect_contains(tested$values, list(NA))
  expect_disjoint(tested$values, list(NULL))
})

test_that("if `na_ok` then doesn't test NA", {
  tested <- rlang::env(values = list())
  testthat::local_mocked_bindings(
    expect_fails = function(expr, param, value) {
      tested$values <- append(tested$values, list(value))
    }
  )

  test_function <- function(x) {
    checkmate::assert_scalar(x, na.ok = TRUE)
  }

  needs_scalar(
    "x",
    test_function(x = 3L),
    na_ok = TRUE
  )

  expect_contains(tested$values, list(NULL))
  expect_disjoint(tested$values, list(NA))
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
