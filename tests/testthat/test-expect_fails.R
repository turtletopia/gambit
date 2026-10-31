test_that("succeedes when passed failing parameter value", {
  expect_fails(
    rlang::expr(log(x = 5)),
    "x",
    NULL
  )
})
