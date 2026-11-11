# Test a parameter that needs a count

Runs a series of expectations with incorrect parameter values expecting
errors. The values are selected to cover all different manners of
incorrect input.

A count is defined as single non-negative integer (or integerish
number).

## Usage

``` r
needs_count(param, expr, ..., na_ok = FALSE, positive = FALSE, null_ok = FALSE)
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

- positive:

  `logical(1)`  
  Whether to require positive value (i.e. disallow zero).

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

[`checkmate::assert_count()`](https://mllg.github.io/checkmate/reference/checkCount.html)
for checkmate counterpart.
