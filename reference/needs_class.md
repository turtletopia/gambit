# Test a parameter that needs class membership

Runs a series of expectations with incorrect parameter values expecting
errors. The values are selected to cover all different manners of
incorrect input.

## Usage

``` r
needs_class(param, expr, ..., classes, ordered = FALSE, null_ok = FALSE)
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

- classes:

  [`character()`](https://rdrr.io/r/base/character.html)  
  Class names the parameter value must inherit from. Must specify at
  least one. Can't be missing or duplicated.

- ordered:

  `logical(1)`  
  Whether the classes must appear in the specified order.

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

[`checkmate::assert_class()`](https://mllg.github.io/checkmate/reference/checkClass.html)
for checkmate counterpart.
