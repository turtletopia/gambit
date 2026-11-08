# succeeds with a locally defined function

    Code
      test_function(x = 156L)
    Condition
      Error in `test_function()`:
      ! Assertion on 'x' failed: Must be of type 'logical flag', not 'integer'.

---

    Code
      test_function(x = "TRUE")
    Condition
      Error in `test_function()`:
      ! Assertion on 'x' failed: Must be of type 'logical flag', not 'character'.

---

    Code
      test_function(x = list(TRUE))
    Condition
      Error in `test_function()`:
      ! Assertion on 'x' failed: Must be of type 'logical flag', not 'list'.

---

    Code
      test_function(x = c(TRUE, FALSE))
    Condition
      Error in `test_function()`:
      ! Assertion on 'x' failed: Must have length 1.

---

    Code
      test_function(x = logical(0))
    Condition
      Error in `test_function()`:
      ! Assertion on 'x' failed: Must have length 1.

---

    Code
      test_function(x = NA)
    Condition
      Error in `test_function()`:
      ! Assertion on 'x' failed: May not be NA.

---

    Code
      test_function(x = NULL)
    Condition
      Error in `test_function()`:
      ! Assertion on 'x' failed: Must be of type 'logical flag', not 'NULL'.

# succeeds with an imported function

    Code
      checkmate::test_integer(x = 5L, any.missing = 156L)
    Condition
      Error in `isTRUE()`:
      ! Argument 'any.missing' must be a flag, but is integer

---

    Code
      checkmate::test_integer(x = 5L, any.missing = "TRUE")
    Condition
      Error in `isTRUE()`:
      ! Argument 'any.missing' must be a flag, but is character

---

    Code
      checkmate::test_integer(x = 5L, any.missing = list(TRUE))
    Condition
      Error in `isTRUE()`:
      ! Argument 'any.missing' must be a flag, but is list

---

    Code
      checkmate::test_integer(x = 5L, any.missing = c(TRUE, FALSE))
    Condition
      Error in `isTRUE()`:
      ! Argument 'any.missing' must be a flag, but is logical

---

    Code
      checkmate::test_integer(x = 5L, any.missing = logical(0))
    Condition
      Error in `isTRUE()`:
      ! Argument 'any.missing' must be a flag, but is logical

---

    Code
      checkmate::test_integer(x = 5L, any.missing = NA)
    Condition
      Error in `isTRUE()`:
      ! Argument 'any.missing' may not be missing

---

    Code
      checkmate::test_integer(x = 5L, any.missing = NULL)
    Condition
      Error in `isTRUE()`:
      ! Argument 'any.missing' must be a flag, but is NULL

# `param` must be a string

    Code
      needs_flag(param = TRUE, expr = identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must be of type 'string', not 'logical'.

---

    Code
      needs_flag(param = 156L, expr = identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must be of type 'string', not 'integer'.

---

    Code
      needs_flag(param = list("string"), expr = identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must be of type 'string', not 'list'.

---

    Code
      needs_flag(param = c("string", "second"), expr = identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must have length 1.

---

    Code
      needs_flag(param = character(0), expr = identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must have length 1.

---

    Code
      needs_flag(param = NA_character_, expr = identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: May not be NA.

---

    Code
      needs_flag(param = NULL, expr = identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must be of type 'string', not 'NULL'.

# `param` must be one of tested function parameters

    Code
      needs_flag("y", identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must be element of set {'x'}, but is 'y'.

# `na_ok` must be a flag

    Code
      needs_flag(param = "x", expr = identity(x = 0L), na_ok = 156L)
    Condition
      Error in `needs_flag()`:
      ! Assertion on 'na_ok' failed: Must be of type 'logical flag', not 'integer'.

---

    Code
      needs_flag(param = "x", expr = identity(x = 0L), na_ok = "TRUE")
    Condition
      Error in `needs_flag()`:
      ! Assertion on 'na_ok' failed: Must be of type 'logical flag', not 'character'.

---

    Code
      needs_flag(param = "x", expr = identity(x = 0L), na_ok = list(
          TRUE))
    Condition
      Error in `needs_flag()`:
      ! Assertion on 'na_ok' failed: Must be of type 'logical flag', not 'list'.

---

    Code
      needs_flag(param = "x", expr = identity(x = 0L), na_ok = c(TRUE, 
      FALSE))
    Condition
      Error in `needs_flag()`:
      ! Assertion on 'na_ok' failed: Must have length 1.

---

    Code
      needs_flag(param = "x", expr = identity(x = 0L), na_ok = logical(0))
    Condition
      Error in `needs_flag()`:
      ! Assertion on 'na_ok' failed: Must have length 1.

---

    Code
      needs_flag(param = "x", expr = identity(x = 0L), na_ok = NA)
    Condition
      Error in `needs_flag()`:
      ! Assertion on 'na_ok' failed: May not be NA.

---

    Code
      needs_flag(param = "x", expr = identity(x = 0L), na_ok = NULL)
    Condition
      Error in `needs_flag()`:
      ! Assertion on 'na_ok' failed: Must be of type 'logical flag', not 'NULL'.

# `null_ok` must be a flag

    Code
      needs_flag(param = "x", expr = identity(x = 0L), null_ok = 156L)
    Condition
      Error in `needs_flag()`:
      ! Assertion on 'null_ok' failed: Must be of type 'logical flag', not 'integer'.

---

    Code
      needs_flag(param = "x", expr = identity(x = 0L), null_ok = "TRUE")
    Condition
      Error in `needs_flag()`:
      ! Assertion on 'null_ok' failed: Must be of type 'logical flag', not 'character'.

---

    Code
      needs_flag(param = "x", expr = identity(x = 0L), null_ok = list(
          TRUE))
    Condition
      Error in `needs_flag()`:
      ! Assertion on 'null_ok' failed: Must be of type 'logical flag', not 'list'.

---

    Code
      needs_flag(param = "x", expr = identity(x = 0L), null_ok = c(TRUE, 
      FALSE))
    Condition
      Error in `needs_flag()`:
      ! Assertion on 'null_ok' failed: Must have length 1.

---

    Code
      needs_flag(param = "x", expr = identity(x = 0L), null_ok = logical(0))
    Condition
      Error in `needs_flag()`:
      ! Assertion on 'null_ok' failed: Must have length 1.

---

    Code
      needs_flag(param = "x", expr = identity(x = 0L), null_ok = NA)
    Condition
      Error in `needs_flag()`:
      ! Assertion on 'null_ok' failed: May not be NA.

---

    Code
      needs_flag(param = "x", expr = identity(x = 0L), null_ok = NULL)
    Condition
      Error in `needs_flag()`:
      ! Assertion on 'null_ok' failed: Must be of type 'logical flag', not 'NULL'.

