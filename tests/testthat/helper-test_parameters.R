# `param` ----------------------------------------------------------------------
test_arg_param <- function(needs_fn) {
  needs_fn_sym <- rlang::ensym(needs_fn)

  test_that("`param` must be a string", {
    rlang::inject(
      needs_string(
        "param",
        (!!needs_fn_sym)("x", identity(x = 0L))
      )
    )
  })

  test_that("`param` must be one of tested function parameters", {
    rlang::inject(
      expect_snapshot(
        (!!needs_fn_sym)("y", identity(x = 0L)),
        cran = TRUE,
        error = TRUE
      )
    )
  })
}

# `all_missing` ----------------------------------------------------------------
test_arg_all_missing <- function(needs_fn, test_fn) {
  needs_fn_sym <- rlang::ensym(needs_fn)

  test_that("if not `all_missing` then tests a vector with no non-missing values", {
    testthat::local_mocked_bindings(
      fails_for = function(expr, param, failures) { failures }
    )

    failures <- needs_fn(
      "x",
      ignored(),
      all_missing = FALSE
    )

    # Covers vectors with only NA
    expect_exists(failures, \(failure) {
      test_fn(failure, min.len = 1L) && all(is.na(failure))
    })
    # Covers length-0 vectors
    expect_exists(failures, \(failure) {
      test_fn(failure, len = 0L)
    })

    failures_2 <- needs_fn(
      "x",
      ignored(),
      all_missing = TRUE
    )

    expect_in(failures_2, failures)
  })

  test_that("`all_missing` must be a flag", {
    rlang::inject(
      needs_flag(
        "all_missing",
        (!!needs_fn_sym)("x", identity(x = 0L))
      )
    )
  })
}

# `any_missing` ----------------------------------------------------------------
test_arg_any_missing <- function(needs_fn) {
  needs_fn_sym <- rlang::ensym(needs_fn)

  test_that("if not `any_missing` then tests a vector with NA", {
    testthat::local_mocked_bindings(
      fails_for = function(expr, param, failures) { failures }
    )

    failures <- needs_fn(
      "x",
      ignored(),
      any_missing = FALSE
    )

    expect_exists(failures, \(failure) {
      anyNA(failure)
    })

    failures_2 <- needs_fn(
      "x",
      ignored(),
      any_missing = TRUE
    )

    expect_in(failures_2, failures)
  })

  test_that("`any_missing` must be a flag", {
    rlang::inject(
      needs_flag(
        "any_missing",
        (!!needs_fn_sym)("x", identity(x = 0L))
      )
    )
  })
}

# `len` ------------------------------------------------------------------------
test_arg_len <- function(needs_fn, test_fn) {
  needs_fn_sym <- rlang::ensym(needs_fn)

  test_that("if `len` not NULL then tests a too short and a too long vector", {
    testthat::local_mocked_bindings(
      fails_for = function(expr, param, failures) { failures }
    )

    failures <- needs_fn(
      "x",
      ignored(),
      len = 5L
    )

    expect_exists(failures, \(failure) {
      test_fn(failure, max.len = 4L)
    })
    expect_exists(failures, \(failure) {
      test_fn(failure, min.len = 6L)
    })

    failures_2 <- needs_fn(
      "x",
      ignored(),
      len = NULL
    )

    expect_in(failures_2, failures)
  })

  test_that("`len` must be a count or NULL", {
    skip("Not implemented yet")
    rlang::inject(
      needs_count(
        "len",
        (!!needs_fn_sym)("x", identity(x = 0L)),
        null_ok = TRUE
      )
    )
  })

  test_that("`len` can't be supplied with `min_len` or `max_len`", {
    rlang::inject({
      expect_snapshot(
        (!!needs_fn_sym)("x", identity(x = 0L), len = 4L, min_len = 3L),
        cran = TRUE,
        error = TRUE
      )
      expect_snapshot(
        (!!needs_fn_sym)("x", identity(x = 0L), len = 4L, max_len = 5L),
        cran = TRUE,
        error = TRUE
      )
    })
  })
}

