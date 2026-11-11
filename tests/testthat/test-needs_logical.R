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
test_arg_param(needs_logical)

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
test_arg_typed_missing(needs_logical)

# `null_ok` --------------------------------------------------------------------
test_arg_null_ok(needs_logical)
