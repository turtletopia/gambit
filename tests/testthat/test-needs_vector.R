# Example call -----------------------------------------------------------------
test_that("succeeds with a locally defined function", {
  test_function <- function(x) {
    checkmate::assert_vector(x)
  }

  needs_vector(
    "x",
    test_function(x = 1:5)
  )
})

test_that("succeeds with an imported function", {
  needs_vector(
    "subset.of",
    checkmate::test_names(letters[1:5], subset.of = letters),
    any_missing = FALSE,
    null_ok = TRUE
  )
})

# `param` ----------------------------------------------------------------------
test_that("`param` must be a string", {
  needs_string(
    "param",
    needs_vector("x", identity(x = 0L))
  )
})

test_that("`param` must be one of tested function parameters", {
  expect_snapshot(
    needs_vector("y", identity(x = 0L)),
    cran = TRUE,
    error = TRUE
  )
})

# `strict` ---------------------------------------------------------------------
test_that("if `strict` then tests a vector with attributes", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_vector(
    "x",
    ignored(),
    strict = TRUE
  )

  expect_exists(failures, \(failure) {
    !is.null(attributes(failure))
  })

  failures_2 <- needs_vector(
    "x",
    ignored(),
    strict = FALSE
  )

  expect_in(failures_2, failures)
})

test_that("`strict` must be a flag", {
  needs_flag(
    "strict",
    needs_vector("x", identity(x = 0L))
  )
})

# `any_missing` ----------------------------------------------------------------
test_that("if not `any_missing` then tests a vector with NA", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_vector(
    "x",
    ignored(),
    any_missing = FALSE
  )

  expect_exists(failures, \(failure) {
    anyNA(failure)
  })

  failures_2 <- needs_vector(
    "x",
    ignored(),
    any_missing = TRUE
  )

  expect_in(failures_2, failures)
})

test_that("`any_missing` must be a flag", {
  needs_flag(
    "any_missing",
    needs_vector("x", identity(x = 0L))
  )
})

# `all_missing` ----------------------------------------------------------------
test_that("if not `all_missing` then tests a vector with no non-missing values", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_vector(
    "x",
    ignored(),
    all_missing = FALSE
  )

  # Covers vectors with only NA
  expect_exists(failures, \(failure) {
    checkmate::test_vector(failure, min.len = 1L) &&
      all(is.na(failure))
  })
  # Covers length-0 vectors
  expect_exists(failures, \(failure) {
    checkmate::test_vector(failure, len = 0L)
  })

  failures_2 <- needs_vector(
    "x",
    ignored(),
    all_missing = TRUE
  )

  expect_in(failures_2, failures)
})

test_that("`all_missing` must be a flag", {
  needs_flag(
    "all_missing",
    needs_vector("x", identity(x = 0L))
  )
})

# `len` ------------------------------------------------------------------------
test_that("if `len` not NULL then tests a too short and a too long vector", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_vector(
    "x",
    ignored(),
    len = 5L
  )

  expect_exists(failures, \(failure) {
    checkmate::test_vector(failure, max.len = 4L)
  })
  expect_exists(failures, \(failure) {
    checkmate::test_vector(failure, min.len = 6L)
  })

  failures_2 <- needs_vector(
    "x",
    ignored(),
    len = NULL
  )

  expect_in(failures_2, failures)
})

test_that("`len` must be a count or NULL", {
  skip("Not implemented yet")
  needs_count(
    "len",
    needs_vector("x", identity(x = 0L)),
    null_ok = TRUE
  )
})

test_that("`len` can't be supplied with `min_len` or `max_len`", {
  expect_snapshot(
    needs_vector("x", identity(x = 0L), len = 4L, min_len = 3L),
    cran = TRUE,
    error = TRUE
  )
  expect_snapshot(
    needs_vector("x", identity(x = 0L), len = 4L, max_len = 5L),
    cran = TRUE,
    error = TRUE
  )
})

# `min_len` --------------------------------------------------------------------
test_that("if `min_len` not NULL then tests a too short vector", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_vector(
    "x",
    ignored(),
    min_len = 5L
  )

  expect_exists(failures, \(failure) {
    checkmate::test_vector(failure, max.len = 4L)
  })

  failures_2 <- needs_vector(
    "x",
    ignored(),
    min_len = NULL
  )

  expect_in(failures_2, failures)
})

test_that("`min_len` must be a count or NULL", {
  skip("Not implemented yet")
  needs_count(
    "min_len",
    needs_vector("x", identity(x = 0L)),
    null_ok = TRUE
  )
})

# `max_len` --------------------------------------------------------------------
test_that("if `max_len` not NULL then tests a too long vector", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_vector(
    "x",
    ignored(),
    max_len = 5L
  )

  expect_exists(failures, \(failure) {
    checkmate::test_vector(failure, min.len = 6L)
  })

  failures_2 <- needs_vector(
    "x",
    ignored(),
    max_len = NULL
  )

  expect_in(failures_2, failures)
})

test_that("`max_len` must be a count or NULL", {
  skip("Not implemented yet")
  needs_count(
    "max_len",
    needs_vector("x", identity(x = 0L)),
    null_ok = TRUE
  )
})

# `unique` ---------------------------------------------------------------------
test_that("if `unique` then tests a vector with duplicates", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_vector(
    "x",
    ignored(),
    unique = TRUE
  )

  expect_exists(failures, \(failure) {
    any(duplicated(failure))
  })

  failures_2 <- needs_vector(
    "x",
    ignored(),
    unique = FALSE
  )

  expect_in(failures_2, failures)
})

test_that("`unique` must be a flag", {
  needs_flag(
    "unique",
    needs_vector("x", identity(x = 0L))
  )
})

# `null_ok` --------------------------------------------------------------------
test_that("if `null_ok` then doesn't test NULL", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_vector(
    "x",
    ignored(),
    null_ok = FALSE
  )

  expect_contains(failures, list(NULL))

  failures_2 <- needs_vector(
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
    needs_vector("x", identity(x = 0L))
  )
})
