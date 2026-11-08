# Test a parameter that needs a string

Runs a series of expectations with incorrect parameter values expecting
errors. The values are selected to cover all different manners of
incorrect input.

## Usage

``` r
needs_string(
  param,
  expr,
  ...,
  na_ok = FALSE,
  n_chars = NULL,
  min_chars = 0L,
  max_chars = Inf,
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

- n_chars:

  `integer(1) | NULL`  
  Exact length of the string. If specified, can't specify `min_chars`
  nor `max_chars`.

- min_chars:

  `integer(1)`  
  Minimum length of the string.

- max_chars:

  `integer(1)`  
  Maximum length of all strings. Must be more than `min_chars`. If these
  were to be equal, set `n_chars` instead.

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
needs_string(
  "pattern",
  checkmate::test_string("test", pattern = "st$"),
  null_ok = TRUE
)
#> Error in loadNamespace(x): there is no package called ‘checkmate’
```
