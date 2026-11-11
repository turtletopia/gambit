
<!-- README.md is generated from README.Rmd. Please edit that file -->

# gambit

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/gambit)](https://CRAN.R-project.org/package=gambit)
[![R-CMD-check](https://github.com/turtletopia/gambit/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/turtletopia/gambit/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/turtletopia/gambit/graph/badge.svg)](https://app.codecov.io/gh/turtletopia/gambit)
<!-- badges: end -->

The goal of gambit is to provide test specifications as counterparts to
[{checkmate}](https://github.com/mllg/checkmate) assertions.

## Installation

You can install the development version of gambit from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("turtletopia/gambit")
```

## Usage

Suppose your R package defines a function. Perhaps you already added
{checkmate} assertions, perhaps you test function inputs some other way.
In any case, assume this function looks like this:

``` r
move_rook <- function(column, distance, direction = c("up", "down", "left", "right")) {
  direction <- match.arg(direction)
  checkmate::assert_string(column, n.chars = 1L)
  checkmate::assert_int(distance, lower = 1L)
  
  board$update_rook(column, distance, direction)
}
```

To cover it with unit tests, you’d normally \* test invariants, \* test
function behaviour with valid arguments, \* test errors raised with
invalid arguments.

The last part would usually be tedious - for each parameter of each
function, you should test a few different values, each failing for a
different reason. For example, you’d need to test `column` being given a
`NULL`, a non-character value, an empty character vector, a character
vector of length 2+, an empty string, an `NA_character_`, etc. This
would end up involving a lot of copying and pasting, and even if you do
not consider it an issue with your coding LLM, the real problem remains:
those tests are supposed to define requirements for function/parameter
behaviour, but reading them all is tedious and it’s easy to miss a test
case somewhere.

Instead, use {gambit} to specify your tests (called “needs”) just like
you’d specify {checkmate} assertions. It will generate several snapshots
that use
[\`testthat::expect_snapshot()](https://testthat.r-lib.org/reference/expect_snapshot.html)
under the hood:

``` r
gambit::needs_string("column", move_rook("A", 3L, direction = "up"), n_chars = 1L)
#> ── Snapshot ────────────────────────────────────────────────────────────────────
#> ℹ Can't save or compare to reference when testing interactively.
#> Code
#>   move_rook(column = TRUE, distance = 3L, direction = "up")
#> Condition
#>   Error in `move_rook()`:
#>   ! Assertion on 'column' failed: Must be of type 'string', not 'logical'.
#> ────────────────────────────────────────────────────────────────────────────────
#> ── Snapshot ────────────────────────────────────────────────────────────────────
#> ℹ Can't save or compare to reference when testing interactively.
#> Code
#>   move_rook(column = 156L, distance = 3L, direction = "up")
#> Condition
#>   Error in `move_rook()`:
#>   ! Assertion on 'column' failed: Must be of type 'string', not 'integer'.
#> ────────────────────────────────────────────────────────────────────────────────
#> ── Snapshot ────────────────────────────────────────────────────────────────────
#> ℹ Can't save or compare to reference when testing interactively.
#> Code
#>   move_rook(column = list("string"), distance = 3L, direction = "up")
#> Condition
#>   Error in `move_rook()`:
#>   ! Assertion on 'column' failed: Must be of type 'string', not 'list'.
#> ────────────────────────────────────────────────────────────────────────────────
#> ── Snapshot ────────────────────────────────────────────────────────────────────
#> ℹ Can't save or compare to reference when testing interactively.
#> Code
#>   move_rook(column = c("string", "second"), distance = 3L, direction = "up")
#> Condition
#>   Error in `move_rook()`:
#>   ! Assertion on 'column' failed: Must have length 1.
#> ────────────────────────────────────────────────────────────────────────────────
#> ── Snapshot ────────────────────────────────────────────────────────────────────
#> ℹ Can't save or compare to reference when testing interactively.
#> Code
#>   move_rook(column = character(0), distance = 3L, direction = "up")
#> Condition
#>   Error in `move_rook()`:
#>   ! Assertion on 'column' failed: Must have length 1.
#> ────────────────────────────────────────────────────────────────────────────────
#> ── Snapshot ────────────────────────────────────────────────────────────────────
#> ℹ Can't save or compare to reference when testing interactively.
#> Code
#>   move_rook(column = NA_character_, distance = 3L, direction = "up")
#> Condition
#>   Error in `move_rook()`:
#>   ! Assertion on 'column' failed: May not be NA.
#> ────────────────────────────────────────────────────────────────────────────────
#> ── Snapshot ────────────────────────────────────────────────────────────────────
#> ℹ Can't save or compare to reference when testing interactively.
#> Code
#>   move_rook(column = "", distance = 3L, direction = "up")
#> Condition
#>   Error in `move_rook()`:
#>   ! Assertion on 'column' failed: All elements must have exactly 1 characters, but element 1 has 0 chararacters.
#> ────────────────────────────────────────────────────────────────────────────────
#> ── Snapshot ────────────────────────────────────────────────────────────────────
#> ℹ Can't save or compare to reference when testing interactively.
#> Code
#>   move_rook(column = "xx", distance = 3L, direction = "up")
#> Condition
#>   Error in `move_rook()`:
#>   ! Assertion on 'column' failed: All elements must have exactly 1 characters, but element 1 has 2 chararacters.
#> ────────────────────────────────────────────────────────────────────────────────
#> ── Snapshot ────────────────────────────────────────────────────────────────────
#> ℹ Can't save or compare to reference when testing interactively.
#> Code
#>   move_rook(column = NULL, distance = 3L, direction = "up")
#> Condition
#>   Error in `move_rook()`:
#>   ! Assertion on 'column' failed: Must be of type 'string', not 'NULL'.
#> ────────────────────────────────────────────────────────────────────────────────
```

``` r
gambit::needs_int("distance", move_rook("A", 3L, direction = "up"), lower = 1L)
#> ── Snapshot ────────────────────────────────────────────────────────────────────
#> ℹ Can't save or compare to reference when testing interactively.
#> Code
#>   move_rook(column = "A", distance = TRUE, direction = "up")
#> Condition
#>   Error in `move_rook()`:
#>   ! Assertion on 'distance' failed: Must be of type 'single integerish value', not 'logical'.
#> ────────────────────────────────────────────────────────────────────────────────
#> ── Snapshot ────────────────────────────────────────────────────────────────────
#> ℹ Can't save or compare to reference when testing interactively.
#> Code
#>   move_rook(column = "A", distance = "156", direction = "up")
#> Condition
#>   Error in `move_rook()`:
#>   ! Assertion on 'distance' failed: Must be of type 'single integerish value', not 'character'.
#> ────────────────────────────────────────────────────────────────────────────────
#> ── Snapshot ────────────────────────────────────────────────────────────────────
#> ℹ Can't save or compare to reference when testing interactively.
#> Code
#>   move_rook(column = "A", distance = list(156L), direction = "up")
#> Condition
#>   Error in `move_rook()`:
#>   ! Assertion on 'distance' failed: Must be of type 'single integerish value', not 'list'.
#> ────────────────────────────────────────────────────────────────────────────────
#> ── Snapshot ────────────────────────────────────────────────────────────────────
#> ℹ Can't save or compare to reference when testing interactively.
#> Code
#>   move_rook(column = "A", distance = 156.5, direction = "up")
#> Condition
#>   Error in `move_rook()`:
#>   ! Assertion on 'distance' failed: Must be of type 'single integerish value', not 'double'.
#> ────────────────────────────────────────────────────────────────────────────────
#> ── Snapshot ────────────────────────────────────────────────────────────────────
#> ℹ Can't save or compare to reference when testing interactively.
#> Code
#>   move_rook(column = "A", distance = 156:157, direction = "up")
#> Condition
#>   Error in `move_rook()`:
#>   ! Assertion on 'distance' failed: Must have length 1.
#> ────────────────────────────────────────────────────────────────────────────────
#> ── Snapshot ────────────────────────────────────────────────────────────────────
#> ℹ Can't save or compare to reference when testing interactively.
#> Code
#>   move_rook(column = "A", distance = integer(0), direction = "up")
#> Condition
#>   Error in `move_rook()`:
#>   ! Assertion on 'distance' failed: Must have length 1.
#> ────────────────────────────────────────────────────────────────────────────────
#> ── Snapshot ────────────────────────────────────────────────────────────────────
#> ℹ Can't save or compare to reference when testing interactively.
#> Code
#>   move_rook(column = "A", distance = NA_integer_, direction = "up")
#> Condition
#>   Error in `move_rook()`:
#>   ! Assertion on 'distance' failed: May not be NA.
#> ────────────────────────────────────────────────────────────────────────────────
#> ── Snapshot ────────────────────────────────────────────────────────────────────
#> ℹ Can't save or compare to reference when testing interactively.
#> Code
#>   move_rook(column = "A", distance = -Inf, direction = "up")
#> Condition
#>   Error in `move_rook()`:
#>   ! Assertion on 'distance' failed: Must be of type 'single integerish value', not 'double'.
#> ────────────────────────────────────────────────────────────────────────────────
#> ── Snapshot ────────────────────────────────────────────────────────────────────
#> ℹ Can't save or compare to reference when testing interactively.
#> Code
#>   move_rook(column = "A", distance = 0, direction = "up")
#> Condition
#>   Error in `move_rook()`:
#>   ! Assertion on 'distance' failed: Element 1 is not >= 1.
#> ────────────────────────────────────────────────────────────────────────────────
#> ── Snapshot ────────────────────────────────────────────────────────────────────
#> ℹ Can't save or compare to reference when testing interactively.
#> Code
#>   move_rook(column = "A", distance = NULL, direction = "up")
#> Condition
#>   Error in `move_rook()`:
#>   ! Assertion on 'distance' failed: Must be of type 'single integerish value', not 'NULL'.
#> ────────────────────────────────────────────────────────────────────────────────
```

A gambit specification requires parameter name (e.g. `"column"`) and
example valid function call
(e.g. `move_rook("A", 3L, direction = "up"`)), then the other parameters
are analogues of the {checkmate} parameters (except for using
underscores instead of dots). Additionally, {gambit} makes additional
assertions to needs specifications, not allowing you to - for example -
specify `n_chars` and `min_chars` simultaneously.

Note that the function you provide is never supposed to execute in its
entirety, so its execution time should never come into play, as the
assertions should come first. In fact, note how none of the exceptions
above mention `board` that `move_rook()` uses in its definition, even
though it hasn’t been defined anywhere. That’s because we never get that
far.
