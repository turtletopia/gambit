# Example call -----------------------------------------------------------------
test_that("succeeds with a locally defined function", {
  test_function <- function(x) {
    checkmate::assert_logical(x, typed.missing = TRUE)
  }

  needs_logical(
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
    needs_logical("x", identity(x = 0L))
  )
})

test_that("`param` must be one of tested function parameters", {
  expect_snapshot(
    needs_logical("y", identity(x = 0L)),
    cran = TRUE,
    error = TRUE
  )
})

# `any_missing` ----------------------------------------------------------------
test_arg_any_missing(needs_logical)

# `all_missing` ----------------------------------------------------------------
test_arg_all_missing(needs_logical, checkmate::test_logical)

# `len` ------------------------------------------------------------------------
test_arg_len(needs_logical, checkmate::test_logical)

# `min_len` --------------------------------------------------------------------
test_arg_min_len(needs_logical, checkmate::test_logical)

# `max_len` --------------------------------------------------------------------
test_arg_max_len(needs_logical, checkmate::test_logical)

# `unique` ---------------------------------------------------------------------
test_arg_unique(needs_logical)

# `typed_missing` --------------------------------------------------------------
test_that("if `typed_missing` then tests `NA` of non-logical type", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_logical(
    "x",
    ignored(),
    typed_missing = TRUE
  )

  expect_contains(failures, list(NA_character_))

  failures_2 <- needs_logical(
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
    needs_logical("x", identity(x = 0L))
  )
})

# `null_ok` --------------------------------------------------------------------
test_arg_null_ok(needs_logical)
