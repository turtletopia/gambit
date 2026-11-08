# Test a parameter against failing values

Runs a series of expectations with incorrect parameter values expecting
errors. The values are supplied by the user.

## Usage

``` r
fails_for(param, expr, failures)
```

## Arguments

- param:

  `character(1)`  
  Name of the parameter to test.

- expr:

  `call(1)`  
  Example call to the tested function that does not fail.

- failures:

  [`list()`](https://rdrr.io/r/base/list.html)  
  Values that should fail assertions when passed to the tested function
  as `param` value.

## Value

Nothing, called for its side effect of running expectations.

## Details

Uses
[`testthat::expect_snapshot()`](https://testthat.r-lib.org/reference/expect_snapshot.html)
under the hood.

## Examples

``` r
fails_for(
  "os",
  checkmate::test_os("linux"),
  list(
    0L,
    character(),
    "chromium"
  )
)
#> Error in loadNamespace(x): there is no package called ‘checkmate’
```
