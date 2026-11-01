# succeeds with a locally defined function

    Code
      test_function(x = 1L)
    Condition
      Error in `test_function()`:
      ! Assertion on 'x' failed: Must be element of set {'one','two','eight'}, but types do not match (integer != character).

---

    Code
      test_function(x = character(0))
    Condition
      Error in `test_function()`:
      ! Assertion on 'x' failed: Must be element of set {'one','two','eight'}, but is not atomic scalar.

---

    Code
      test_function(x = "seven")
    Condition
      Error in `test_function()`:
      ! Assertion on 'x' failed: Must be element of set {'one','two','eight'}, but is 'seven'.

---

    Code
      test_function(x = NULL)
    Condition
      Error in `test_function()`:
      ! Assertion on 'x' failed: Must be a subset of {'one','two','eight'}, not 'NULL'.

# succeeds with an imported function

    Code
      checkmate::test_os(os = 0L)
    Condition
      Error in `match.arg()`:
      ! 'arg' must be NULL or a character vector

---

    Code
      checkmate::test_os(os = character(0))
    Condition
      Error in `match.arg()`:
      ! 'arg' must be of length >= 1

---

    Code
      checkmate::test_os(os = "chromium")
    Condition
      Error in `match.arg()`:
      ! 'arg' should be one of "windows", "mac", "linux", "solaris"

# `param` must be a string

    Code
      fails_for(param = TRUE, expr = identity(x = 0L), failures = list(NULL))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must be of type 'string', not 'logical'.

---

    Code
      fails_for(param = 156L, expr = identity(x = 0L), failures = list(NULL))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must be of type 'string', not 'integer'.

---

    Code
      fails_for(param = list("string"), expr = identity(x = 0L), failures = list(NULL))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must be of type 'string', not 'list'.

---

    Code
      fails_for(param = c("string", "second"), expr = identity(x = 0L), 
          failures = list(NULL))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must have length 1.

---

    Code
      fails_for(param = character(0), expr = identity(x = 0L), failures = list(NULL))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must have length 1.

---

    Code
      fails_for(param = NA_character_, expr = identity(x = 0L), failures = list(NULL))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: May not be NA.

---

    Code
      fails_for(param = NULL, expr = identity(x = 0L), failures = list(NULL))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must be of type 'string', not 'NULL'.

# `param` must be one of tested function parameters

    Code
      fails_for("y", identity(x = 0L), list(NULL))
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must be element of set {'x'}, but is 'y'.

