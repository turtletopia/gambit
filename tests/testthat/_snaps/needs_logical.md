# succeeds with a locally defined function

    Code
      test_function(x = 156L)
    Condition
      Error in `test_function()`:
      ! Assertion on 'x' failed: Must be of type 'logical', not 'integer'.

---

    Code
      test_function(x = "TRUE")
    Condition
      Error in `test_function()`:
      ! Assertion on 'x' failed: Must be of type 'logical', not 'character'.

---

    Code
      test_function(x = list(TRUE))
    Condition
      Error in `test_function()`:
      ! Assertion on 'x' failed: Must be of type 'logical', not 'list'.

---

    Code
      test_function(x = NA_character_)
    Condition
      Error in `test_function()`:
      ! Assertion on 'x' failed: Must be of type 'logical', not 'character'.

---

    Code
      test_function(x = NULL)
    Condition
      Error in `test_function()`:
      ! Assertion on 'x' failed: Must be of type 'logical', not 'NULL'.

# `param` must be a string

    Code
      needs_logical(param = TRUE, expr = identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must be of type 'string', not 'logical'.

---

    Code
      needs_logical(param = 156L, expr = identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must be of type 'string', not 'integer'.

---

    Code
      needs_logical(param = list("string"), expr = identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must be of type 'string', not 'list'.

---

    Code
      needs_logical(param = c("string", "second"), expr = identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must have length 1.

---

    Code
      needs_logical(param = character(0), expr = identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must have length 1.

---

    Code
      needs_logical(param = NA_character_, expr = identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: May not be NA.

---

    Code
      needs_logical(param = NULL, expr = identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must be of type 'string', not 'NULL'.

# `param` must be one of tested function parameters

    Code
      needs_logical("y", identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must be element of set {'x'}, but is 'y'.

# `any_missing` must be a flag

    Code
      needs_logical(param = "x", expr = identity(x = 0L), any_missing = 156L)
    Condition
      Error in `needs_logical()`:
      ! Assertion on 'any_missing' failed: Must be of type 'logical flag', not 'integer'.

---

    Code
      needs_logical(param = "x", expr = identity(x = 0L), any_missing = "TRUE")
    Condition
      Error in `needs_logical()`:
      ! Assertion on 'any_missing' failed: Must be of type 'logical flag', not 'character'.

---

    Code
      needs_logical(param = "x", expr = identity(x = 0L), any_missing = list(
          TRUE))
    Condition
      Error in `needs_logical()`:
      ! Assertion on 'any_missing' failed: Must be of type 'logical flag', not 'list'.

---

    Code
      needs_logical(param = "x", expr = identity(x = 0L), any_missing = c(TRUE, 
      FALSE))
    Condition
      Error in `needs_logical()`:
      ! Assertion on 'any_missing' failed: Must have length 1.

---

    Code
      needs_logical(param = "x", expr = identity(x = 0L), any_missing = logical(0))
    Condition
      Error in `needs_logical()`:
      ! Assertion on 'any_missing' failed: Must have length 1.

---

    Code
      needs_logical(param = "x", expr = identity(x = 0L), any_missing = NA)
    Condition
      Error in `needs_logical()`:
      ! Assertion on 'any_missing' failed: May not be NA.

---

    Code
      needs_logical(param = "x", expr = identity(x = 0L), any_missing = NULL)
    Condition
      Error in `needs_logical()`:
      ! Assertion on 'any_missing' failed: Must be of type 'logical flag', not 'NULL'.

# `all_missing` must be a flag

    Code
      needs_logical(param = "x", expr = identity(x = 0L), all_missing = 156L)
    Condition
      Error in `needs_logical()`:
      ! Assertion on 'all_missing' failed: Must be of type 'logical flag', not 'integer'.

---

    Code
      needs_logical(param = "x", expr = identity(x = 0L), all_missing = "TRUE")
    Condition
      Error in `needs_logical()`:
      ! Assertion on 'all_missing' failed: Must be of type 'logical flag', not 'character'.

---

    Code
      needs_logical(param = "x", expr = identity(x = 0L), all_missing = list(
          TRUE))
    Condition
      Error in `needs_logical()`:
      ! Assertion on 'all_missing' failed: Must be of type 'logical flag', not 'list'.

---

    Code
      needs_logical(param = "x", expr = identity(x = 0L), all_missing = c(TRUE, 
      FALSE))
    Condition
      Error in `needs_logical()`:
      ! Assertion on 'all_missing' failed: Must have length 1.

---

    Code
      needs_logical(param = "x", expr = identity(x = 0L), all_missing = logical(0))
    Condition
      Error in `needs_logical()`:
      ! Assertion on 'all_missing' failed: Must have length 1.

---

    Code
      needs_logical(param = "x", expr = identity(x = 0L), all_missing = NA)
    Condition
      Error in `needs_logical()`:
      ! Assertion on 'all_missing' failed: May not be NA.

---

    Code
      needs_logical(param = "x", expr = identity(x = 0L), all_missing = NULL)
    Condition
      Error in `needs_logical()`:
      ! Assertion on 'all_missing' failed: Must be of type 'logical flag', not 'NULL'.

# `len` can't be supplied with `min_len` or `max_len`

    Code
      needs_logical("x", identity(x = 0L), len = 4L, min_len = 3L)
    Condition
      Error in `needs_logical()`:
      ! Can't supply 'len' if 'min_len' or 'max_len' already supplied.

---

    Code
      needs_logical("x", identity(x = 0L), len = 4L, max_len = 5L)
    Condition
      Error in `needs_logical()`:
      ! Can't supply 'len' if 'min_len' or 'max_len' already supplied.

# `max_len` must exceed `min_len`

    Code
      needs_logical("x", identity(x = 0L), max_len = 0L)
    Condition
      Error in `needs_logical()`:
      ! Assertion on 'max_len' failed: Element 1 is not >= 1.

---

    Code
      needs_logical("x", identity(x = 0L), min_len = 5L, max_len = 3L)
    Condition
      Error in `needs_logical()`:
      ! Assertion on 'max_len' failed: Element 1 is not >= 6.

# `unique` must be a flag

    Code
      needs_logical(param = "x", expr = identity(x = 0L), unique = 156L)
    Condition
      Error in `needs_logical()`:
      ! Assertion on 'unique' failed: Must be of type 'logical flag', not 'integer'.

---

    Code
      needs_logical(param = "x", expr = identity(x = 0L), unique = "TRUE")
    Condition
      Error in `needs_logical()`:
      ! Assertion on 'unique' failed: Must be of type 'logical flag', not 'character'.

---

    Code
      needs_logical(param = "x", expr = identity(x = 0L), unique = list(
          TRUE))
    Condition
      Error in `needs_logical()`:
      ! Assertion on 'unique' failed: Must be of type 'logical flag', not 'list'.

---

    Code
      needs_logical(param = "x", expr = identity(x = 0L), unique = c(TRUE, 
      FALSE))
    Condition
      Error in `needs_logical()`:
      ! Assertion on 'unique' failed: Must have length 1.

---

    Code
      needs_logical(param = "x", expr = identity(x = 0L), unique = logical(0))
    Condition
      Error in `needs_logical()`:
      ! Assertion on 'unique' failed: Must have length 1.

---

    Code
      needs_logical(param = "x", expr = identity(x = 0L), unique = NA)
    Condition
      Error in `needs_logical()`:
      ! Assertion on 'unique' failed: May not be NA.

---

    Code
      needs_logical(param = "x", expr = identity(x = 0L), unique = NULL)
    Condition
      Error in `needs_logical()`:
      ! Assertion on 'unique' failed: Must be of type 'logical flag', not 'NULL'.

# `typed_missing` must be a flag

    Code
      needs_logical(param = "x", expr = identity(x = 0L), typed_missing = 156L)
    Condition
      Error in `needs_logical()`:
      ! Assertion on 'typed_missing' failed: Must be of type 'logical flag', not 'integer'.

---

    Code
      needs_logical(param = "x", expr = identity(x = 0L), typed_missing = "TRUE")
    Condition
      Error in `needs_logical()`:
      ! Assertion on 'typed_missing' failed: Must be of type 'logical flag', not 'character'.

---

    Code
      needs_logical(param = "x", expr = identity(x = 0L), typed_missing = list(
          TRUE))
    Condition
      Error in `needs_logical()`:
      ! Assertion on 'typed_missing' failed: Must be of type 'logical flag', not 'list'.

---

    Code
      needs_logical(param = "x", expr = identity(x = 0L), typed_missing = c(TRUE, 
      FALSE))
    Condition
      Error in `needs_logical()`:
      ! Assertion on 'typed_missing' failed: Must have length 1.

---

    Code
      needs_logical(param = "x", expr = identity(x = 0L), typed_missing = logical(0))
    Condition
      Error in `needs_logical()`:
      ! Assertion on 'typed_missing' failed: Must have length 1.

---

    Code
      needs_logical(param = "x", expr = identity(x = 0L), typed_missing = NA)
    Condition
      Error in `needs_logical()`:
      ! Assertion on 'typed_missing' failed: May not be NA.

---

    Code
      needs_logical(param = "x", expr = identity(x = 0L), typed_missing = NULL)
    Condition
      Error in `needs_logical()`:
      ! Assertion on 'typed_missing' failed: Must be of type 'logical flag', not 'NULL'.

# `null_ok` must be a flag

    Code
      needs_logical(param = "x", expr = identity(x = 0L), null_ok = 156L)
    Condition
      Error in `needs_logical()`:
      ! Assertion on 'null_ok' failed: Must be of type 'logical flag', not 'integer'.

---

    Code
      needs_logical(param = "x", expr = identity(x = 0L), null_ok = "TRUE")
    Condition
      Error in `needs_logical()`:
      ! Assertion on 'null_ok' failed: Must be of type 'logical flag', not 'character'.

---

    Code
      needs_logical(param = "x", expr = identity(x = 0L), null_ok = list(
          TRUE))
    Condition
      Error in `needs_logical()`:
      ! Assertion on 'null_ok' failed: Must be of type 'logical flag', not 'list'.

---

    Code
      needs_logical(param = "x", expr = identity(x = 0L), null_ok = c(TRUE, 
      FALSE))
    Condition
      Error in `needs_logical()`:
      ! Assertion on 'null_ok' failed: Must have length 1.

---

    Code
      needs_logical(param = "x", expr = identity(x = 0L), null_ok = logical(0))
    Condition
      Error in `needs_logical()`:
      ! Assertion on 'null_ok' failed: Must have length 1.

---

    Code
      needs_logical(param = "x", expr = identity(x = 0L), null_ok = NA)
    Condition
      Error in `needs_logical()`:
      ! Assertion on 'null_ok' failed: May not be NA.

---

    Code
      needs_logical(param = "x", expr = identity(x = 0L), null_ok = NULL)
    Condition
      Error in `needs_logical()`:
      ! Assertion on 'null_ok' failed: Must be of type 'logical flag', not 'NULL'.