# `lower` ---------------------------------------------------------------------
test_arg_lower <- function(needs_fn, test_fn) {
  needs_fn_sym <- rlang::ensym(needs_fn)

  test_that("if `lower` above -Inf then tests a too low value", {
    testthat::local_mocked_bindings(
      fails_for = function(expr, param, failures) { failures }
    )

    failures <- needs_fn(
      "x",
      ignored(),
      lower = 5L
    )

    expect_exists(failures, \(failure) {
      test_fn(failure) && !test_fn(failure, lower = 5L)
    })

    failures_2 <- needs_fn(
      "x",
      ignored(),
      lower = -Inf
    )

    expect_in(failures_2, failures)
  })

  test_that("`lower` must be a number", {
    skip("Not implemented yet")
    rlang::inject(
      needs_number(
        "lower",
        (!!needs_fn_sym)("x", identity(x = 0L))
      )
    )
  })
}

# `max_chars` ------------------------------------------------------------------
test_arg_max_chars <- function(needs_fn, test_fn) {
  needs_fn_sym <- rlang::ensym(needs_fn)

  test_that("if `max_chars` less than Inf then tests a too long string", {
    testthat::local_mocked_bindings(
      fails_for = function(expr, param, failures) { failures }
    )

    failures <- needs_fn(
      "x",
      ignored(),
      max_chars = 5L
    )

    expect_exists(failures, \(failure) {
      test_fn(failure) && !test_fn(failure, max.chars = 5L)
    })

    failures_2 <- needs_fn(
      "x",
      ignored(),
      max_chars = Inf
    )

    expect_in(failures_2, failures)
  })

  test_that("`max_chars` must be a count or NULL", {
    skip("Not implemented yet")
    rlang::inject(
      needs_count(
        "max_chars",
        (!!needs_fn_sym)("x", identity(x = 0L))
      )
    )
  })

  test_that("`max_chars` must exceed `min_chars`", {
    rlang::inject({
      expect_snapshot(
        (!!needs_fn_sym)("x", identity(x = 0L), max_chars = 0L),
        cran = TRUE,
        error = TRUE
      )
      expect_snapshot(
        (!!needs_fn_sym)("x", identity(x = 0L), min_chars = 5L, max_chars = 3L),
        cran = TRUE,
        error = TRUE
      )
    })
  })
}

# `max_len` --------------------------------------------------------------------
test_arg_max_len <- function(needs_fn, test_fn) {
  needs_fn_sym <- rlang::ensym(needs_fn)

  test_that("if `max_len` less than Inf then tests a too long vector", {
    testthat::local_mocked_bindings(
      fails_for = function(expr, param, failures) { failures }
    )

    failures <- needs_fn(
      "x",
      ignored(),
      max_len = 5L
    )

    expect_exists(failures, \(failure) {
      test_fn(failure, min.len = 6L)
    })

    failures_2 <- needs_fn(
      "x",
      ignored(),
      max_len = Inf
    )

    expect_in(failures_2, failures)
  })

  test_that("`max_len` must be a count", {
    skip("Not implemented yet")
    rlang::inject(
      needs_count(
        "max_len",
        (!!needs_fn_sym)("x", identity(x = 0L))
      )
    )
  })

  test_that("`max_len` must exceed `min_len`", {
    rlang::inject({
      expect_snapshot(
        (!!needs_fn_sym)("x", identity(x = 0L), max_len = 0L),
        cran = TRUE,
        error = TRUE
      )
      expect_snapshot(
        (!!needs_fn_sym)("x", identity(x = 0L), min_len = 5L, max_len = 3L),
        cran = TRUE,
        error = TRUE
      )
    })
  })
}

# `min_chars` ------------------------------------------------------------------
test_arg_min_chars <- function(needs_fn, test_fn) {
  needs_fn_sym <- rlang::ensym(needs_fn)

  test_that("if `min_chars` more than 0 then tests a too short string", {
    testthat::local_mocked_bindings(
      fails_for = function(expr, param, failures) { failures }
    )

    failures <- needs_fn(
      "x",
      ignored(),
      min_chars = 5L
    )

    expect_exists(failures, \(failure) {
      test_fn(failure) && !test_fn(failure, min.chars = 5L)
    })

    failures_2 <- needs_fn(
      "x",
      ignored(),
      min_chars = 0L
    )

    expect_in(failures_2, failures)
  })

  test_that("`min_chars` must be a count or NULL", {
    skip("Not implemented yet")
    rlang::inject(
      needs_count(
        "min_chars",
        (!!needs_fn_sym)("x", identity(x = 0L))
      )
    )
  })
}

