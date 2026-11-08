# succeeds with a locally defined function

    Code
      test_function(x = TRUE)
    Condition
      Error in `test_function()`:
      ! Assertion on 'x' failed: Must be of type 'character', not 'logical'.

---

    Code
      test_function(x = 156L)
    Condition
      Error in `test_function()`:
      ! Assertion on 'x' failed: Must be of type 'character', not 'integer'.

---

    Code
      test_function(x = list("string"))
    Condition
      Error in `test_function()`:
      ! Assertion on 'x' failed: Must be of type 'character', not 'list'.

---

    Code
      test_function(x = NA_integer_)
    Condition
      Error in `test_function()`:
      ! Assertion on 'x' failed: Must be of type 'character', not 'integer'.

---

    Code
      test_function(x = NULL)
    Condition
      Error in `test_function()`:
      ! Assertion on 'x' failed: Must be of type 'character', not 'NULL'.

# succeeds with an imported function

    Code
      checkmate::test_names(x = letters, subset.of = TRUE)
    Condition
      Error in `checkNamesCmp()`:
      ! Assertion on 'subset.of' failed. Must be of class 'string', not 'logical'.

---

    Code
      checkmate::test_names(x = letters, subset.of = 156L)
    Condition
      Error in `checkNamesCmp()`:
      ! Assertion on 'subset.of' failed. Must be of class 'string', not 'integer'.

---

    Code
      checkmate::test_names(x = letters, subset.of = list("string"))
    Condition
      Error in `checkNamesCmp()`:
      ! Assertion on 'subset.of' failed. Must be of class 'string', not 'list'.

---

    Code
      checkmate::test_names(x = letters, subset.of = c("string", NA
      ))
    Condition
      Error in `checkNamesCmp()`:
      ! Assertion on 'subset.of' failed. May not contain missing values, first at position 2.

---

    Code
      checkmate::test_names(x = letters, subset.of = NA_integer_)
    Condition
      Error in `checkNamesCmp()`:
      ! Assertion on 'subset.of' failed. Must be of class 'string', not 'integer'.

