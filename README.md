README
================

GitHub Documents
----------------

This is an R Markdown format used for publishing markdown documents to GitHub. When you click the **Knit** button all R code chunks are run and a markdown file (.md) suitable for publishing to GitHub is generated.

Including Code
--------------

You can include R code in the document as follows:

``` r
tibble::tribble(
                                  ~X,          ~Location, ~Min, ~Max,
                    "Partly cloudy.",         "Brisbane",   19L,   29L,
                    "Partly cloudy.", "Brisbane Airport",   18L,   27L,
                  "Possible shower.",       "Beaudesert",   15L,   30L,
                    "Partly cloudy.",        "Chermside",   17L,   29L,
    "Shower or two. Possible storm.",           "Gatton",   15L,   32L,
                  "Possible shower.",          "Ipswich",   15L,   30L,
                    "Partly cloudy.",    "Logan Central",   18L,   29L,
                     "Mostly sunny.",            "Manly",   20L,   26L,
                    "Partly cloudy.",    "Mount Gravatt",   17L,   28L,
                  "Possible shower.",            "Oxley",   17L,   30L,
                    "Partly cloudy.",        "Redcliffe",   19L,   27L
    )
```

    ## # A tibble: 11 x 4
    ##    X                              Location           Min   Max
    ##    <chr>                          <chr>            <int> <int>
    ##  1 Partly cloudy.                 Brisbane            19    29
    ##  2 Partly cloudy.                 Brisbane Airport    18    27
    ##  3 Possible shower.               Beaudesert          15    30
    ##  4 Partly cloudy.                 Chermside           17    29
    ##  5 Shower or two. Possible storm. Gatton              15    32
    ##  6 Possible shower.               Ipswich             15    30
    ##  7 Partly cloudy.                 Logan Central       18    29
    ##  8 Mostly sunny.                  Manly               20    26
    ##  9 Partly cloudy.                 Mount Gravatt       17    28
    ## 10 Possible shower.               Oxley               17    30
    ## 11 Partly cloudy.                 Redcliffe           19    27

Including Plots
---------------

You can also embed plots, for example:

![](README_files/figure-markdown_github/pressure-1.png)

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
