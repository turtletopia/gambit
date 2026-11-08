# succeeds with a locally defined function

    Code
      test_function(x = TRUE)
    Condition
      Error in `test_function()`:
      ! Assertion on 'x' failed: Must be of type 'single integerish value', not 'logical'.

---

    Code
      test_function(x = "156")
    Condition
      Error in `test_function()`:
      ! Assertion on 'x' failed: Must be of type 'single integerish value', not 'character'.

---

    Code
      test_function(x = list(156L))
    Condition
      Error in `test_function()`:
      ! Assertion on 'x' failed: Must be of type 'single integerish value', not 'list'.

---

    Code
      test_function(x = 156.5)
    Condition
      Error in `test_function()`:
      ! Assertion on 'x' failed: Must be of type 'single integerish value', not 'double'.

---

    Code
      test_function(x = 156:157)
    Condition
      Error in `test_function()`:
      ! Assertion on 'x' failed: Must have length 1.

---

    Code
      test_function(x = integer(0))
    Condition
      Error in `test_function()`:
      ! Assertion on 'x' failed: Must have length 1.

---

    Code
      test_function(x = NA_integer_)
    Condition
      Error in `test_function()`:
      ! Assertion on 'x' failed: May not be NA.

---

    Code
      test_function(x = NULL)
    Condition
      Error in `test_function()`:
      ! Assertion on 'x' failed: Must be of type 'single integerish value', not 'NULL'.

# succeeds with an imported function

    Code
      checkmate::test_string(x = "test", min.chars = TRUE)
    Condition
      Error in `isTRUE()`:
      ! Argument 'min.chars' must be numeric and close to an integer

---

    Code
      checkmate::test_string(x = "test", min.chars = "156")
    Condition
      Error in `isTRUE()`:
      ! Argument 'min.chars' must be numeric and close to an integer

---

    Code
      checkmate::test_string(x = "test", min.chars = list(156L))
    Condition
      Error in `isTRUE()`:
      ! Argument 'min.chars' must be numeric and close to an integer

---

    Code
      checkmate::test_string(x = "test", min.chars = 156.5)
    Condition
      Error in `isTRUE()`:
      ! Argument 'min.chars' must be numeric and close to an integer

---

    Code
      checkmate::test_string(x = "test", min.chars = 156:157)
    Condition
      Error in `isTRUE()`:
      ! Argument 'min.chars' must have length 1

---

    Code
      checkmate::test_string(x = "test", min.chars = integer(0))
    Condition
      Error in `isTRUE()`:
      ! Argument 'min.chars' must have length 1

---

    Code
      checkmate::test_string(x = "test", min.chars = NA_integer_)
    Condition
      Error in `isTRUE()`:
      ! Argument 'min.chars' may not be missing

# `param` must be a string

    Code
      needs_int(param = TRUE, expr = identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must be of type 'string', not 'logical'.

---

    Code
      needs_int(param = 156L, expr = identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must be of type 'string', not 'integer'.

---

    Code
      needs_int(param = list("string"), expr = identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must be of type 'string', not 'list'.

---

    Code
      needs_int(param = c("string", "second"), expr = identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must have length 1.

---

    Code
      needs_int(param = character(0), expr = identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must have length 1.

---

    Code
      needs_int(param = NA_character_, expr = identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: May not be NA.

---

    Code
      needs_int(param = NULL, expr = identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must be of type 'string', not 'NULL'.

# `param` must be one of tested function parameters

    Code
      needs_int("y", identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must be element of set {'x'}, but is 'y'.

# `na_ok` must be a flag

    Code
      needs_int(param = "x", expr = identity(x = 0L), na_ok = 156L)
    Condition
      Error in `needs_int()`:
      ! Assertion on 'na_ok' failed: Must be of type 'logical flag', not 'integer'.

---

    Code
      needs_int(param = "x", expr = identity(x = 0L), na_ok = "TRUE")
    Condition
      Error in `needs_int()`:
      ! Assertion on 'na_ok' failed: Must be of type 'logical flag', not 'character'.

---

    Code
      needs_int(param = "x", expr = identity(x = 0L), na_ok = list(
          TRUE))
    Condition
      Error in `needs_int()`:
      ! Assertion on 'na_ok' failed: Must be of type 'logical flag', not 'list'.

---

    Code
      needs_int(param = "x", expr = identity(x = 0L), na_ok = c(TRUE, 
      FALSE))
    Condition
      Error in `needs_int()`:
      ! Assertion on 'na_ok' failed: Must have length 1.

---

    Code
      needs_int(param = "x", expr = identity(x = 0L), na_ok = logical(0))
    Condition
      Error in `needs_int()`:
      ! Assertion on 'na_ok' failed: Must have length 1.

---

    Code
      needs_int(param = "x", expr = identity(x = 0L), na_ok = NA)
    Condition
      Error in `needs_int()`:
      ! Assertion on 'na_ok' failed: May not be NA.

---

    Code
      needs_int(param = "x", expr = identity(x = 0L), na_ok = NULL)
    Condition
      Error in `needs_int()`:
      ! Assertion on 'na_ok' failed: Must be of type 'logical flag', not 'NULL'.

# `upper` must not be less than `lower`

    Code
      needs_int("x", identity(x = 0L), lower = 5L, upper = 3L)
    Condition
      Error in `needs_int()`:
      ! Assertion on 'upper' failed: Element 1 is not >= 5.

# `null_ok` must be a flag

    Code
      needs_int(param = "x", expr = identity(x = 0L), null_ok = 156L)
    Condition
      Error in `needs_int()`:
      ! Assertion on 'null_ok' failed: Must be of type 'logical flag', not 'integer'.

---

    Code
      needs_int(param = "x", expr = identity(x = 0L), null_ok = "TRUE")
    Condition
      Error in `needs_int()`:
      ! Assertion on 'null_ok' failed: Must be of type 'logical flag', not 'character'.

---

    Code
      needs_int(param = "x", expr = identity(x = 0L), null_ok = list(
          TRUE))
    Condition
      Error in `needs_int()`:
      ! Assertion on 'null_ok' failed: Must be of type 'logical flag', not 'list'.

---

    Code
      needs_int(param = "x", expr = identity(x = 0L), null_ok = c(TRUE, 
      FALSE))
    Condition
      Error in `needs_int()`:
      ! Assertion on 'null_ok' failed: Must have length 1.

---

    Code
      needs_int(param = "x", expr = identity(x = 0L), null_ok = logical(0))
    Condition
      Error in `needs_int()`:
      ! Assertion on 'null_ok' failed: Must have length 1.

---

    Code
      needs_int(param = "x", expr = identity(x = 0L), null_ok = NA)
    Condition
      Error in `needs_int()`:
      ! Assertion on 'null_ok' failed: May not be NA.

---

    Code
      needs_int(param = "x", expr = identity(x = 0L), null_ok = NULL)
    Condition
      Error in `needs_int()`:
      ! Assertion on 'null_ok' failed: Must be of type 'logical flag', not 'NULL'.

