# Test a parameter that needs a flag

Runs a series of expectations with incorrect parameter values expecting
errors. The values are selected to cover all different manners of
incorrect input.

A flag is defined as single logical value.

## Usage

``` r
needs_flag(param, expr, ..., na_ok = FALSE, null_ok = FALSE)
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

## See also

[`checkmate::assert_flag()`](https://mllg.github.io/checkmate/reference/checkFlag.html)
for checkmate counterpart.

## Examples

``` r
needs_flag(
  "any.missing",
  checkmate::test_integer(5L, any.missing = TRUE)
)
#> ── Snapshot ────────────────────────────────────────────────────────────────────
#> ℹ Can't save or compare to reference when testing interactively.
#> Code
#>   checkmate::test_integer(x = 5L, any.missing = 156L)
#> Condition
#>   Error in `isTRUE()`:
#>   ! Argument 'any.missing' must be a flag, but is integer
#> ────────────────────────────────────────────────────────────────────────────────
#> ── Snapshot ────────────────────────────────────────────────────────────────────
#> ℹ Can't save or compare to reference when testing interactively.
#> Code
#>   checkmate::test_integer(x = 5L, any.missing = "TRUE")
#> Condition
#>   Error in `isTRUE()`:
#>   ! Argument 'any.missing' must be a flag, but is character
#> ────────────────────────────────────────────────────────────────────────────────
#> ── Snapshot ────────────────────────────────────────────────────────────────────
#> ℹ Can't save or compare to reference when testing interactively.
#> Code
#>   checkmate::test_integer(x = 5L, any.missing = list(TRUE))
#> Condition
#>   Error in `isTRUE()`:
#>   ! Argument 'any.missing' must be a flag, but is list
#> ────────────────────────────────────────────────────────────────────────────────
#> ── Snapshot ────────────────────────────────────────────────────────────────────
#> ℹ Can't save or compare to reference when testing interactively.
#> Code
#>   checkmate::test_integer(x = 5L, any.missing = c(TRUE, FALSE))
#> Condition
#>   Error in `isTRUE()`:
#>   ! Argument 'any.missing' must be a flag, but is logical
#> ────────────────────────────────────────────────────────────────────────────────
#> ── Snapshot ────────────────────────────────────────────────────────────────────
#> ℹ Can't save or compare to reference when testing interactively.
#> Code
#>   checkmate::test_integer(x = 5L, any.missing = logical(0))
#> Condition
#>   Error in `isTRUE()`:
#>   ! Argument 'any.missing' must be a flag, but is logical
#> ────────────────────────────────────────────────────────────────────────────────
#> ── Snapshot ────────────────────────────────────────────────────────────────────
#> ℹ Can't save or compare to reference when testing interactively.
#> Code
#>   checkmate::test_integer(x = 5L, any.missing = NA)
#> Condition
#>   Error in `isTRUE()`:
#>   ! Argument 'any.missing' may not be missing
#> ────────────────────────────────────────────────────────────────────────────────
#> ── Snapshot ────────────────────────────────────────────────────────────────────
#> ℹ Can't save or compare to reference when testing interactively.
#> Code
#>   checkmate::test_integer(x = 5L, any.missing = NULL)
#> Condition
#>   Error in `isTRUE()`:
#>   ! Argument 'any.missing' must be a flag, but is NULL
#> ────────────────────────────────────────────────────────────────────────────────
```
