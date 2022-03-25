test_that("test fmt_num can format numeric value", {
  expect_equal(
    fmt_num(c(0.1, 0.15, 0.2), digits = 2),
    c("  0.10", "  0.15", "  0.20")
  )
})

test_that("test fmt_est can format mean and sd value", {
  expect_equal(
    fmt_est(0.1, 0.25, digits = c(1, 1)),
    "  0.1 ( 0.2)"
  )
})

test_that("test fmt_ci can format confidence interval", {
  expect_equal(
    fmt_ci(0.1, 0.053, 0.252, digits = 2),
    " 0.10 ( 0.05, 0.25)"
  )
})

test_that("test fmt_pval can format p-value", {
  expect_equal(fmt_pval(1e-5, digits = 3), " <0.001")
  expect_equal(fmt_pval(0.0032, digits = 3), "  0.003")
})
