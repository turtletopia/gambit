assert_bounds <- function(n, lower, upper, .call = rlang::caller_call()) {
  n_vname <- checkmate::vname(n)
  lower_vname <- checkmate::vname(lower)
  upper_vname <- checkmate::vname(upper)

  res <- checkmate::check_count(n, null.ok = TRUE)
  if (!isTRUE(res)) {
    assertion_failed(n_vname, res) |>
      simpleError(call = .call) |>
      stop()
  }

  res <- checkmate::check_count(lower)
  if (!isTRUE(res)) {
    assertion_failed(lower_vname, res) |>
      simpleError(call = .call) |>
      stop()
  }

  if (!identical(upper, Inf)) {
    res <- checkmate::check_int(upper, lower = lower + 1L)
    if (!isTRUE(res)) {
      assertion_failed(upper_vname, res) |>
        simpleError(call = .call) |>
        stop()
    }
  }

  if (!is.null(n) && (lower > 0L || upper < Inf)) {
    msg <- sprintf(
      "Can't supply '%s' if '%s' or '%s' already supplied.",
      n_vname, lower_vname, upper_vname
    )
    stop(simpleError(msg, call = .call))
  }
}

assertion_failed <- function(vname, res) {
  sprintf("Assertion on '%s' failed: %s.", vname, res)
}
