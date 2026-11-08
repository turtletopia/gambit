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
#> Error in loadNamespace(x): there is no package called ‘checkmate’
```
