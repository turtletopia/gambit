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
test_arg_param(needs_vector)

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
test_arg_any_missing(needs_vector)

# `all_missing` ----------------------------------------------------------------
test_arg_all_missing(needs_vector, checkmate::test_vector)

# `len` ------------------------------------------------------------------------
test_arg_len(needs_vector, checkmate::test_vector)

# `min_len` --------------------------------------------------------------------
test_arg_min_len(needs_vector, checkmate::test_vector)

# `max_len` --------------------------------------------------------------------
test_arg_max_len(needs_vector, checkmate::test_vector)

# `unique` ---------------------------------------------------------------------
test_arg_unique(needs_vector)

# `null_ok` --------------------------------------------------------------------
test_arg_null_ok(needs_vector)
