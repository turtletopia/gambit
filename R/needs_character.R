#' @export
needs_character <- function(param, expr, ..., any_missing = FALSE, min_len = NULL, max_len = NULL, null_ok = FALSE) {
  ellipsis::check_dots_empty()

  failures <- list(
    TRUE,
    156L,
    list("string")
  )

  if (!any_missing) {
    failures <- append(failures, list(
      c("string", NA_character_)
    ))
  }

  if (!null_ok) {
    failures <- append(failures, list(
      NULL
    ))
  }

  if (!is.null(min_len) && min_len > 0L) {
    failures <- append(failures, list(
      sprintf("string%i", seq_len(min_len - 1L)),
      character()
    ))
  }

  if (!is.null(max_len)) {
    failures <- append(failures, list(
      sprintf("string%i", seq_len(max_len + 1L))
    ))
  }

  rlang::inject(
    fails_for(param, !!rlang::enquo(expr), failures)
  )
}
