# Example call -----------------------------------------------------------------
test_that("succeeds with a locally defined function", {
  test_function <- function(x) {
    checkmate::assert_character(x, typed.missing = TRUE)
  }

  needs_character(
    "x",
    test_function(x = letters[1:5])
  )
})

test_that("succeeds with an imported function", {
  needs_character(
    "subset.of",
    checkmate::test_names(letters, subset.of = letters),
    any_missing = FALSE,
    null_ok = TRUE
  )
})

# Parameter changes ------------------------------------------------------------
test_that("by default, tests NULL and `NA` of non-character type", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_character(
    "x",
    ignored()
  )

  expect_contains(failures, list(NULL, NA_integer_))
})

test_that("if not `typed_missing` then doesn't test `NA` of non-character type", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_character(
    "x",
    ignored(),
    typed_missing = FALSE
  )

  expect_contains(failures, list(NULL))
  expect_disjoint(failures, list(NA_integer_))
})

test_that("if `null_ok` then doesn't test NULL", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_character(
    "x",
    ignored(),
    null_ok = TRUE
  )

  expect_contains(failures, list(NA_integer_))
  expect_disjoint(failures, list(NULL))
})

test_that("if `n_chars` not NULL then tests a too short and a too long string", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_character(
    "x",
    ignored(),
    n_chars = 5L
  )

  expect_exists(failures, \(failure) {
    checkmate::test_character(failure, max.chars = 4L)
  })
  expect_exists(failures, \(failure) {
    checkmate::test_character(failure, min.chars = 6L)
  })
})

test_that("if `min_chars` not NULL then tests a too short string", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_character(
    "x",
    ignored(),
    min_chars = 5L
  )

  expect_exists(failures, \(failure) {
    checkmate::test_character(failure, max.chars = 4L)
  })
})

test_that("if `max_chars` not NULL then tests a too long string", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_character(
    "x",
    ignored(),
    max_chars = 5L
  )

  expect_exists(failures, \(failure) {
    checkmate::test_character(failure, min.chars = 6L)
  })
})

test_that("if not `any_missing` then tests a vector with NA", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_character(
    "x",
    ignored(),
    any_missing = FALSE
  )

  expect_exists(failures, \(failure) {
    anyNA(failure)
  })
})

test_that("if not `all_missing` then tests a vector with no non-missing values", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_character(
    "x",
    ignored(),
    all_missing = FALSE
  )

  # Covers vectors with only NA
  expect_exists(failures, \(failure) {
    checkmate::test_character(failure, min.len = 1L) &&
      all(is.na(failure))
  })
  # Covers length-0 vectors
  expect_exists(failures, \(failure) {
    checkmate::test_character(failure, len = 0L)
  })
})

test_that("if `len` not NULL then tests a too short and a too long vector", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_character(
    "x",
    ignored(),
    len = 5L
  )

  expect_exists(failures, \(failure) {
    checkmate::test_character(failure, max.len = 4L)
  })
  expect_exists(failures, \(failure) {
    checkmate::test_character(failure, min.len = 6L)
  })
})

test_that("if `min_len` not NULL then tests a too short vector", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_character(
    "x",
    ignored(),
    min_len = 5L
  )

  expect_exists(failures, \(failure) {
    checkmate::test_character(failure, max.len = 4L)
  })
})

test_that("if `max_len` not NULL then tests a too long vector", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_character(
    "x",
    ignored(),
    max_len = 5L
  )

  expect_exists(failures, \(failure) {
    checkmate::test_character(failure, min.len = 6L)
  })
})

test_that("if `unique` then tests a vector with duplicates", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_character(
    "x",
    ignored(),
    unique = TRUE
  )

  expect_exists(failures, \(failure) {
    any(duplicated(failure))
  })
})

test_that("if `sorted` then tests a vector that's not sorted", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_character(
    "x",
    ignored(),
    sorted = TRUE
  )

  expect_exists(failures, \(failure) {
    checkmate::test_character(failure, any.missing = FALSE, min.len = 2L) &&
      is.unsorted(failure)
  })
})

# Parameter assertions ---------------------------------------------------------
test_that("`param` must be a string", {
  needs_string(
    "param",
    needs_character("x", identity(x = 0L))
  )
})

test_that("`param` must be one of tested function parameters", {
  expect_snapshot(
    needs_character("y", identity(x = 0L)),
    cran = TRUE,
    error = TRUE
  )
})

test_that("`n_chars` must be a count or NULL", {
  skip("Not implemented yet")
  needs_count(
    "n_chars",
    needs_string("x", identity(x = 0L)),
    null_ok = TRUE
  )
})

test_that("`min_chars` must be a count or NULL", {
  skip("Not implemented yet")
  needs_count(
    "min_chars",
    needs_string("x", identity(x = 0L)),
    null_ok = TRUE
  )
})

test_that("`max_chars` must be a count or NULL", {
  skip("Not implemented yet")
  needs_count(
    "max_chars",
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

test_that("`any_missing` must be a flag", {
  needs_flag(
    "any_missing",
    needs_character("x", identity(x = 0L))
  )
})

test_that("`all_missing` must be a flag", {
  needs_flag(
    "all_missing",
    needs_character("x", identity(x = 0L))
  )
})

test_that("`len` must be a count or NULL", {
  skip("Not implemented yet")
  needs_count(
    "len",
    needs_character("x", identity(x = 0L)),
    null_ok = TRUE
  )
})

test_that("`min_len` must be a count or NULL", {
  skip("Not implemented yet")
  needs_count(
    "min_len",
    needs_character("x", identity(x = 0L)),
    null_ok = TRUE
  )
})

test_that("`max_len` must be a count or NULL", {
  skip("Not implemented yet")
  needs_count(
    "max_len",
    needs_character("x", identity(x = 0L)),
    null_ok = TRUE
  )
})

test_that("`len` can't be supplied with `min_len` or `max_len`", {
  expect_snapshot(
    needs_character("x", identity(x = 0L), len = 4L, min_len = 3L),
    cran = TRUE,
    error = TRUE
  )
  expect_snapshot(
    needs_character("x", identity(x = 0L), len = 4L, max_len = 5L),
    cran = TRUE,
    error = TRUE
  )
})

test_that("`unique` must be a flag", {
  needs_flag(
    "unique",
    needs_character("x", identity(x = 0L))
  )
})

test_that("`sorted` must be a flag", {
  needs_flag(
    "sorted",
    needs_character("x", identity(x = 0L))
  )
})

test_that("`typed_missing` must be a flag", {
  needs_flag(
    "typed_missing",
    needs_character("x", identity(x = 0L))
  )
})

test_that("`null_ok` must be a flag", {
  needs_flag(
    "null_ok",
    needs_character("x", identity(x = 0L))
  )
})
