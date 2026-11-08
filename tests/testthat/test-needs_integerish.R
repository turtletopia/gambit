# Example call -----------------------------------------------------------------
test_that("succeeds with a locally defined function", {
  test_function <- function(x) {
    checkmate::assert_integerish(x, typed.missing = TRUE)
  }

  needs_integerish(
    "x",
    test_function(x = 1:5)
  )
})

test_that("succeeds with an imported function", {
  skip("Yet to find an example")
})

# `param` ----------------------------------------------------------------------
test_that("`param` must be a string", {
  needs_string(
    "param",
    needs_integerish("x", identity(x = 0L))
  )
})

test_that("`param` must be one of tested function parameters", {
  expect_snapshot(
    needs_integerish("y", identity(x = 0L)),
    cran = TRUE,
    error = TRUE
  )
})

# `lower` ---------------------------------------------------------------------
test_that("if `lower` above -Inf then tests a too low value", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_integerish(
    "x",
    ignored(),
    lower = 5
  )

  expect_exists(failures, \(failure) {
    checkmate::test_integerish(failure, all.missing = FALSE) &&
      any(failure < 5L)
  })

  failures_2 <- needs_integerish(
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
    needs_integerish("x", identity(x = 0L))
  )
})

# `upper` ----------------------------------------------------------------------
test_that("if `upper` below Inf then tests a too high value", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_integerish(
    "x",
    ignored(),
    upper = 5
  )

  expect_exists(failures, \(failure) {
    checkmate::test_integerish(failure, all.missing = FALSE) &&
      any(failure > 5L)
  })

  failures_2 <- needs_integerish(
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
    needs_integerish("x", identity(x = 0L))
  )
})

test_that("`upper` must not be less than `lower`", {
  expect_snapshot(
    needs_integerish("x", identity(x = 0L), lower = 5L, upper = 3L),
    cran = TRUE,
    error = TRUE
  )
})

# `any_missing` ----------------------------------------------------------------
test_that("if not `any_missing` then tests a vector with NA", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_integerish(
    "x",
    ignored(),
    any_missing = FALSE
  )

  expect_exists(failures, \(failure) {
    anyNA(failure)
  })

  failures_2 <- needs_integerish(
    "x",
    ignored(),
    any_missing = TRUE
  )

  expect_in(failures_2, failures)
})

test_that("`any_missing` must be a flag", {
  needs_flag(
    "any_missing",
    needs_integerish("x", identity(x = 0L))
  )
})

# `all_missing` ----------------------------------------------------------------
test_that("if not `all_missing` then tests a vector with no non-missing values", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_integerish(
    "x",
    ignored(),
    all_missing = FALSE
  )

  # Covers vectors with only NA
  expect_exists(failures, \(failure) {
    checkmate::test_integerish(failure, min.len = 1L) &&
      all(is.na(failure))
  })
  # Covers length-0 vectors
  expect_exists(failures, \(failure) {
    checkmate::test_integerish(failure, len = 0L)
  })

  failures_2 <- needs_integerish(
    "x",
    ignored(),
    all_missing = TRUE
  )

  expect_in(failures_2, failures)
})

test_that("`all_missing` must be a flag", {
  needs_flag(
    "all_missing",
    needs_integerish("x", identity(x = 0L))
  )
})

# `len` ------------------------------------------------------------------------
test_that("if `len` not NULL then tests a too short and a too long vector", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_integerish(
    "x",
    ignored(),
    len = 5L
  )

  expect_exists(failures, \(failure) {
    checkmate::test_integerish(failure, max.len = 4L)
  })
  expect_exists(failures, \(failure) {
    checkmate::test_integerish(failure, min.len = 6L)
  })

  failures_2 <- needs_integerish(
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
    needs_integerish("x", identity(x = 0L)),
    null_ok = TRUE
  )
})

