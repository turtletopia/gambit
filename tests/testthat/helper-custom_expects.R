expect_exists <- function(x, .p) {
  checkmate::expect_count(Position(.p, x, nomatch = NA_integer_))
}
