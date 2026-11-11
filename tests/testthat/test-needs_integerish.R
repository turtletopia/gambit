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
test_arg_param(needs_integerish)

# `lower` ---------------------------------------------------------------------
test_arg_lower(needs_integerish, \(...) {
  checkmate::test_integerish(..., all.missing = FALSE)
})

# `upper` ----------------------------------------------------------------------
test_arg_upper(needs_integerish, \(...) {
  checkmate::test_integerish(..., all.missing = FALSE)
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
test_arg_sorted(needs_integerish, checkmate::test_integerish)

# `typed_missing` --------------------------------------------------------------
test_arg_typed_missing(needs_integerish)

# `null_ok` --------------------------------------------------------------------
test_arg_null_ok(needs_integerish)
