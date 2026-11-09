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
test_that("`param` must be a string", {
  needs_string(
    "param",
    needs_string("x", identity(x = 0L))
  )
})

test_that("`param` must be one of tested function parameters", {
  expect_snapshot(
    needs_string("y", identity(x = 0L)),
    cran = TRUE,
    error = TRUE
  )
})

# `na_ok` ----------------------------------------------------------------------
test_that("if `na_ok` then doesn't test NA", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_string(
    "x",
    ignored(),
    na_ok = FALSE
  )

  expect_contains(failures, list(NA_character_))

  failures_2 <- needs_string(
    "x",
    ignored(),
    na_ok = TRUE
  )

  expect_disjoint(failures_2, list(NA_character_))
  expect_in(failures_2, failures)
})

test_that("`na_ok` must be a flag", {
  needs_flag(
    "na_ok",
    needs_string("x", identity(x = 0L))
  )
})

# `n_chars` --------------------------------------------------------------------
test_that("if `n_chars` not NULL then tests a too short and a too long string", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_string(
    "x",
    ignored(),
    n_chars = 5L
  )

  expect_exists(failures, \(failure) {
    checkmate::test_string(failure, max.chars = 4L)
  })
  expect_exists(failures, \(failure) {
    checkmate::test_string(failure, min.chars = 6L)
  })

  failures_2 <- needs_string(
    "x",
    ignored(),
    n_chars = NULL
  )

  expect_in(failures_2, failures)
})

test_that("`n_chars` must be a count or NULL", {
  skip("Not implemented yet")
  needs_count(
    "n_chars",
    needs_string("x", identity(x = 0L)),
    null_ok = TRUE
  )
})

test_that("`n_chars` can't be supplied with `min_chars` or `max_chars`", {
  expect_snapshot(
    needs_string("x", identity(x = 0L), n_chars = 4L, min_chars = 3L),
    cran = TRUE,
    error = TRUE
  )
  expect_snapshot(
    needs_string("x", identity(x = 0L), n_chars = 4L, max_chars = 5L),
    cran = TRUE,
    error = TRUE
  )
})

# `min_chars` ------------------------------------------------------------------
test_that("if `min_chars` more than 0 then tests a too short string", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_string(
    "x",
    ignored(),
    min_chars = 5L
  )

  expect_exists(failures, \(failure) {
    checkmate::test_string(failure, max.chars = 4L)
  })

  failures_2 <- needs_string(
    "x",
    ignored(),
    min_chars = 0L
  )

  expect_in(failures_2, failures)
})

test_that("`min_chars` must be a count", {
  skip("Not implemented yet")
  needs_count(
    "min_chars",
    needs_string("x", identity(x = 0L))
  )
})

# `max_chars` ------------------------------------------------------------------
test_that("if `max_chars` less than Inf then tests a too long string", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_string(
    "x",
    ignored(),
    max_chars = 5L
  )

  expect_exists(failures, \(failure) {
    checkmate::test_string(failure, min.chars = 6L)
  })

  failures_2 <- needs_string(
    "x",
    ignored(),
    max_chars = Inf
  )

  expect_in(failures_2, failures)
})

test_that("`max_chars` must be a count", {
  skip("Not implemented yet")
  needs_count(
    "max_chars",
    needs_string("x", identity(x = 0L))
  )
})

test_that("`max_chars` must exceed `min_chars`", {
  expect_snapshot(
    needs_string("x", identity(x = 0L), max_chars = 0L),
    cran = TRUE,
    error = TRUE
  )
  expect_snapshot(
    needs_string("x", identity(x = 0L), min_chars = 5L, max_chars = 3L),
    cran = TRUE,
    error = TRUE
  )
})

# `null_ok` --------------------------------------------------------------------
test_arg_null_ok(needs_string)
