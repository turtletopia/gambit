#' Test a parameter that needs class membership
#'
#' @description
#' Runs a series of expectations with incorrect parameter values expecting errors. The values are selected to cover
#' all different manners of incorrect input.
#'
#' @inherit fails_for details return
#'
#' @inheritParams needs_scalar
#' @param classes `character()`\cr
#'  Class names the parameter value must inherit from. Must specify at least one. Can't be missing or duplicated.
#' @param ordered `logical(1)`\cr
#'  Whether the classes must appear in the specified order.
#'
#' @seealso [checkmate::assert_class()] for \pkg{checkmate} counterpart.
#'
#' @export
needs_class <- function(param, expr, ..., classes, ordered = FALSE, null_ok = FALSE) {
  ellipsis::check_dots_empty()

  checkmate::assert_character(classes, any.missing = FALSE, min.len = 1L, unique = TRUE, typed.missing = TRUE)
  checkmate::assert_flag(ordered)
  checkmate::assert_flag(null_ok)

  failures <- list(
    stub(not_in(classes))
  )

  if (!"integer" %in% classes) {
    failures <- append(failures, list(
      1:5
    ))
  }

  if (length(classes) >= 2L) {
    failures <- append(failures, list(
      stub(classes[1]),
      stub(classes[-1])
    ))
  }

  if (ordered && length(classes) >= 2L) {
    failures <- append(failures, list(
      stub(rev(classes))
    ))
  }

  if (!null_ok) {
    failures <- append(failures, list(
      NULL
    ))
  }

  rlang::inject(
    fails_for(param, !!rlang::enquo(expr), failures)
  )
}