# `param` must be a string

    Code
      needs_character(param = TRUE, expr = identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must be of type 'string', not 'logical'.

---

    Code
      needs_character(param = 156L, expr = identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must be of type 'string', not 'integer'.

---

    Code
      needs_character(param = list("string"), expr = identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must be of type 'string', not 'list'.

---

    Code
      needs_character(param = c("string", "second"), expr = identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must have length 1.

---

    Code
      needs_character(param = character(0), expr = identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must have length 1.

---

    Code
      needs_character(param = NA_character_, expr = identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: May not be NA.

---

    Code
      needs_character(param = NULL, expr = identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must be of type 'string', not 'NULL'.

# `param` must be one of tested function parameters

    Code
      needs_character("y", identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must be element of set {'x'}, but is 'y'.

# `n_chars` can't be supplied with `min_chars` or `max_chars`

    Code
      needs_character("x", identity(x = 0L), n_chars = 4L, min_chars = 3L)
    Condition
      Error in `needs_character()`:
      ! Can't supply 'n_chars' if 'min_chars' or 'max_chars' already supplied.

---

    Code
      needs_character("x", identity(x = 0L), n_chars = 4L, max_chars = 5L)
    Condition
      Error in `needs_character()`:
      ! Can't supply 'n_chars' if 'min_chars' or 'max_chars' already supplied.

# `max_chars` must exceed `min_chars`

    Code
      needs_character("x", identity(x = 0L), max_chars = 0L)
    Condition
      Error in `needs_character()`:
      ! Assertion on 'max_chars' failed: Element 1 is not >= 1.

---

    Code
      needs_character("x", identity(x = 0L), min_chars = 5L, max_chars = 3L)
    Condition
      Error in `needs_character()`:
      ! Assertion on 'max_chars' failed: Element 1 is not >= 6.

# `any_missing` must be a flag

    Code
      needs_character(param = "x", expr = identity(x = 0L), any_missing = 156L)
    Condition
      Error in `needs_character()`:
      ! Assertion on 'any_missing' failed: Must be of type 'logical flag', not 'integer'.

---

    Code
      needs_character(param = "x", expr = identity(x = 0L), any_missing = "TRUE")
    Condition
      Error in `needs_character()`:
      ! Assertion on 'any_missing' failed: Must be of type 'logical flag', not 'character'.

---

    Code
      needs_character(param = "x", expr = identity(x = 0L), any_missing = list(
          TRUE))
    Condition
      Error in `needs_character()`:
      ! Assertion on 'any_missing' failed: Must be of type 'logical flag', not 'list'.

---

    Code
      needs_character(param = "x", expr = identity(x = 0L), any_missing = c(TRUE, 
      FALSE))
    Condition
      Error in `needs_character()`:
      ! Assertion on 'any_missing' failed: Must have length 1.

---

    Code
      needs_character(param = "x", expr = identity(x = 0L), any_missing = logical(0))
    Condition
      Error in `needs_character()`:
      ! Assertion on 'any_missing' failed: Must have length 1.

---

    Code
      needs_character(param = "x", expr = identity(x = 0L), any_missing = NA)
    Condition
      Error in `needs_character()`:
      ! Assertion on 'any_missing' failed: May not be NA.

---

    Code
      needs_character(param = "x", expr = identity(x = 0L), any_missing = NULL)
    Condition
      Error in `needs_character()`:
      ! Assertion on 'any_missing' failed: Must be of type 'logical flag', not 'NULL'.

# `all_missing` must be a flag

    Code
      needs_character(param = "x", expr = identity(x = 0L), all_missing = 156L)
    Condition
      Error in `needs_character()`:
      ! Assertion on 'all_missing' failed: Must be of type 'logical flag', not 'integer'.

---

    Code
      needs_character(param = "x", expr = identity(x = 0L), all_missing = "TRUE")
    Condition
      Error in `needs_character()`:
      ! Assertion on 'all_missing' failed: Must be of type 'logical flag', not 'character'.

---

    Code
      needs_character(param = "x", expr = identity(x = 0L), all_missing = list(
          TRUE))
    Condition
      Error in `needs_character()`:
      ! Assertion on 'all_missing' failed: Must be of type 'logical flag', not 'list'.

---

    Code
      needs_character(param = "x", expr = identity(x = 0L), all_missing = c(TRUE, 
      FALSE))
    Condition
      Error in `needs_character()`:
      ! Assertion on 'all_missing' failed: Must have length 1.

---

    Code
      needs_character(param = "x", expr = identity(x = 0L), all_missing = logical(0))
    Condition
      Error in `needs_character()`:
      ! Assertion on 'all_missing' failed: Must have length 1.

---

    Code
      needs_character(param = "x", expr = identity(x = 0L), all_missing = NA)
    Condition
      Error in `needs_character()`:
      ! Assertion on 'all_missing' failed: May not be NA.

---

    Code
      needs_character(param = "x", expr = identity(x = 0L), all_missing = NULL)
    Condition
      Error in `needs_character()`:
      ! Assertion on 'all_missing' failed: Must be of type 'logical flag', not 'NULL'.

# `len` can't be supplied with `min_len` or `max_len`

    Code
      needs_character("x", identity(x = 0L), len = 4L, min_len = 3L)
    Condition
      Error in `needs_character()`:
      ! Can't supply 'len' if 'min_len' or 'max_len' already supplied.

---

    Code
      needs_character("x", identity(x = 0L), len = 4L, max_len = 5L)
    Condition
      Error in `needs_character()`:
      ! Can't supply 'len' if 'min_len' or 'max_len' already supplied.

# `max_len` must exceed `min_len`

    Code
      needs_character("x", identity(x = 0L), max_len = 0L)
    Condition
      Error in `needs_character()`:
      ! Assertion on 'max_len' failed: Element 1 is not >= 1.

---

    Code
      needs_character("x", identity(x = 0L), min_len = 5L, max_len = 3L)
    Condition
      Error in `needs_character()`:
      ! Assertion on 'max_len' failed: Element 1 is not >= 6.

# `unique` must be a flag

    Code
      needs_character(param = "x", expr = identity(x = 0L), unique = 156L)
    Condition
      Error in `needs_character()`:
      ! Assertion on 'unique' failed: Must be of type 'logical flag', not 'integer'.

---

    Code
      needs_character(param = "x", expr = identity(x = 0L), unique = "TRUE")
    Condition
      Error in `needs_character()`:
      ! Assertion on 'unique' failed: Must be of type 'logical flag', not 'character'.

---

    Code
      needs_character(param = "x", expr = identity(x = 0L), unique = list(
          TRUE))
    Condition
      Error in `needs_character()`:
      ! Assertion on 'unique' failed: Must be of type 'logical flag', not 'list'.

---

    Code
      needs_character(param = "x", expr = identity(x = 0L), unique = c(TRUE, 
      FALSE))
    Condition
      Error in `needs_character()`:
      ! Assertion on 'unique' failed: Must have length 1.

---

    Code
      needs_character(param = "x", expr = identity(x = 0L), unique = logical(0))
    Condition
      Error in `needs_character()`:
      ! Assertion on 'unique' failed: Must have length 1.

---

    Code
      needs_character(param = "x", expr = identity(x = 0L), unique = NA)
    Condition
      Error in `needs_character()`:
      ! Assertion on 'unique' failed: May not be NA.

---

    Code
      needs_character(param = "x", expr = identity(x = 0L), unique = NULL)
    Condition
      Error in `needs_character()`:
      ! Assertion on 'unique' failed: Must be of type 'logical flag', not 'NULL'.

# `sorted` must be a flag

    Code
      needs_character(param = "x", expr = identity(x = 0L), sorted = 156L)
    Condition
      Error in `needs_character()`:
      ! Assertion on 'sorted' failed: Must be of type 'logical flag', not 'integer'.

---

    Code
      needs_character(param = "x", expr = identity(x = 0L), sorted = "TRUE")
    Condition
      Error in `needs_character()`:
      ! Assertion on 'sorted' failed: Must be of type 'logical flag', not 'character'.

---

    Code
      needs_character(param = "x", expr = identity(x = 0L), sorted = list(
          TRUE))
    Condition
      Error in `needs_character()`:
      ! Assertion on 'sorted' failed: Must be of type 'logical flag', not 'list'.

---

    Code
      needs_character(param = "x", expr = identity(x = 0L), sorted = c(TRUE, 
      FALSE))
    Condition
      Error in `needs_character()`:
      ! Assertion on 'sorted' failed: Must have length 1.

---

    Code
      needs_character(param = "x", expr = identity(x = 0L), sorted = logical(0))
    Condition
      Error in `needs_character()`:
      ! Assertion on 'sorted' failed: Must have length 1.

---

    Code
      needs_character(param = "x", expr = identity(x = 0L), sorted = NA)
    Condition
      Error in `needs_character()`:
      ! Assertion on 'sorted' failed: May not be NA.

---

    Code
      needs_character(param = "x", expr = identity(x = 0L), sorted = NULL)
    Condition
      Error in `needs_character()`:
      ! Assertion on 'sorted' failed: Must be of type 'logical flag', not 'NULL'.

# `typed_missing` must be a flag

    Code
      needs_character(param = "x", expr = identity(x = 0L), typed_missing = 156L)
    Condition
      Error in `needs_character()`:
      ! Assertion on 'typed_missing' failed: Must be of type 'logical flag', not 'integer'.

---

    Code
      needs_character(param = "x", expr = identity(x = 0L), typed_missing = "TRUE")
    Condition
      Error in `needs_character()`:
      ! Assertion on 'typed_missing' failed: Must be of type 'logical flag', not 'character'.

---

    Code
      needs_character(param = "x", expr = identity(x = 0L), typed_missing = list(
          TRUE))
    Condition
      Error in `needs_character()`:
      ! Assertion on 'typed_missing' failed: Must be of type 'logical flag', not 'list'.

---

    Code
      needs_character(param = "x", expr = identity(x = 0L), typed_missing = c(TRUE, 
      FALSE))
    Condition
      Error in `needs_character()`:
      ! Assertion on 'typed_missing' failed: Must have length 1.

---

    Code
      needs_character(param = "x", expr = identity(x = 0L), typed_missing = logical(0))
    Condition
      Error in `needs_character()`:
      ! Assertion on 'typed_missing' failed: Must have length 1.

---

    Code
      needs_character(param = "x", expr = identity(x = 0L), typed_missing = NA)
    Condition
      Error in `needs_character()`:
      ! Assertion on 'typed_missing' failed: May not be NA.

---

    Code
      needs_character(param = "x", expr = identity(x = 0L), typed_missing = NULL)
    Condition
      Error in `needs_character()`:
      ! Assertion on 'typed_missing' failed: Must be of type 'logical flag', not 'NULL'.

# `null_ok` must be a flag

    Code
      needs_character(param = "x", expr = identity(x = 0L), null_ok = 156L)
    Condition
      Error in `needs_character()`:
      ! Assertion on 'null_ok' failed: Must be of type 'logical flag', not 'integer'.

---

    Code
      needs_character(param = "x", expr = identity(x = 0L), null_ok = "TRUE")
    Condition
      Error in `needs_character()`:
      ! Assertion on 'null_ok' failed: Must be of type 'logical flag', not 'character'.

---

    Code
      needs_character(param = "x", expr = identity(x = 0L), null_ok = list(
          TRUE))
    Condition
      Error in `needs_character()`:
      ! Assertion on 'null_ok' failed: Must be of type 'logical flag', not 'list'.

---

    Code
      needs_character(param = "x", expr = identity(x = 0L), null_ok = c(TRUE, 
      FALSE))
    Condition
      Error in `needs_character()`:
      ! Assertion on 'null_ok' failed: Must have length 1.

---

    Code
      needs_character(param = "x", expr = identity(x = 0L), null_ok = logical(0))
    Condition
      Error in `needs_character()`:
      ! Assertion on 'null_ok' failed: Must have length 1.

---

    Code
      needs_character(param = "x", expr = identity(x = 0L), null_ok = NA)
    Condition
      Error in `needs_character()`:
      ! Assertion on 'null_ok' failed: May not be NA.

---

    Code
      needs_character(param = "x", expr = identity(x = 0L), null_ok = NULL)
    Condition
      Error in `needs_character()`:
      ! Assertion on 'null_ok' failed: Must be of type 'logical flag', not 'NULL'.

