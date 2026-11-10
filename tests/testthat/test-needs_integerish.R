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
test_arg_any_missing(needs_integerish)

# `all_missing` ----------------------------------------------------------------
test_arg_all_missing(needs_integerish, checkmate::test_integerish)

# `len` ------------------------------------------------------------------------
test_arg_len(needs_integerish, checkmate::test_integerish)

# `min_len` --------------------------------------------------------------------
test_arg_min_len(needs_integerish, checkmate::test_integerish)

# `max_len` --------------------------------------------------------------------
test_arg_max_len(needs_integerish, checkmate::test_integerish)

# `unique` ---------------------------------------------------------------------
test_arg_unique(needs_integerish)

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
test_arg_null_ok(needs_integerish)
