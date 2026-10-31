# succeeds with a correct call

    Code
      test_function(x = list(1L))
    Condition
      Error in `test_function()`:
      ! Assertion on 'x' failed: Must be of type 'atomic scalar', not 'list'.

---

    Code
      test_function(x = c(TRUE, FALSE))
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
      test_function(x = NA)
    Condition
      Error in `test_function()`:
      ! Assertion on 'x' failed: May not be NA.

---

    Code
      test_function(x = NULL)
    Condition
      Error in `test_function()`:
      ! Assertion on 'x' failed: Must be of type 'atomic scalar', not 'NULL'.

---

    Code
      checkmate::test_string(x = "test", n.chars = list(1L))
    Condition
      Error in `isTRUE()`:
      ! Argument 'n.chars' must be numeric and close to an integer

---

    Code
      checkmate::test_string(x = "test", n.chars = c(TRUE, FALSE))
    Condition
      Error in `isTRUE()`:
      ! Argument 'n.chars' must have length 1

---

    Code
      checkmate::test_string(x = "test", n.chars = character(0))
    Condition
      Error in `isTRUE()`:
      ! Argument 'n.chars' must have length 1

---

    Code
      checkmate::test_string(x = "test", n.chars = NA)
    Condition
      Error in `isTRUE()`:
      ! Argument 'n.chars' may not be missing

# `param` must be a string

    Code
      needs_scalar(param = TRUE, expr = identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must be of type 'string', not 'logical'.

---

    Code
      needs_scalar(param = 156L, expr = identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must be of type 'string', not 'integer'.

---

    Code
      needs_scalar(param = list("string"), expr = identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must be of type 'string', not 'list'.

---

    Code
      needs_scalar(param = c("string", "second"), expr = identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must have length 1.

---

    Code
      needs_scalar(param = character(0), expr = identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must have length 1.

---

    Code
      needs_scalar(param = NA_character_, expr = identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: May not be NA.

---

    Code
      needs_scalar(param = NULL, expr = identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must be of type 'string', not 'NULL'.

# `param` must be one of tested function parameters

    Code
      needs_scalar("y", identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must be element of set {'x'}, but is 'y'.

# `na_ok` must be a flag

    Code
      needs_scalar(param = "x", expr = identity(x = 0L), na_ok = 156L)
    Condition
      Error in `needs_scalar()`:
      ! Assertion on 'na_ok' failed: Must be of type 'logical flag', not 'integer'.

---

    Code
      needs_scalar(param = "x", expr = identity(x = 0L), na_ok = "TRUE")
    Condition
      Error in `needs_scalar()`:
      ! Assertion on 'na_ok' failed: Must be of type 'logical flag', not 'character'.

---

    Code
      needs_scalar(param = "x", expr = identity(x = 0L), na_ok = list(
          "TRUE"))
    Condition
      Error in `needs_scalar()`:
      ! Assertion on 'na_ok' failed: Must be of type 'logical flag', not 'list'.

---

    Code
      needs_scalar(param = "x", expr = identity(x = 0L), na_ok = c(TRUE, 
      FALSE))
    Condition
      Error in `needs_scalar()`:
      ! Assertion on 'na_ok' failed: Must have length 1.

---

    Code
      needs_scalar(param = "x", expr = identity(x = 0L), na_ok = logical(0))
    Condition
      Error in `needs_scalar()`:
      ! Assertion on 'na_ok' failed: Must have length 1.

---

    Code
      needs_scalar(param = "x", expr = identity(x = 0L), na_ok = NA)
    Condition
      Error in `needs_scalar()`:
      ! Assertion on 'na_ok' failed: May not be NA.

---

    Code
      needs_scalar(param = "x", expr = identity(x = 0L), na_ok = NULL)
    Condition
      Error in `needs_scalar()`:
      ! Assertion on 'na_ok' failed: Must be of type 'logical flag', not 'NULL'.

# `null_ok` must be a flag

    Code
      needs_scalar(param = "x", expr = identity(x = 0L), null_ok = 156L)
    Condition
      Error in `needs_scalar()`:
      ! Assertion on 'null_ok' failed: Must be of type 'logical flag', not 'integer'.

---

    Code
      needs_scalar(param = "x", expr = identity(x = 0L), null_ok = "TRUE")
    Condition
      Error in `needs_scalar()`:
      ! Assertion on 'null_ok' failed: Must be of type 'logical flag', not 'character'.

---

    Code
      needs_scalar(param = "x", expr = identity(x = 0L), null_ok = list(
          "TRUE"))
    Condition
      Error in `needs_scalar()`:
      ! Assertion on 'null_ok' failed: Must be of type 'logical flag', not 'list'.

---

    Code
      needs_scalar(param = "x", expr = identity(x = 0L), null_ok = c(TRUE, 
      FALSE))
    Condition
      Error in `needs_scalar()`:
      ! Assertion on 'null_ok' failed: Must have length 1.

---

    Code
      needs_scalar(param = "x", expr = identity(x = 0L), null_ok = logical(0))
    Condition
      Error in `needs_scalar()`:
      ! Assertion on 'null_ok' failed: Must have length 1.

---

    Code
      needs_scalar(param = "x", expr = identity(x = 0L), null_ok = NA)
    Condition
      Error in `needs_scalar()`:
      ! Assertion on 'null_ok' failed: May not be NA.

---

    Code
      needs_scalar(param = "x", expr = identity(x = 0L), null_ok = NULL)
    Condition
      Error in `needs_scalar()`:
      ! Assertion on 'null_ok' failed: Must be of type 'logical flag', not 'NULL'.

