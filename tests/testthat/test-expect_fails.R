test_that("succeeds when passed failing parameter value", {
  expect_fails(
    rlang::quo(log(x = 5)),
    "x",
    NULL
  )
})