# `min_len` --------------------------------------------------------------------
test_arg_min_len <- function(needs_fn, test_fn) {
  needs_fn_sym <- rlang::ensym(needs_fn)

  test_that("if `min_len` more than 0 then tests a too short vector", {
    testthat::local_mocked_bindings(
      fails_for = function(expr, param, failures) { failures }
    )

    failures <- needs_fn(
      "x",
      ignored(),
      min_len = 5L
    )

    expect_exists(failures, \(failure) {
      test_fn(failure, max.len = 4L)
    })

    failures_2 <- needs_fn(
      "x",
      ignored(),
      min_len = 0L
    )

    expect_in(failures_2, failures)
  })

  test_that("`min_len` must be a count", {
    skip("Not implemented yet")
    rlang::inject(
      needs_count(
        "min_len",
        (!!needs_fn_sym)("x", identity(x = 0L))
      )
    )
  })
}

# `n_chars` --------------------------------------------------------------------
test_arg_n_chars <- function(needs_fn, test_fn) {
  needs_fn_sym <- rlang::ensym(needs_fn)

  test_that("if `n_chars` not NULL then tests a too short and a too long string", {
    testthat::local_mocked_bindings(
      fails_for = function(expr, param, failures) { failures }
    )

    failures <- needs_fn(
      "x",
      ignored(),
      n_chars = 5L
    )

    expect_exists(failures, \(failure) {
      test_fn(failure) && !test_fn(failure, min.chars = 5L)
    })
    expect_exists(failures, \(failure) {
      test_fn(failure) && !test_fn(failure, max.chars = 5L)
    })

    failures_2 <- needs_fn(
      "x",
      ignored(),
      n_chars = NULL
    )

    expect_in(failures_2, failures)
  })

  # TODO: Cover the case of `n_chars` == 0

  test_that("`n_chars` must be a count or NULL", {
    skip("Not implemented yet")
    rlang::inject(
      needs_count(
        "n_chars",
        (!!needs_fn_sym)("x", identity(x = 0L)),
        null_ok = TRUE
      )
    )
  })

  test_that("`n_chars` can't be supplied with `min_chars` or `max_chars`", {
    rlang::inject({
      expect_snapshot(
        (!!needs_fn_sym)("x", identity(x = 0L), n_chars = 4L, min_chars = 3L),
        cran = TRUE,
        error = TRUE
      )
      expect_snapshot(
        (!!needs_fn_sym)("x", identity(x = 0L), n_chars = 4L, max_chars = 5L),
        cran = TRUE,
        error = TRUE
      )
    })
  })
}

# `na_ok` ----------------------------------------------------------------------
test_arg_na_ok <- function(needs_fn, NA_value = NA) {
  needs_fn_sym <- rlang::ensym(needs_fn)

  test_that("if `na_ok` then doesn't test NA", {
    testthat::local_mocked_bindings(
      fails_for = function(expr, param, failures) { failures }
    )

    failures <- needs_fn(
      "x",
      ignored(),
      na_ok = FALSE
    )

    expect_contains(failures, list(NA_value))

    failures_2 <- needs_fn(
      "x",
      ignored(),
      na_ok = TRUE
    )

    expect_disjoint(failures_2, list(NA_value))
    expect_in(failures_2, failures)
  })

  test_that("`na_ok` must be a flag", {
    rlang::inject(
      needs_flag(
        "na_ok",
        (!!needs_fn_sym)("x", identity(x = 0L))
      )
    )
  })
}

# `null_ok` --------------------------------------------------------------------
test_arg_null_ok <- function(needs_fn) {
  needs_fn_sym <- rlang::ensym(needs_fn)

  test_that("if `null_ok` then doesn't test NULL", {
    testthat::local_mocked_bindings(
      fails_for = function(expr, param, failures) { failures }
    )

    failures <- needs_fn(
      "x",
      ignored(),
      null_ok = FALSE
    )

    expect_contains(failures, list(NULL))

    failures_2 <- needs_fn(
      "x",
      ignored(),
      null_ok = TRUE
    )

    expect_disjoint(failures_2, list(NULL))
    expect_in(failures_2, failures)
  })

  test_that("`null_ok` must be a flag", {
    rlang::inject(
      needs_flag(
        "null_ok",
        (!!needs_fn_sym)("x", identity(x = 0L))
      )
    )
  })
}