test_that("`len` can't be supplied with `min_len` or `max_len`", {
  expect_snapshot(
    needs_integerish("x", identity(x = 0L), len = 4L, min_len = 3L),
    cran = TRUE,
    error = TRUE
  )
  expect_snapshot(
    needs_integerish("x", identity(x = 0L), len = 4L, max_len = 5L),
    cran = TRUE,
    error = TRUE
  )
})

# `min_len` --------------------------------------------------------------------
test_that("if `min_len` more than 0 then tests a too short vector", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_integerish(
    "x",
    ignored(),
    min_len = 5L
  )

  expect_exists(failures, \(failure) {
    checkmate::test_integerish(failure, max.len = 4L)
  })

  failures_2 <- needs_integerish(
    "x",
    ignored(),
    min_len = 0L
  )

  expect_in(failures_2, failures)
})

test_that("`min_len` must be a count", {
  skip("Not implemented yet")
  needs_count(
    "min_len",
    needs_integerish("x", identity(x = 0L))
  )
})

# `max_len` --------------------------------------------------------------------
test_that("if `max_len` less than Inf then tests a too long vector", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_integerish(
    "x",
    ignored(),
    max_len = 5L
  )

  expect_exists(failures, \(failure) {
    checkmate::test_integerish(failure, min.len = 6L)
  })

  failures_2 <- needs_integerish(
    "x",
    ignored(),
    max_len = Inf
  )

  expect_in(failures_2, failures)
})

test_that("`max_len` must be a count", {
  skip("Not implemented yet")
  needs_count(
    "max_len",
    needs_integerish("x", identity(x = 0L))
  )
})

test_that("`max_len` must exceed `min_len`", {
  expect_snapshot(
    needs_integerish("x", identity(x = 0L), max_len = 0L),
    cran = TRUE,
    error = TRUE
  )
  expect_snapshot(
    needs_integerish("x", identity(x = 0L), min_len = 5L, max_len = 3L),
    cran = TRUE,
    error = TRUE
  )
})

# `unique` ---------------------------------------------------------------------
test_that("if `unique` then tests a vector with duplicates", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_integerish(
    "x",
    ignored(),
    unique = TRUE
  )

  expect_exists(failures, \(failure) {
    any(duplicated(failure))
  })

  failures_2 <- needs_integerish(
    "x",
    ignored(),
    unique = FALSE
  )

  expect_in(failures_2, failures)
})

test_that("`unique` must be a flag", {
  needs_flag(
    "unique",
    needs_integerish("x", identity(x = 0L))
  )
})

# `sorted` ---------------------------------------------------------------------
test_that("if `sorted` then tests a vector that's not sorted", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_integerish(
    "x",
    ignored(),
    sorted = TRUE
  )

  expect_exists(failures, \(failure) {
    checkmate::test_integerish(failure, any.missing = FALSE, min.len = 2L) &&
      is.unsorted(failure)
  })

  failures_2 <- needs_integerish(
    "x",
    ignored(),
    sorted = FALSE
  )

  expect_in(failures_2, failures)
})

test_that("`sorted` must be a flag", {
  needs_flag(
    "sorted",
    needs_integerish("x", identity(x = 0L))
  )
})

# `typed_missing` --------------------------------------------------------------
test_that("if `typed_missing` then tests `NA` of non-numeric type", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_integerish(
    "x",
    ignored(),
    typed_missing = TRUE
  )

  expect_contains(failures, list(NA_character_))

  failures_2 <- needs_integerish(
    "x",
    ignored(),
    typed_missing = FALSE
  )

  expect_disjoint(failures_2, list(NA_character_))
  expect_in(failures_2, failures)
})

test_that("`typed_missing` must be a flag", {
  needs_flag(
    "typed_missing",
    needs_integerish("x", identity(x = 0L))
  )
})

# `null_ok` --------------------------------------------------------------------
test_that("if `null_ok` then doesn't test NULL", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_integerish(
    "x",
    ignored(),
    null_ok = FALSE
  )

  expect_contains(failures, list(NULL))

  failures_2 <- needs_integerish(
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
    needs_integerish("x", identity(x = 0L))
  )
})
