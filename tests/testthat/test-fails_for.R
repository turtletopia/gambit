# Example call -----------------------------------------------------------------
test_that("succeeds with a locally defined function", {
  test_function <- function(x) {
    checkmate::assert_choice(x, c("one", "two", "eight"))
  }

  fails_for(
    "x",
    test_function(x = "two"),
    list(
      1L,
      character(),
      "seven",
      NULL
    )
  )
})

test_that("succeeds with an imported function", {
  fails_for(
    "os",
    checkmate::test_os("linux"),
    list(
      0L,
      character(),
      "chromium"
    )
  )
})

# Parameter assertions ---------------------------------------------------------
test_that("`param` must be a string", {
  needs_string(
    "param",
    fails_for("x", identity(x = 0L), list(NULL))
  )
})

test_that("`param` must be one of tested function parameters", {
  expect_snapshot(
    fails_for("y", identity(x = 0L), list(NULL)),
    cran = TRUE,
    error = TRUE
  )
})
