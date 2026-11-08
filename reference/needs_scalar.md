# Test a parameter that needs a single atomic value

Runs a series of expectations with incorrect parameter values expecting
errors. The values are selected to cover all different manners of
incorrect input.

## Usage

``` r
needs_scalar(param, expr, ..., na_ok = FALSE, null_ok = FALSE)
```

## Arguments

- param:

  `character(1)`  
  Name of the parameter to test.

- expr:

  `call(1)`  
  Example call to the tested function that does not fail.

- ...:

  Reserved for future extensions and must be empty.

- na_ok:

  `logical(1)`  
  Whether missing values are allowed or not.

- null_ok:

  `logical(1)`  
  Whether `NULL` is also allowed or not.

## Value

Nothing, called for its side effect of running expectations.

## Details

Uses
[`testthat::expect_snapshot()`](https://testthat.r-lib.org/reference/expect_snapshot.html)
under the hood.

## Examples

``` r
test_function <- function(x) {
  checkmate::assert_scalar(x)
}

needs_scalar(
  "x",
  test_function(x = 3L)
)
#> ── Snapshot ────────────────────────────────────────────────────────────────────
#> ℹ Can't save or compare to reference when testing interactively.
#> Code
#>   test_function(x = list(1L))
#> Condition
#>   Error in `test_function()`:
#>   ! Assertion on 'x' failed: Must be of type 'atomic scalar', not 'list'.
#> ────────────────────────────────────────────────────────────────────────────────
#> ── Snapshot ────────────────────────────────────────────────────────────────────
#> ℹ Can't save or compare to reference when testing interactively.
#> Code
#>   test_function(x = c(TRUE, FALSE))
#> Condition
#>   Error in `test_function()`:
#>   ! Assertion on 'x' failed: Must have length 1.
#> ────────────────────────────────────────────────────────────────────────────────
#> ── Snapshot ────────────────────────────────────────────────────────────────────
#> ℹ Can't save or compare to reference when testing interactively.
#> Code
#>   test_function(x = character(0))
#> Condition
#>   Error in `test_function()`:
#>   ! Assertion on 'x' failed: Must have length 1.
#> ────────────────────────────────────────────────────────────────────────────────
#> ── Snapshot ────────────────────────────────────────────────────────────────────
#> ℹ Can't save or compare to reference when testing interactively.
#> Code
#>   test_function(x = NA)
#> Condition
#>   Error in `test_function()`:
#>   ! Assertion on 'x' failed: May not be NA.
#> ────────────────────────────────────────────────────────────────────────────────
#> ── Snapshot ────────────────────────────────────────────────────────────────────
#> ℹ Can't save or compare to reference when testing interactively.
#> Code
#>   test_function(x = NULL)
#> Condition
#>   Error in `test_function()`:
#>   ! Assertion on 'x' failed: Must be of type 'atomic scalar', not 'NULL'.
#> ────────────────────────────────────────────────────────────────────────────────
```
