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

# `param` ----------------------------------------------------------------------
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

# `n_chars` --------------------------------------------------------------------
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

  failures_2 <- needs_character(
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
    needs_character("x", identity(x = 0L)),
    null_ok = TRUE
  )
})

test_that("`n_chars` can't be supplied with `min_chars` or `max_chars`", {
  expect_snapshot(
    needs_character("x", identity(x = 0L), n_chars = 4L, min_chars = 3L),
    cran = TRUE,
    error = TRUE
  )
  expect_snapshot(
    needs_character("x", identity(x = 0L), n_chars = 4L, max_chars = 5L),
    cran = TRUE,
    error = TRUE
  )
})

# `min_chars` ------------------------------------------------------------------
test_that("if `min_chars` more than 0 then tests a too short string", {
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

  failures_2 <- needs_character(
    "x",
    ignored(),
    min_chars = 0L
  )

  expect_in(failures_2, failures)
})

test_that("`min_chars` must be a count or NULL", {
  skip("Not implemented yet")
  needs_count(
    "min_chars",
    needs_character("x", identity(x = 0L))
  )
})

# `max_chars` ------------------------------------------------------------------
test_that("if `max_chars` less than Inf then tests a too long string", {
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

  failures_2 <- needs_character(
    "x",
    ignored(),
    max_chars = Inf
  )

  expect_in(failures_2, failures)
})

test_that("`max_chars` must be a count or NULL", {
  skip("Not implemented yet")
  needs_count(
    "max_chars",
    needs_character("x", identity(x = 0L))
  )
})

test_that("`max_chars` must exceed `min_chars`", {
  expect_snapshot(
    needs_character("x", identity(x = 0L), max_chars = 0L),
    cran = TRUE,
    error = TRUE
  )
  expect_snapshot(
    needs_character("x", identity(x = 0L), min_chars = 5L, max_chars = 3L),
    cran = TRUE,
    error = TRUE
  )
})

# `any_missing` ----------------------------------------------------------------
test_arg_any_missing(needs_character)

# `all_missing` ----------------------------------------------------------------
test_arg_all_missing(needs_character, checkmate::test_character)

# `len` ------------------------------------------------------------------------
test_arg_len(needs_character, checkmate::test_character)

# `min_len` --------------------------------------------------------------------
test_arg_min_len(needs_character, checkmate::test_character)

# `max_len` --------------------------------------------------------------------
test_arg_max_len(needs_character, checkmate::test_character)

# `unique` ---------------------------------------------------------------------
test_arg_unique(needs_character)

# `sorted` ---------------------------------------------------------------------
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

  failures_2 <- needs_character(
    "x",
    ignored(),
    sorted = FALSE
  )

  expect_in(failures_2, failures)
})

test_that("`sorted` must be a flag", {
  needs_flag(
    "sorted",
    needs_character("x", identity(x = 0L))
  )
})

# `typed_missing` --------------------------------------------------------------
test_that("if `typed_missing` then tests `NA` of non-character type", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_character(
    "x",
    ignored(),
    typed_missing = TRUE
  )

  expect_contains(failures, list(NA_integer_))

  failures_2 <- needs_character(
    "x",
    ignored(),
    typed_missing = FALSE
  )

  expect_disjoint(failures_2, list(NA_integer_))
  expect_in(failures_2, failures)
})

test_that("`typed_missing` must be a flag", {
  needs_flag(
    "typed_missing",
    needs_character("x", identity(x = 0L))
  )
})

# `null_ok` --------------------------------------------------------------------
test_arg_null_ok(needs_character)
