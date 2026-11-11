# Test a parameter that needs a logical vector

Runs a series of expectations with incorrect parameter values expecting
errors. The values are selected to cover all different manners of
incorrect input.

## Usage

``` r
needs_logical(
  param,
  expr,
  ...,
  any_missing = TRUE,
  all_missing = TRUE,
  len = NULL,
  min_len = 0L,
  max_len = Inf,
  unique = FALSE,
  typed_missing = TRUE,
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

- any_missing:

  `logical(1)`  
  Whether missing values are allowed or not.

- all_missing:

  `logical(1)`  
  Whether vectors with no non-missing values are allowed or not.

- len:

  `integer(1) | NULL`  
  Exact length of the vector. If specified, can't specify `min_len` nor
  `max_len`.

- min_len:

  `integer(1)`  
  Minimum length of the vector.

- max_len:

  `integer(1)`  
  Maximum length of the vector. Must be more than `min_len`. If these
  were to be equal, set `len` instead.

- unique:

  `logical(1)`  
  Whether all values must be unique or not.

- typed_missing:

  `logical(1)`  
  Whether `NA` of non-numeric types should be marked as invalid or not.

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

[`checkmate::assert_logical()`](https://mllg.github.io/checkmate/reference/checkLogical.html)
for checkmate counterpart.
