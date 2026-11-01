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

# Parameter changes ------------------------------------------------------------
test_that("by default, tests NULL and NA", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_string(
    "x",
    ignored()
  )

  expect_contains(failures, list(NULL, NA_character_))
})

test_that("if `null_ok` then doesn't test NULL", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_string(
    "x",
    ignored(),
    null_ok = TRUE
  )

  expect_contains(failures, list(NA_character_))
  expect_disjoint(failures, list(NULL))
})

test_that("if `na_ok` then doesn't test NA", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_string(
    "x",
    ignored(),
    na_ok = TRUE
  )

  expect_contains(failures, list(NULL))
  expect_disjoint(failures, list(NA_character_))
})

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
})

test_that("if `min_chars` not NULL then tests a too short string", {
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
})

test_that("if `max_chars` not NULL then tests a too long string", {
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
})

# Parameter assertions ---------------------------------------------------------
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

test_that("`na_ok` must be a flag", {
  needs_flag(
    "na_ok",
    needs_string("x", identity(x = 0L))
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

test_that("`null_ok` must be a flag", {
  needs_flag(
    "null_ok",
    needs_string("x", identity(x = 0L))
  )
})
