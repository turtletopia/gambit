# succeeds with a locally defined function

    Code
      test_function(x = TRUE)
    Condition
      Error in `test_function()`:
      ! Assertion on 'x' failed: Must be of type 'count', not 'logical'.

---

    Code
      test_function(x = "156")
    Condition
      Error in `test_function()`:
      ! Assertion on 'x' failed: Must be of type 'count', not 'character'.

---

    Code
      test_function(x = list(156L))
    Condition
      Error in `test_function()`:
      ! Assertion on 'x' failed: Must be of type 'count', not 'list'.

---

    Code
      test_function(x = 156.5)
    Condition
      Error in `test_function()`:
      ! Assertion on 'x' failed: Must be of type 'count', not 'double'.

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
      test_function(x = -4L)
    Condition
      Error in `test_function()`:
      ! Assertion on 'x' failed: Must be >= 0.

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
      ! Assertion on 'x' failed: Must be of type 'count', not 'NULL'.

# `param` must be a string

    Code
      needs_count(param = TRUE, expr = identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must be of type 'string', not 'logical'.

---

    Code
      needs_count(param = 156L, expr = identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must be of type 'string', not 'integer'.

---

    Code
      needs_count(param = list("string"), expr = identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must be of type 'string', not 'list'.

---

    Code
      needs_count(param = c("string", "second"), expr = identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must have length 1.

---

    Code
      needs_count(param = character(0), expr = identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must have length 1.

---

    Code
      needs_count(param = NA_character_, expr = identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: May not be NA.

---

    Code
      needs_count(param = NULL, expr = identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must be of type 'string', not 'NULL'.

# `param` must be one of tested function parameters

    Code
      needs_count("y", identity(x = 0L))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must be element of set {'x'}, but is 'y'.

# `na_ok` must be a flag

    Code
      needs_count(param = "x", expr = identity(x = 0L), na_ok = 156L)
    Condition
      Error in `needs_count()`:
      ! Assertion on 'na_ok' failed: Must be of type 'logical flag', not 'integer'.

---

    Code
      needs_count(param = "x", expr = identity(x = 0L), na_ok = "TRUE")
    Condition
      Error in `needs_count()`:
      ! Assertion on 'na_ok' failed: Must be of type 'logical flag', not 'character'.

---

    Code
      needs_count(param = "x", expr = identity(x = 0L), na_ok = list(
          TRUE))
    Condition
      Error in `needs_count()`:
      ! Assertion on 'na_ok' failed: Must be of type 'logical flag', not 'list'.

---

    Code
      needs_count(param = "x", expr = identity(x = 0L), na_ok = c(TRUE, 
      FALSE))
    Condition
      Error in `needs_count()`:
      ! Assertion on 'na_ok' failed: Must have length 1.

---

    Code
      needs_count(param = "x", expr = identity(x = 0L), na_ok = logical(0))
    Condition
      Error in `needs_count()`:
      ! Assertion on 'na_ok' failed: Must have length 1.

---

    Code
      needs_count(param = "x", expr = identity(x = 0L), na_ok = NA)
    Condition
      Error in `needs_count()`:
      ! Assertion on 'na_ok' failed: May not be NA.

---

    Code
      needs_count(param = "x", expr = identity(x = 0L), na_ok = NULL)
    Condition
      Error in `needs_count()`:
      ! Assertion on 'na_ok' failed: Must be of type 'logical flag', not 'NULL'.

# `positive` must be a flag

    Code
      needs_count(param = "x", expr = identity(x = 0L), positive = 156L)
    Condition
      Error in `needs_count()`:
      ! Assertion on 'positive' failed: Must be of type 'logical flag', not 'integer'.

---

    Code
      needs_count(param = "x", expr = identity(x = 0L), positive = "TRUE")
    Condition
      Error in `needs_count()`:
      ! Assertion on 'positive' failed: Must be of type 'logical flag', not 'character'.

---

    Code
      needs_count(param = "x", expr = identity(x = 0L), positive = list(
          TRUE))
    Condition
      Error in `needs_count()`:
      ! Assertion on 'positive' failed: Must be of type 'logical flag', not 'list'.

---

    Code
      needs_count(param = "x", expr = identity(x = 0L), positive = c(TRUE, 
      FALSE))
    Condition
      Error in `needs_count()`:
      ! Assertion on 'positive' failed: Must have length 1.

---

    Code
      needs_count(param = "x", expr = identity(x = 0L), positive = logical(0))
    Condition
      Error in `needs_count()`:
      ! Assertion on 'positive' failed: Must have length 1.

---

    Code
      needs_count(param = "x", expr = identity(x = 0L), positive = NA)
    Condition
      Error in `needs_count()`:
      ! Assertion on 'positive' failed: May not be NA.

---

    Code
      needs_count(param = "x", expr = identity(x = 0L), positive = NULL)
    Condition
      Error in `needs_count()`:
      ! Assertion on 'positive' failed: Must be of type 'logical flag', not 'NULL'.

# `null_ok` must be a flag

    Code
      needs_count(param = "x", expr = identity(x = 0L), null_ok = 156L)
    Condition
      Error in `needs_count()`:
      ! Assertion on 'null_ok' failed: Must be of type 'logical flag', not 'integer'.

---

    Code
      needs_count(param = "x", expr = identity(x = 0L), null_ok = "TRUE")
    Condition
      Error in `needs_count()`:
      ! Assertion on 'null_ok' failed: Must be of type 'logical flag', not 'character'.

---

    Code
      needs_count(param = "x", expr = identity(x = 0L), null_ok = list(
          TRUE))
    Condition
      Error in `needs_count()`:
      ! Assertion on 'null_ok' failed: Must be of type 'logical flag', not 'list'.

---

    Code
      needs_count(param = "x", expr = identity(x = 0L), null_ok = c(TRUE, 
      FALSE))
    Condition
      Error in `needs_count()`:
      ! Assertion on 'null_ok' failed: Must have length 1.

---

    Code
      needs_count(param = "x", expr = identity(x = 0L), null_ok = logical(0))
    Condition
      Error in `needs_count()`:
      ! Assertion on 'null_ok' failed: Must have length 1.

---

    Code
      needs_count(param = "x", expr = identity(x = 0L), null_ok = NA)
    Condition
      Error in `needs_count()`:
      ! Assertion on 'null_ok' failed: May not be NA.

---

    Code
      needs_count(param = "x", expr = identity(x = 0L), null_ok = NULL)
    Condition
      Error in `needs_count()`:
      ! Assertion on 'null_ok' failed: Must be of type 'logical flag', not 'NULL'.

