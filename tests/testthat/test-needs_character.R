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
test_arg_param(needs_character)

# `n_chars` --------------------------------------------------------------------
test_arg_n_chars(needs_character, checkmate::test_character)

# `min_chars` ------------------------------------------------------------------
test_arg_min_chars(needs_character, checkmate::test_character)

# `max_chars` ------------------------------------------------------------------
test_arg_max_chars(needs_character, checkmate::test_character)

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
test_arg_sorted(needs_character, checkmate::test_character)

# `typed_missing` --------------------------------------------------------------
test_arg_typed_missing(needs_character, NA_value = NA_integer_)

# `null_ok` --------------------------------------------------------------------
test_arg_null_ok(needs_character)
