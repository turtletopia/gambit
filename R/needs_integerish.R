#' @export
needs_integerish <- function(param, expr, ..., lower = -Inf, upper = Inf, any_missing = FALSE, min_len = NULL, max_len = NULL, null_ok = FALSE) {
  ellipsis::check_dots_empty()

  failures <- list(
    TRUE,
    "string",
    list(156L)
  )

  if (!any_missing) {
    failures <- append(failures, list(
      c(156L, NA_integer_)
    ))
  }

  if (!null_ok) {
    failures <- append(failures, list(
      NULL
    ))
  }

  if (lower > -Inf) {
    failures <- append(failures, list(
      -Inf,
      ceiling(lower) - 1L
    ))
  }

  if (upper < Inf) {
    failures <- append(failures, list(
      Inf,
      floor(upper) + 1L
    ))
  }

  if (!is.null(min_len) && min_len > 0L) {
    failures <- append(failures, list(
      seq_len(min_len - 1L)
    ))

    if (min_len > 1L) {
      failures <- append(failures, list(
        integer()
      ))
    }
  }

  if (!is.null(max_len)) {
    failures <- append(failures, list(
      seq_len(min_len + 1L)
    ))
  }

  rlang::inject(
    fails_for(param, !!rlang::enquo(expr), failures)
  )
}
