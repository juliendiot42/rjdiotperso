

file <- "data/exampleCode.R"
dir <- "data"

test_that(".findPackages return character vector", {
    expect_is(.findPackages(file), "character")
})

test_that(".findPackages works for library of require", {
    expect_equal(.findPackages(file),
                 c("plotly",
                   "rmarkdown",
                   "testthat",
                   "shiny",
                   "plumber",
                   "devtools"))
})


test_that("packages2Install works for library of require", {
    expect_output(
        packages2Install(dir),
        "install\\.packages\\(c\\(\"devtools\", \"plotly\", \"plumber\", \"rmarkdown\", \"shiny\", \"testthat\"\\)\\)"
    )
})






