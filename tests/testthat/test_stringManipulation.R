test_that("charSeq", {
    expect_equal(
        charSeq("toto", 1, 10),
        c("toto01",
          "toto02",
          "toto03",
          "toto04",
          "toto05",
          "toto06",
          "toto07",
          "toto08",
          "toto09",
          "toto10")
    )
    expect_equal(
        charSeq("toto", 1, 10, 2),
        c("toto1",
          "toto3",
          "toto5",
          "toto7",
          "toto9")
    )

    expect_equal(
        charSeq("toto", 102, 98, -1),
        c("toto102",
          "toto101",
          "toto100",
          "toto099",
          "toto098")
    )

})
