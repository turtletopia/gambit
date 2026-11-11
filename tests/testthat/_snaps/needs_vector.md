# succeeds with a locally defined function

    Code
      test_function(x = NULL)
    Condition
      Error in `test_function()`:
      ! Assertion on 'x' failed: Must be of type 'vector', not 'NULL'.

# succeeds with an imported function

    Code
      checkmate::test_names(x = letters[1:5], subset.of = c(1L, 2L, 
      3L, 4L, 5L, NA))
    Condition
      Error in `checkNamesCmp()`:
      ! Assertion on 'subset.of' failed. Must be of class 'string', not 'integer'.

# `param` must be a string

    Code
      needs_vector(param = TRUE, expr = identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must be of type 'string', not 'logical'.

---

    Code
      needs_vector(param = 156L, expr = identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must be of type 'string', not 'integer'.

---

    Code
      needs_vector(param = list("string"), expr = identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must be of type 'string', not 'list'.

---

    Code
      needs_vector(param = c("string", "second"), expr = identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must have length 1.

---

    Code
      needs_vector(param = character(0), expr = identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must have length 1.

---

    Code
      needs_vector(param = NA_character_, expr = identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: May not be NA.

---

    Code
      needs_vector(param = NULL, expr = identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must be of type 'string', not 'NULL'.

# `param` must be one of tested function parameters

    Code
      needs_vector("y", identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must be element of set {'x'}, but is 'y'.

# `strict` must be a flag

    Code
      needs_vector(param = "x", expr = identity(x = 0L), strict = 156L)
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'strict' failed: Must be of type 'logical flag', not 'integer'.

---

    Code
      needs_vector(param = "x", expr = identity(x = 0L), strict = "TRUE")
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'strict' failed: Must be of type 'logical flag', not 'character'.

---

    Code
      needs_vector(param = "x", expr = identity(x = 0L), strict = list(
          TRUE))
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'strict' failed: Must be of type 'logical flag', not 'list'.

---

    Code
      needs_vector(param = "x", expr = identity(x = 0L), strict = c(TRUE, 
      FALSE))
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'strict' failed: Must have length 1.

---

    Code
      needs_vector(param = "x", expr = identity(x = 0L), strict = logical(0))
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'strict' failed: Must have length 1.

---

    Code
      needs_vector(param = "x", expr = identity(x = 0L), strict = NA)
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'strict' failed: May not be NA.

---

    Code
      needs_vector(param = "x", expr = identity(x = 0L), strict = NULL)
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'strict' failed: Must be of type 'logical flag', not 'NULL'.

# `any_missing` must be a flag

    Code
      needs_vector(param = "x", expr = identity(x = 0L), any_missing = 156L)
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'any_missing' failed: Must be of type 'logical flag', not 'integer'.

---

    Code
      needs_vector(param = "x", expr = identity(x = 0L), any_missing = "TRUE")
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'any_missing' failed: Must be of type 'logical flag', not 'character'.

---

    Code
      needs_vector(param = "x", expr = identity(x = 0L), any_missing = list(
          TRUE))
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'any_missing' failed: Must be of type 'logical flag', not 'list'.

---

    Code
      needs_vector(param = "x", expr = identity(x = 0L), any_missing = c(TRUE, 
      FALSE))
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'any_missing' failed: Must have length 1.

---

    Code
      needs_vector(param = "x", expr = identity(x = 0L), any_missing = logical(0))
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'any_missing' failed: Must have length 1.

---

    Code
      needs_vector(param = "x", expr = identity(x = 0L), any_missing = NA)
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'any_missing' failed: May not be NA.

---

    Code
      needs_vector(param = "x", expr = identity(x = 0L), any_missing = NULL)
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'any_missing' failed: Must be of type 'logical flag', not 'NULL'.

# `all_missing` must be a flag

    Code
      needs_vector(param = "x", expr = identity(x = 0L), all_missing = 156L)
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'all_missing' failed: Must be of type 'logical flag', not 'integer'.

---

    Code
      needs_vector(param = "x", expr = identity(x = 0L), all_missing = "TRUE")
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'all_missing' failed: Must be of type 'logical flag', not 'character'.

---

    Code
      needs_vector(param = "x", expr = identity(x = 0L), all_missing = list(
          TRUE))
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'all_missing' failed: Must be of type 'logical flag', not 'list'.

---

    Code
      needs_vector(param = "x", expr = identity(x = 0L), all_missing = c(TRUE, 
      FALSE))
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'all_missing' failed: Must have length 1.

---

    Code
      needs_vector(param = "x", expr = identity(x = 0L), all_missing = logical(0))
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'all_missing' failed: Must have length 1.

---

    Code
      needs_vector(param = "x", expr = identity(x = 0L), all_missing = NA)
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'all_missing' failed: May not be NA.

---

    Code
      needs_vector(param = "x", expr = identity(x = 0L), all_missing = NULL)
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'all_missing' failed: Must be of type 'logical flag', not 'NULL'.

# `len` must be a count or NULL

    Code
      needs_vector(param = "x", expr = identity(x = 0L), len = TRUE)
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'len' failed: Must be of type 'count' (or 'NULL'), not 'logical'.

---

    Code
      needs_vector(param = "x", expr = identity(x = 0L), len = "156")
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'len' failed: Must be of type 'count' (or 'NULL'), not 'character'.

---

    Code
      needs_vector(param = "x", expr = identity(x = 0L), len = list(
          156L))
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'len' failed: Must be of type 'count' (or 'NULL'), not 'list'.

---

    Code
      needs_vector(param = "x", expr = identity(x = 0L), len = 156.5)
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'len' failed: Must be of type 'count' (or 'NULL'), not 'double'.

---

    Code
      needs_vector(param = "x", expr = identity(x = 0L), len = 156:157)
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'len' failed: Must have length 1.

---

    Code
      needs_vector(param = "x", expr = identity(x = 0L), len = integer(0))
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'len' failed: Must have length 1.

---

    Code
      needs_vector(param = "x", expr = identity(x = 0L), len = -4L)
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'len' failed: Must be >= 0.

---

    Code
      needs_vector(param = "x", expr = identity(x = 0L), len = NA_integer_)
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'len' failed: May not be NA.

# `len` can't be supplied with `min_len` or `max_len`

    Code
      needs_vector("x", identity(x = 0L), len = 4L, min_len = 3L)
    Condition
      Error in `needs_vector()`:
      ! Can't supply 'len' if 'min_len' or 'max_len' already supplied.

---

    Code
      needs_vector("x", identity(x = 0L), len = 4L, max_len = 5L)
    Condition
      Error in `needs_vector()`:
      ! Can't supply 'len' if 'min_len' or 'max_len' already supplied.

# `min_len` must be a count

    Code
      needs_vector(param = "x", expr = identity(x = 0L), min_len = TRUE)
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'min_len' failed: Must be of type 'count', not 'logical'.

---

    Code
      needs_vector(param = "x", expr = identity(x = 0L), min_len = "156")
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'min_len' failed: Must be of type 'count', not 'character'.

---

    Code
      needs_vector(param = "x", expr = identity(x = 0L), min_len = list(
          156L))
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'min_len' failed: Must be of type 'count', not 'list'.

---

    Code
      needs_vector(param = "x", expr = identity(x = 0L), min_len = 156.5)
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'min_len' failed: Must be of type 'count', not 'double'.

---

    Code
      needs_vector(param = "x", expr = identity(x = 0L), min_len = 156:157)
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'min_len' failed: Must have length 1.

---

    Code
      needs_vector(param = "x", expr = identity(x = 0L), min_len = integer(0))
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'min_len' failed: Must have length 1.

---

    Code
      needs_vector(param = "x", expr = identity(x = 0L), min_len = -4L)
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'min_len' failed: Must be >= 0.

---

    Code
      needs_vector(param = "x", expr = identity(x = 0L), min_len = NA_integer_)
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'min_len' failed: May not be NA.

---

    Code
      needs_vector(param = "x", expr = identity(x = 0L), min_len = NULL)
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'min_len' failed: Must be of type 'count', not 'NULL'.

# `max_len` must be a count

    Code
      needs_vector(param = "x", expr = identity(x = 0L), max_len = TRUE)
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'max_len' failed: Must be of type 'single integerish value', not 'logical'.

---

    Code
      needs_vector(param = "x", expr = identity(x = 0L), max_len = "156")
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'max_len' failed: Must be of type 'single integerish value', not 'character'.

---

    Code
      needs_vector(param = "x", expr = identity(x = 0L), max_len = list(
          156L))
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'max_len' failed: Must be of type 'single integerish value', not 'list'.

---

    Code
      needs_vector(param = "x", expr = identity(x = 0L), max_len = 156.5)
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'max_len' failed: Must be of type 'single integerish value', not 'double'.

---

    Code
      needs_vector(param = "x", expr = identity(x = 0L), max_len = 156:157)
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'max_len' failed: Must have length 1.

---

    Code
      needs_vector(param = "x", expr = identity(x = 0L), max_len = integer(0))
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'max_len' failed: Must have length 1.

---

    Code
      needs_vector(param = "x", expr = identity(x = 0L), max_len = -4L)
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'max_len' failed: Element 1 is not >= 1.

---

    Code
      needs_vector(param = "x", expr = identity(x = 0L), max_len = NA_integer_)
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'max_len' failed: May not be NA.

---

    Code
      needs_vector(param = "x", expr = identity(x = 0L), max_len = NULL)
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'max_len' failed: Must be of type 'single integerish value', not 'NULL'.

# `max_len` must exceed `min_len`

    Code
      needs_vector("x", identity(x = 0L), max_len = 0L)
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'max_len' failed: Element 1 is not >= 1.

---

    Code
      needs_vector("x", identity(x = 0L), min_len = 5L, max_len = 3L)
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'max_len' failed: Element 1 is not >= 6.

# `unique` must be a flag

    Code
      needs_vector(param = "x", expr = identity(x = 0L), unique = 156L)
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'unique' failed: Must be of type 'logical flag', not 'integer'.

---

    Code
      needs_vector(param = "x", expr = identity(x = 0L), unique = "TRUE")
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'unique' failed: Must be of type 'logical flag', not 'character'.

---

    Code
      needs_vector(param = "x", expr = identity(x = 0L), unique = list(
          TRUE))
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'unique' failed: Must be of type 'logical flag', not 'list'.

---

    Code
      needs_vector(param = "x", expr = identity(x = 0L), unique = c(TRUE, 
      FALSE))
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'unique' failed: Must have length 1.

---

    Code
      needs_vector(param = "x", expr = identity(x = 0L), unique = logical(0))
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'unique' failed: Must have length 1.

---

    Code
      needs_vector(param = "x", expr = identity(x = 0L), unique = NA)
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'unique' failed: May not be NA.

---

    Code
      needs_vector(param = "x", expr = identity(x = 0L), unique = NULL)
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'unique' failed: Must be of type 'logical flag', not 'NULL'.

# `null_ok` must be a flag

    Code
      needs_vector(param = "x", expr = identity(x = 0L), null_ok = 156L)
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'null_ok' failed: Must be of type 'logical flag', not 'integer'.

---

    Code
      needs_vector(param = "x", expr = identity(x = 0L), null_ok = "TRUE")
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'null_ok' failed: Must be of type 'logical flag', not 'character'.

---

    Code
      needs_vector(param = "x", expr = identity(x = 0L), null_ok = list(
          TRUE))
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'null_ok' failed: Must be of type 'logical flag', not 'list'.

---

    Code
      needs_vector(param = "x", expr = identity(x = 0L), null_ok = c(TRUE, 
      FALSE))
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'null_ok' failed: Must have length 1.

---

    Code
      needs_vector(param = "x", expr = identity(x = 0L), null_ok = logical(0))
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'null_ok' failed: Must have length 1.

---

    Code
      needs_vector(param = "x", expr = identity(x = 0L), null_ok = NA)
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'null_ok' failed: May not be NA.

---

    Code
      needs_vector(param = "x", expr = identity(x = 0L), null_ok = NULL)
    Condition
      Error in `needs_vector()`:
      ! Assertion on 'null_ok' failed: Must be of type 'logical flag', not 'NULL'.

