# succeeds with a locally defined function

    Code
      test_function(x = structure(list(), class = "aa"))
    Condition
      Error in `test_function()`:
      ! Assertion on 'x' failed: Must inherit from class 'a', but has class 'aa'.

---

    Code
      test_function(x = 1:5)
    Condition
      Error in `test_function()`:
      ! Assertion on 'x' failed: Must inherit from class 'a', but has class 'integer'.

---

    Code
      test_function(x = structure(list(), class = "a"))
    Condition
      Error in `test_function()`:
      ! Assertion on 'x' failed: Must inherit from class 'b', but has class 'a'.

---

    Code
      test_function(x = structure(list(), class = "b"))
    Condition
      Error in `test_function()`:
      ! Assertion on 'x' failed: Must inherit from class 'a', but has class 'b'.

---

    Code
      test_function(x = NULL)
    Condition
      Error in `test_function()`:
      ! Assertion on 'x' failed: Must inherit from class 'a', but has class 'NULL'.

# `param` must be a string

    Code
      needs_class(param = TRUE, expr = identity(x = 0L), classes = "test")
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must be of type 'string', not 'logical'.

---

    Code
      needs_class(param = 156L, expr = identity(x = 0L), classes = "test")
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must be of type 'string', not 'integer'.

---

    Code
      needs_class(param = list("string"), expr = identity(x = 0L), 
          classes = "test")
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must be of type 'string', not 'list'.

---

    Code
      needs_class(param = c("string", "second"), expr = identity(x = 0L), 
          classes = "test")
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must have length 1.

---

    Code
      needs_class(param = character(0), expr = identity(x = 0L), classes = "test")
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must have length 1.

---

    Code
      needs_class(param = NA_character_, expr = identity(x = 0L), classes = "test")
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: May not be NA.

---

    Code
      needs_class(param = NULL, expr = identity(x = 0L), classes = "test")
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must be of type 'string', not 'NULL'.

# `param` must be one of tested function parameters

    Code
      needs_class("y", identity(x = 0L), classes = "test")
    Condition
      Error in `fails_for()`:
      ! Assertion on 'param' failed: Must be element of set {'x'}, but is 'y'.

# `classes` must be a character vector of unique, non-missing values

    Code
      needs_class(param = "x", expr = identity(x = 0L), classes = TRUE)
    Condition
      Error in `needs_class()`:
      ! Assertion on 'classes' failed: Must be of type 'character', not 'logical'.

---

    Code
      needs_class(param = "x", expr = identity(x = 0L), classes = 156L)
    Condition
      Error in `needs_class()`:
      ! Assertion on 'classes' failed: Must be of type 'character', not 'integer'.

---

    Code
      needs_class(param = "x", expr = identity(x = 0L), classes = list(
          "string"))
    Condition
      Error in `needs_class()`:
      ! Assertion on 'classes' failed: Must be of type 'character', not 'list'.

---

    Code
      needs_class(param = "x", expr = identity(x = 0L), classes = c("string", 
      NA))
    Condition
      Error in `needs_class()`:
      ! Assertion on 'classes' failed: Contains missing values (element 2).

---

    Code
      needs_class(param = "x", expr = identity(x = 0L), classes = character(0))
    Condition
      Error in `needs_class()`:
      ! Assertion on 'classes' failed: Must have length >= 1, but has length 0.

---

    Code
      needs_class(param = "x", expr = identity(x = 0L), classes = character(0))
    Condition
      Error in `needs_class()`:
      ! Assertion on 'classes' failed: Must have length >= 1, but has length 0.

---

    Code
      needs_class(param = "x", expr = identity(x = 0L), classes = c("one", 
      "two", "one"))
    Condition
      Error in `needs_class()`:
      ! Assertion on 'classes' failed: Contains duplicated values, position 3.

