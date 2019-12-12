

file1 <- "data/exampleCode.R"
file2 <- "data/exampleCodeMD.Rmd"
dir <- "data"

test_that(".findPackages return character vector", {
    expect_is(.findPackages(file1), "character")
    expect_is(.findPackages(file2), "character")
})

test_that(".findPackages works for library and require", {
    expect_equal(.findPackages(file1),
                 c("plotly",
                   "rmarkdown",
                   "testthat",
                   "shiny",
                   "plumber",
                   "devtools"))
    expect_equal(.findPackages(file2),
                 c("MASS",
                   "broom",
                   "devtools",
                   "forcats",
                   "httr",
                   "lme4"))
})


test_that("packages2Install works for library and require", {
    expect_output(
        packages2Install(dir),
        "install\\.packages\\(c\\(\"broom\", \"devtools\", \"forcats\", \"httr\", \"lme4\", \"MASS\", \"plotly\", \"plumber\", \"rmarkdown\", \"shiny\", \"testthat\"\\)\\)"
    )
})






