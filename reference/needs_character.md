# Test if parameter needs a character vector

Runs a series of expectations with incorrect parameter values expecting
errors. The values are selected to cover all different manners of
incorrect input.

## Usage

``` r
needs_character(
  param,
  expr,
  ...,
  n_chars = NULL,
  min_chars = 0L,
  max_chars = Inf,
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

- n_chars:

  `integer(1) | NULL`  
  Exact length of all strings. If specified, can't specify `min_chars`
  nor `max_chars`.

- min_chars:

  `integer(1)`  
  Minimum length of all strings.

- max_chars:

  `integer(1)`  
  Maximum length of all strings. Must be more than `min_chars`. If these
  were to be equal, set `n_chars` instead.

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

## Examples

``` r
needs_character(
  "subset.of",
  checkmate::test_names(letters, subset.of = letters),
  any_missing = FALSE,
  null_ok = TRUE
)
#> Error in loadNamespace(x): there is no package called ‘checkmate’
```