---

    Code
      needs_class(param = "x", expr = identity(x = 0L), classes = NA_integer_)
    Condition
      Error in `needs_class()`:
      ! Assertion on 'classes' failed: Must be of type 'character', not 'integer'.

---

    Code
      needs_class(param = "x", expr = identity(x = 0L), classes = NULL)
    Condition
      Error in `needs_class()`:
      ! Assertion on 'classes' failed: Must be of type 'character', not 'NULL'.

# `ordered` must be a flag

    Code
      needs_class(param = "x", expr = identity(x = 0L), classes = "test", 
          ordered = 156L)
    Condition
      Error in `needs_class()`:
      ! Assertion on 'ordered' failed: Must be of type 'logical flag', not 'integer'.

---

    Code
      needs_class(param = "x", expr = identity(x = 0L), classes = "test", 
          ordered = "TRUE")
    Condition
      Error in `needs_class()`:
      ! Assertion on 'ordered' failed: Must be of type 'logical flag', not 'character'.

---

    Code
      needs_class(param = "x", expr = identity(x = 0L), classes = "test", 
          ordered = list(TRUE))
    Condition
      Error in `needs_class()`:
      ! Assertion on 'ordered' failed: Must be of type 'logical flag', not 'list'.

---

    Code
      needs_class(param = "x", expr = identity(x = 0L), classes = "test", 
          ordered = c(TRUE, FALSE))
    Condition
      Error in `needs_class()`:
      ! Assertion on 'ordered' failed: Must have length 1.

---

    Code
      needs_class(param = "x", expr = identity(x = 0L), classes = "test", 
          ordered = logical(0))
    Condition
      Error in `needs_class()`:
      ! Assertion on 'ordered' failed: Must have length 1.

---

    Code
      needs_class(param = "x", expr = identity(x = 0L), classes = "test", 
          ordered = NA)
    Condition
      Error in `needs_class()`:
      ! Assertion on 'ordered' failed: May not be NA.

---

    Code
      needs_class(param = "x", expr = identity(x = 0L), classes = "test", 
          ordered = NULL)
    Condition
      Error in `needs_class()`:
      ! Assertion on 'ordered' failed: Must be of type 'logical flag', not 'NULL'.

# `null_ok` must be a flag

    Code
      needs_class(param = "x", expr = identity(x = 0L), classes = "test", 
          null_ok = 156L)
    Condition
      Error in `needs_class()`:
      ! Assertion on 'null_ok' failed: Must be of type 'logical flag', not 'integer'.

---

    Code
      needs_class(param = "x", expr = identity(x = 0L), classes = "test", 
          null_ok = "TRUE")
    Condition
      Error in `needs_class()`:
      ! Assertion on 'null_ok' failed: Must be of type 'logical flag', not 'character'.

---

    Code
      needs_class(param = "x", expr = identity(x = 0L), classes = "test", 
          null_ok = list(TRUE))
    Condition
      Error in `needs_class()`:
      ! Assertion on 'null_ok' failed: Must be of type 'logical flag', not 'list'.

---

    Code
      needs_class(param = "x", expr = identity(x = 0L), classes = "test", 
          null_ok = c(TRUE, FALSE))
    Condition
      Error in `needs_class()`:
      ! Assertion on 'null_ok' failed: Must have length 1.

---

    Code
      needs_class(param = "x", expr = identity(x = 0L), classes = "test", 
          null_ok = logical(0))
    Condition
      Error in `needs_class()`:
      ! Assertion on 'null_ok' failed: Must have length 1.

---

    Code
      needs_class(param = "x", expr = identity(x = 0L), classes = "test", 
          null_ok = NA)
    Condition
      Error in `needs_class()`:
      ! Assertion on 'null_ok' failed: May not be NA.

---

    Code
      needs_class(param = "x", expr = identity(x = 0L), classes = "test", 
          null_ok = NULL)
    Condition
      Error in `needs_class()`:
      ! Assertion on 'null_ok' failed: Must be of type 'logical flag', not 'NULL'.

