# succeeds with a locally defined function

    Code
      test_function(x = TRUE)
    Condition
      Error in `test_function()`:
      ! Assertion on 'x' failed: Must be of type 'string', not 'logical'.

---

    Code
      test_function(x = 156L)
    Condition
      Error in `test_function()`:
      ! Assertion on 'x' failed: Must be of type 'string', not 'integer'.

---

    Code
      test_function(x = list("string"))
    Condition
      Error in `test_function()`:
      ! Assertion on 'x' failed: Must be of type 'string', not 'list'.

---

    Code
      test_function(x = c("string", "second"))
    Condition
      Error in `test_function()`:
      ! Assertion on 'x' failed: Must have length 1.

---

    Code
      test_function(x = character(0))
    Condition
      Error in `test_function()`:
      ! Assertion on 'x' failed: Must have length 1.

---

    Code
      test_function(x = NA_character_)
    Condition
      Error in `test_function()`:
      ! Assertion on 'x' failed: May not be NA.

---

    Code
      test_function(x = NULL)
    Condition
      Error in `test_function()`:
      ! Assertion on 'x' failed: Must be of type 'string', not 'NULL'.

# succeeds with an imported function

    Code
      checkmate::test_string(x = "test", pattern = TRUE)
    Condition
      Error in `checkCharacterPattern()`:
      ! Assertion on 'pattern' failed. Must be of class 'string', not 'logical'.

---

    Code
      checkmate::test_string(x = "test", pattern = 156L)
    Condition
      Error in `checkCharacterPattern()`:
      ! Assertion on 'pattern' failed. Must be of class 'string', not 'integer'.

---

    Code
      checkmate::test_string(x = "test", pattern = list("string"))
    Condition
      Error in `checkCharacterPattern()`:
      ! Assertion on 'pattern' failed. Must be of class 'string', not 'list'.

---

    Code
      checkmate::test_string(x = "test", pattern = c("string", "second"
      ))
    Condition
      Error in `checkCharacterPattern()`:
      ! Assertion on 'pattern' failed. Must be of length == 1, but has length 2.

---

    Code
      checkmate::test_string(x = "test", pattern = character(0))
    Condition
      Error in `checkCharacterPattern()`:
      ! Assertion on 'pattern' failed. Must be of length == 1, but has length 0.

---

    Code
      checkmate::test_string(x = "test", pattern = NA_character_)
    Condition
      Error in `checkCharacterPattern()`:
      ! Assertion on 'pattern' failed. May not contain missing values, first at position 1.

# `param` must be a string

    Code
      needs_string(param = TRUE, expr = identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must be of type 'string', not 'logical'.

---

    Code
      needs_string(param = 156L, expr = identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must be of type 'string', not 'integer'.

---

    Code
      needs_string(param = list("string"), expr = identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must be of type 'string', not 'list'.

---

    Code
      needs_string(param = c("string", "second"), expr = identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must have length 1.

---

    Code
      needs_string(param = character(0), expr = identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must have length 1.

---

    Code
      needs_string(param = NA_character_, expr = identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: May not be NA.

---

    Code
      needs_string(param = NULL, expr = identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must be of type 'string', not 'NULL'.

# `param` must be one of tested function parameters

    Code
      needs_string("y", identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must be element of set {'x'}, but is 'y'.

# `na_ok` must be a flag

    Code
      needs_string(param = "x", expr = identity(x = 0L), na_ok = 156L)
    Condition
      Error in `needs_string()`:
      ! Assertion on 'na_ok' failed: Must be of type 'logical flag', not 'integer'.

---

    Code
      needs_string(param = "x", expr = identity(x = 0L), na_ok = "TRUE")
    Condition
      Error in `needs_string()`:
      ! Assertion on 'na_ok' failed: Must be of type 'logical flag', not 'character'.

---

    Code
      needs_string(param = "x", expr = identity(x = 0L), na_ok = list(
          TRUE))
    Condition
      Error in `needs_string()`:
      ! Assertion on 'na_ok' failed: Must be of type 'logical flag', not 'list'.

---

    Code
      needs_string(param = "x", expr = identity(x = 0L), na_ok = c(TRUE, 
      FALSE))
    Condition
      Error in `needs_string()`:
      ! Assertion on 'na_ok' failed: Must have length 1.

---

    Code
      needs_string(param = "x", expr = identity(x = 0L), na_ok = logical(0))
    Condition
      Error in `needs_string()`:
      ! Assertion on 'na_ok' failed: Must have length 1.

---

    Code
      needs_string(param = "x", expr = identity(x = 0L), na_ok = NA)
    Condition
      Error in `needs_string()`:
      ! Assertion on 'na_ok' failed: May not be NA.

---

    Code
      needs_string(param = "x", expr = identity(x = 0L), na_ok = NULL)
    Condition
      Error in `needs_string()`:
      ! Assertion on 'na_ok' failed: Must be of type 'logical flag', not 'NULL'.

# `n_chars` can't be supplied with `min_chars` or `max_chars`

    Code
      needs_string("x", identity(x = 0L), n_chars = 4L, min_chars = 3L)
    Condition
      Error in `needs_string()`:
      ! Assertion on '!is.null(n_chars) && (!is.null(min_chars) || !is.null(max_chars))' failed: Must be FALSE.

---

    Code
      needs_string("x", identity(x = 0L), n_chars = 4L, max_chars = 5L)
    Condition
      Error in `needs_string()`:
      ! Assertion on '!is.null(n_chars) && (!is.null(min_chars) || !is.null(max_chars))' failed: Must be FALSE.

# `null_ok` must be a flag

    Code
      needs_string(param = "x", expr = identity(x = 0L), null_ok = 156L)
    Condition
      Error in `needs_string()`:
      ! Assertion on 'null_ok' failed: Must be of type 'logical flag', not 'integer'.

---

    Code
      needs_string(param = "x", expr = identity(x = 0L), null_ok = "TRUE")
    Condition
      Error in `needs_string()`:
      ! Assertion on 'null_ok' failed: Must be of type 'logical flag', not 'character'.

---

    Code
      needs_string(param = "x", expr = identity(x = 0L), null_ok = list(
          TRUE))
    Condition
      Error in `needs_string()`:
      ! Assertion on 'null_ok' failed: Must be of type 'logical flag', not 'list'.

---

    Code
      needs_string(param = "x", expr = identity(x = 0L), null_ok = c(TRUE, 
      FALSE))
    Condition
      Error in `needs_string()`:
      ! Assertion on 'null_ok' failed: Must have length 1.

---

    Code
      needs_string(param = "x", expr = identity(x = 0L), null_ok = logical(0))
    Condition
      Error in `needs_string()`:
      ! Assertion on 'null_ok' failed: Must have length 1.

---

    Code
      needs_string(param = "x", expr = identity(x = 0L), null_ok = NA)
    Condition
      Error in `needs_string()`:
      ! Assertion on 'null_ok' failed: May not be NA.

---

    Code
      needs_string(param = "x", expr = identity(x = 0L), null_ok = NULL)
    Condition
      Error in `needs_string()`:
      ! Assertion on 'null_ok' failed: Must be of type 'logical flag', not 'NULL'.

