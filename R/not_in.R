not_in <- function(choices) {
  UseMethod("not_in")
}

#' @export
not_in.character <- function(choices) {
  if (!checkmate::test_character(choices, min.len = 1L, all.missing = FALSE)) {
    return("a")
  }

  max_n_chars <- max(nchar(choices), na.rm = TRUE)
  paste0(
    rep("a", times = max_n_chars + 1L),
    collapse = ""
  )
}
