# Example call -----------------------------------------------------------------
test_that("succeeds with a locally defined function", {
  test_function <- function(x) {
    checkmate::assert_class(x, classes = c("a", "b"))
  }

  needs_class(
    "x",
    test_function(x = structure(list(), class = c("a", "b"))),
    classes = c("a", "b")
  )
})

test_that("succeeds with an imported function", {
  skip("Yet to find an example")
})

# `param` ----------------------------------------------------------------------
test_arg_param(needs_class, classes = "test")

# `classes` --------------------------------------------------------------------
test_that("tests an object with a class not matching any of the specified ones", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  classes <- c("a", "test")

  failures <- needs_class(
    "x",
    ignored(),
    classes = classes
  )

  expect_exists(failures, \(failure) {
    # `inherits()` tests for ANY OF
    !inherits(failure, classes)
  })
})

test_that("if 2+ classes given, tests an object matching only some of the classes", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  classes <- c("a", "test")

  failures <- needs_class(
    "x",
    ignored(),
    classes = classes
  )

  expect_exists(failures, \(failure) {
    inherits(failure, classes) &&
      !checkmate::test_class(failure, classes = classes)
  })
})

test_that("`classes` must be a character vector of unique, non-missing values", {
  needs_character(
    "classes",
    needs_class("x", identity(x = 0L), classes = "test"),
    any_missing = FALSE,
    min_len = 1L,
    unique = TRUE
  )
})

# `ordered` --------------------------------------------------------------------
test_that("if `ordered` then tests a stub with unordered classes", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  classes <- c("a", "b")

  failures <- needs_class(
    "x",
    ignored(),
    classes = classes,
    ordered = TRUE
  )

  expect_exists(failures, \(failure) {
    checkmate::test_class(failure, classes = classes) &&
      !checkmate::test_class(failure, classes = classes, ordered = TRUE)
  })

  failures_2 <- needs_class(
    "x",
    ignored(),
    classes = classes,
    ordered = FALSE
  )

  expect_in(failures_2, failures)
})

test_that("if `ordered` but only one class, nothing extra is tested", {
  testthat::local_mocked_bindings(
    fails_for = function(expr, param, failures) { failures }
  )

  failures <- needs_class(
    "x",
    ignored(),
    classes = "test",
    ordered = TRUE
  )

  failures_2 <- needs_class(
    "x",
    ignored(),
    classes = "test",
    ordered = FALSE
  )

  expect_setequal(failures, failures_2)
})

test_that("`ordered` must be a flag", {
  needs_flag(
    "ordered",
    needs_class("x", identity(x = 0L), classes = "test")
  )
})

# `null_ok` --------------------------------------------------------------------
test_arg_null_ok(needs_class, classes = "test")