# `sorted` ---------------------------------------------------------------------
test_arg_sorted <- function(needs_fn, test_fn) {
  needs_fn_sym <- rlang::ensym(needs_fn)

  test_that("if `sorted` then tests a vector that's not sorted", {
    testthat::local_mocked_bindings(
      fails_for = function(expr, param, failures) { failures }
    )

    failures <- needs_fn(
      "x",
      ignored(),
      sorted = TRUE
    )

    expect_exists(failures, \(failure) {
      test_fn(failure, any.missing = FALSE, min.len = 2L) &&
        is.unsorted(failure)
    })

    failures_2 <- needs_fn(
      "x",
      ignored(),
      sorted = FALSE
    )

    expect_in(failures_2, failures)
  })

  test_that("`sorted` must be a flag", {
    rlang::inject(
      needs_flag(
        "sorted",
        (!!needs_fn_sym)("x", identity(x = 0L))
      )
    )
  })
}

# `typed_missing` --------------------------------------------------------------
test_arg_typed_missing <- function(needs_fn, NA_value = NA_character_) {
  needs_fn_sym <- rlang::ensym(needs_fn)

  test_that("if `typed_missing` then tests `NA` of incorrect type", {
    testthat::local_mocked_bindings(
      fails_for = function(expr, param, failures) { failures }
    )

    failures <- needs_fn(
      "x",
      ignored(),
      typed_missing = TRUE
    )

    expect_contains(failures, list(NA_value))

    failures_2 <- needs_fn(
      "x",
      ignored(),
      typed_missing = FALSE
    )

    expect_disjoint(failures_2, list(NA_value))
    expect_in(failures_2, failures)
  })

  test_that("`typed_missing` must be a flag", {
    rlang::inject(
      needs_flag(
        "typed_missing",
        (!!needs_fn_sym)("x", identity(x = 0L))
      )
    )
  })
}

# `unique` ---------------------------------------------------------------------
test_arg_unique <- function(needs_fn) {
  needs_fn_sym <- rlang::ensym(needs_fn)

  test_that("if `unique` then tests a vector with duplicates", {
    testthat::local_mocked_bindings(
      fails_for = function(expr, param, failures) { failures }
    )

    failures <- needs_fn(
      "x",
      ignored(),
      unique = TRUE
    )

    expect_exists(failures, \(failure) {
      any(duplicated(failure))
    })

    failures_2 <- needs_fn(
      "x",
      ignored(),
      unique = FALSE
    )

    expect_in(failures_2, failures)
  })

  test_that("`unique` must be a flag", {
    rlang::inject(
      needs_flag(
        "unique",
        (!!needs_fn_sym)("x", identity(x = 0L))
      )
    )
  })
}

# `upper` ---------------------------------------------------------------------
test_arg_upper <- function(needs_fn, test_fn) {
  needs_fn_sym <- rlang::ensym(needs_fn)

  test_that("`lower` must be a number", {
    skip("Not implemented yet")
    rlang::inject(
      needs_number(
        "lower",
        (!!needs_fn_sym)("x", identity(x = 0L))
      )
    )
  })

  test_that("if `upper` below Inf then tests a too high value", {
    testthat::local_mocked_bindings(
      fails_for = function(expr, param, failures) { failures }
    )

    failures <- needs_fn(
      "x",
      ignored(),
      upper = 5L
    )

    expect_exists(failures, \(failure) {
      test_fn(failure) && !test_fn(failure, upper = 5L)
    })

    failures_2 <- needs_fn(
      "x",
      ignored(),
      upper = Inf
    )

    expect_in(failures_2, failures)
  })

  test_that("`upper` must be a number", {
    skip("Not implemented yet")
    rlang::inject(
      needs_number(
        "upper",
        (!!needs_fn_sym)("x", identity(x = 0L))
      )
    )
  })

  test_that("`upper` must not be less than `lower`", {
    rlang::inject(
      expect_snapshot(
        (!!needs_fn_sym)("x", identity(x = 0L), lower = 5L, upper = 3L),
        cran = TRUE,
        error = TRUE
      )
    )
  })
}
