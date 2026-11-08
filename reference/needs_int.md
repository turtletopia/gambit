# Test a parameter that needs a single integerish value

Runs a series of expectations with incorrect parameter values expecting
errors. The values are selected to cover all different manners of
incorrect input.

## Usage

``` r
needs_int(
  param,
  expr,
  ...,
  na_ok = FALSE,
  lower = -Inf,
  upper = Inf,
  null_ok = FALSE
)
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

- lower:

  `numeric(1)`  
  Minimum value of the parameter.

- upper:

  `numeric(1)`  
  Maximum value of the parameter.

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
needs_int(
  "min.chars",
  checkmate::test_string("test", min.chars = 3),
  null_ok = TRUE
)
#> Error in loadNamespace(x): there is no package called ‘checkmate’
```
