# Test a parameter that needs an integerish vector

Runs a series of expectations with incorrect parameter values expecting
errors. The values are selected to cover all different manners of
incorrect input.

An integerish vector is one that can be safely converted to integer,
i.e. integer vectors and numeric vectors with values sufficiently close
to integers.

## Usage

``` r
needs_integerish(
  param,
  expr,
  ...,
  lower = -Inf,
  upper = Inf,
  any_missing = TRUE,
  all_missing = TRUE,
  len = NULL,
  min_len = 0L,
  max_len = Inf,
  unique = FALSE,
  sorted = FALSE,
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

- lower:

  `numeric(1)`  
  Minimum value, all elements of the parameter must be greater than or
  equal to.

- upper:

  `numeric(1)`  
  Maximum value, all elements of the parameter must be lower than or
  equal to.

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

- sorted:

  `logical(1)`  
  Whether elements must be sorted in ascending order.

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

[`checkmate::assert_integerish()`](https://mllg.github.io/checkmate/reference/checkIntegerish.html)
for checkmate counterpart.
