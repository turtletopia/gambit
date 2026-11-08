# Test if parameter needs a vector

Runs a series of expectations with incorrect parameter values expecting
errors. The values are selected to cover all different manners of
incorrect input.

## Usage

``` r
needs_vector(
  param,
  expr,
  ...,
  strict = FALSE,
  any_missing = TRUE,
  all_missing = TRUE,
  len = NULL,
  min_len = 0L,
  max_len = Inf,
  unique = FALSE,
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

- strict:

  `logical(1)`  
  Whether to disallow the vector to have additional attributes; if
  `FALSE`, allows e.g. factors and data frames.

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
needs_vector(
  "subset.of",
  checkmate::test_names(letters[1:5], subset.of = letters),
  any_missing = FALSE,
  null_ok = TRUE
)
#> ── Snapshot ────────────────────────────────────────────────────────────────────
#> ℹ Can't save or compare to reference when testing interactively.
#> Code
#>   checkmate::test_names(x = letters[1:5], subset.of = c(1L, 2L, 
#>   3L, 4L, 5L, NA))
#> Condition
#>   Error in `checkNamesCmp()`:
#>   ! Assertion on 'subset.of' failed. Must be of class 'string', not 'integer'.
#> ────────────────────────────────────────────────────────────────────────────────
```
