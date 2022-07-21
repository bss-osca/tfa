---
output: html_document
editor_options: 
  chunk_output_type: console
---



<!-- Exercises from: https://rafalab.github.io/dsbook/programming-basics.html -->

# (PART) Programming in R {-} 


# Loops and conditionals {#mod-r-loops-cond}

This module considers programming with loops and conditional statements in R.

We are all different and you may like different learning styles compared to others. In the learning path diagram, there may be links to alternative online content. Note this is an alternative to the standard learning path that you may use instead. The learning path may also have extra content, that is not a part of syllabus, you can have a look at. 


```{=html}
<div id="htmlwidget-92e526df723b15abd06e" style="width:100%;height:480px;" class="grViz html-widget"></div>
<script type="application/json" data-for="htmlwidget-92e526df723b15abd06e">{"x":{"diagram":"digraph {\n\ngraph [layout = \"neato\",\n       outputorder = \"edgesfirst\",\n       bgcolor = \"white\"]\n\nnode [fontname = \"Helvetica\",\n      fontsize = \"10\",\n      shape = \"circle\",\n      fixedsize = \"true\",\n      width = \"0.5\",\n      style = \"filled\",\n      fillcolor = \"aliceblue\",\n      color = \"gray70\",\n      fontcolor = \"gray50\"]\n\nedge [fontname = \"Helvetica\",\n     fontsize = \"8\",\n     len = \"1.5\",\n     color = \"gray80\",\n     arrowsize = \"0.5\"]\n\n  \"1\" [label = \"💡 Conditionals\\n& control flow\", URL = \"https://campus.datacamp.com/courses/intermediate-r/chapter-1-conditionals-and-control-flow\", tooltip = \"Chapter 1 of the interactive DataCamp course Intermediate R.\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"egg\", margin = \"0.2\", width = \"0.5\", fillcolor = \"DarkSeaGreen4\", pos = \"0,2!\"] \n  \"2\" [label = \"📖 Logical\\nfunctions\", URL = \"#r-dc-loops-cond\", tooltip = \"Useful logical functions.\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", width = \"0.5\", fillcolor = \"DarkSeaGreen4\", pos = \"2,2!\"] \n  \"3\" [label = \"💡 Loops\", URL = \"https://campus.datacamp.com/courses/intermediate-r/chapter-2-loops\", tooltip = \"Chapter 2 of the interactive DataCamp course Intermediate R.\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"egg\", margin = \"0.2\", width = \"0.5\", fillcolor = \"DarkSeaGreen4\", pos = \"4,2!\"] \n  \"4\" [label = \"📖 Loops\\n(further)\", URL = \"#r-loops\", tooltip = \"Further tools for looping\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", width = \"0.5\", fillcolor = \"DarkSeaGreen4\", pos = \"6,2!\"] \n  \"5\" [label = \"💻 Exercises\", URL = \"#ex-r-loops-cond\", tooltip = \"Exercises of the module\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"egg\", margin = \"0.2\", width = \"0.5\", fillcolor = \"DarkSeaGreen4\", pos = \"8,2!\"] \n  \"6\" [label = \"🎬 Control\\nstructures\", URL = \"https://www.youtube.com/watch?v=s_h9ruNwI_0&ab_channel=RogerPeng\", tooltip = \"Roger Peng has an introduction to control structures including if, for and while on YouTube.\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", width = \"0.5\", fillcolor = \"DarkOrange4\", pos = \"0,4!\"] \n  \"7\" [label = \"📖 Iteration\", URL = \"https://r4ds.had.co.nz/iteration.html\", tooltip = \"A more detailed introduction to loops (Chapter 21 in H. Wickham, 2017).\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", width = \"0.5\", fillcolor = \"PeachPuff3\", pos = \"4,0!\"] \n  \"8\" [label = \"💡 Loops\\nusing apply\", URL = \"https://campus.datacamp.com/courses/intermediate-r/chapter-4-the-apply-family?ex=1\", tooltip = \"An introduction to loops using the apply family of functions (Chapter 4 of the interactive DataCamp course Intermediate R).\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"egg\", margin = \"0.2\", width = \"0.5\", fillcolor = \"PeachPuff3\", pos = \"6,0!\"] \n  \"9\" [label = \"🎬 Conditionals\\n& loops\", URL = \"https://youtu.be/2evtsnPaoDg\", tooltip = \"Hefin Rhys has a video about conditional statements and loops with examples.\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", width = \"0.5\", fillcolor = \"PeachPuff3\", pos = \"1,0!\"] \n  \"10\" [label = \"\", URL = \"\", tooltip = \" \", style = \"filled\", fixedsize = \"true\", fontsize = \"9\", fontcolor = \"white\", penwidth = \"0.5\", fontname = \"Helvetica\", shape = \"rect\", height = \"1\", width = \"6\", fillcolor = \"#F0F8FF\", pos = \"5.9,3.91!\"] \n  \"11\" [label = \"Color:\", URL = \"\", tooltip = \" \", style = \"filled\", fixedsize = \"true\", fontsize = \"9\", fontcolor = \"black\", penwidth = \"0\", fontname = \"Helvetica\", shape = \"none\", height = \"0\", width = \"0.8\", fillcolor = \"#FFFFFE\", pos = \"3.27,4.25!\"] \n  \"12\" [label = \"mandatory\", URL = \"\", tooltip = \"Mandatory syllabus.\", style = \"filled\", fixedsize = \"true\", fontsize = \"9\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica\", shape = \"rect\", width = \"0.8\", fillcolor = \"DarkSeaGreen4\", pos = \"3.5,3.85!\"] \n  \"13\" [label = \"alternative\", URL = \"\", tooltip = \"Alternative syllabus if you prefer another learning style.\", style = \"filled\", fixedsize = \"true\", fontsize = \"9\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica\", shape = \"rect\", width = \"0.8\", fillcolor = \"DarkOrange4\", pos = \"4.5,3.85!\"] \n  \"14\" [label = \"extra\", URL = \"\", tooltip = \"Extra learning if you are interested (not part of syllabus).\", style = \"filled\", fixedsize = \"true\", fontsize = \"9\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica\", shape = \"rect\", width = \"0.8\", fillcolor = \"PeachPuff3\", pos = \"5.5,3.85!\"] \n  \"15\" [label = \"Shape:\", URL = \"\", tooltip = \" \", style = \"filled\", fixedsize = \"true\", fontsize = \"9\", fontcolor = \"black\", penwidth = \"0\", fontname = \"Helvetica\", shape = \"none\", height = \"0\", width = \"1\", fillcolor = \"#FFFFFE\", pos = \"6.7,4.25!\"] \n  \"16\" [label = \"non-interactive\", URL = \"\", tooltip = \"Non-interactive learning content (e.g. reading).\", style = \"filled\", fixedsize = \"true\", fontsize = \"9\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica\", shape = \"rect\", width = \"1\", fillcolor = \"Grey40\", pos = \"7,3.85!\"] \n  \"17\" [label = \"interactive\", URL = \"\", tooltip = \"Interactive learning content (tutorial, exercises etc.).\", style = \"filled\", fixedsize = \"true\", fontsize = \"9\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica\", shape = \"egg\", width = \"1\", fillcolor = \"Grey40\", pos = \"8.25,3.85!\"] \n\"1\"->\"2\" [color = \"black\", arrowhead = \"vee\"] \n\"1\"->\"6\" [color = \"black\", arrowhead = \"vee\"] \n\"1\"->\"9\" [color = \"black\", arrowhead = \"vee\"] \n\"2\"->\"3\" [color = \"black\", arrowhead = \"vee\"] \n\"3\"->\"4\" [color = \"black\", arrowhead = \"vee\"] \n\"3\"->\"7\" [color = \"black\", arrowhead = \"vee\"] \n\"3\"->\"9\" [color = \"black\", arrowhead = \"vee\"] \n\"4\"->\"5\" [color = \"black\", arrowhead = \"vee\"] \n\"4\"->\"8\" [color = \"black\", arrowhead = \"vee\"] \n}","config":{"engine":"dot","options":null}},"evals":[],"jsHooks":[]}</script>
```


## Learning outcomes {#lo-loops}

By the end of this module, you are expected to be able to:

* Formulate conditional statements.
* Use functions `any` and `all`.
* Formulate loops in R using for and while statements.
* Use function `if_else`.

The learning outcomes relate to the [overall learning goals](#lg-course) number 2, 4 and 10 of the course.

<!-- SOLO increasing: identify · memorise · name · do simple procedure · collect data · -->
<!-- enumerate · describe · interpret · formulate · list · paraphrase · combine · do -->
<!-- algorithms · compare · contrast · explain causes · analyse · relate · derive · -->
<!-- evaluate · apply · argue · theorise · generalise · hypothesise · solve · reflect -->


## Conditionals and control flow {#r-dc-loops-cond}

An excellent introduction to conditionals and if statements is given in [Chapter 1][datacamp-r-intermediate-chap1] of the interactive DataCamp course [Intermediate R][datacamp-r-intermediate]. Please complete the chapter before continuing. 

Some functions are also useful for comparing logical data types. Consider this example: 


```r
x <- c(1, 3, 5, 10, 2, 17, 11, NA, 4)
x > 10  # are the elements greater that 10
#> [1] FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE    NA FALSE
any(x > 10)  # are any of the elements greater that 10
#> [1] TRUE
all(x > 10)  # are all of the elements greater that 10
#> [1] FALSE
all(x < 20)  # are all of the elements greater that 20
#> [1] NA
all(x < 20, na.rm = TRUE)  # are all of the elements greater that 20
#> [1] TRUE
```
That is, functions `any` and `all` can be used to join logical values in vectors. 

Some if statements can be written alternatively using function `if_else`:

```r
if_else(condition, true, false, missing = NULL)
```

For example:


```r
x <- c(-5:5, NA)
x
#>  [1] -5 -4 -3 -2 -1  0  1  2  3  4  5 NA

## using if and for
res <- rep("", length(x))
for (i in seq_along(x)) {
  if (is.na(x[i])) res[i] <- "missing"
  else if (x[i] < 0) res[i] <- "negative"
  else res[i] <- "positive"
}
res
#>  [1] "negative" "negative" "negative" "negative" "negative" "positive" "positive" "positive"
#>  [9] "positive" "positive" "positive" "missing"

## implicit if statement
res <- rep("", length(x))
res
#>  [1] "" "" "" "" "" "" "" "" "" "" "" ""
res[x < 0] <- "negative"
res[x >= 0] <- "positive"
res[is.na(x)] <- "missing"
res
#>  [1] "negative" "negative" "negative" "negative" "negative" "positive" "positive" "positive"
#>  [9] "positive" "positive" "positive" "missing"

## using if_else
res <- if_else(x < 0, "negative", "positive", "missing")
res
#>  [1] "negative" "negative" "negative" "negative" "negative" "positive" "positive" "positive"
#>  [9] "positive" "positive" "positive" "missing"
```




## Loops {#r-loops}

An excellent introduction to conditionals and if statements is given in [Chapter 2][datacamp-r-intermediate-chap2] of the interactive DataCamp course [Intermediate R][datacamp-r-intermediate]. Please complete the chapter before continuing (stop when Chapter 2 finishes). 

Loops in R may be slow. However, not if you follow some golden rules:

* Do not use a loop when a vectorized alternative exists.
* Do not grow objects (via `c`, `cbind`, etc) during the loop - R has to create a new object and copy across the information just to add a new element or row/column. Instead, allocate an object to hold the results and fill it in during the loop.

As an example, consider the for loop with 4 iterations:


```r
i_val <- c(1,2,6,9)
res <- rep(NA,4)
res
#> [1] NA NA NA NA
for (idx in 1:length(i_val)) {
  res[idx] <- 6 * i_val[idx] + 9
}
res
#> [1] 15 21 45 63
```

Note we allocate memory for the result vector before the loop so we do not have to grow the result object. Next, we calculate results $6i+9$ using a loop. Be careful here! This is not the same:


```r
res <- rep(NA,4)
for (i in i_val) {
  res[i] <- 6 * i + 9
}
res
#> [1] 15 21 NA NA NA 45 NA NA 63
```

In this example, however, we can use a vectorized alternative:


```r
res <- 6 * i_val + 9
res
#> [1] 15 21 45 63
```

where the operation is applied to each element in the vector.

Nested for loops is also possible. A simple example of a nested loop:


```r
for (i in 1:3) {
  for (j in 1:2) {
    cat(str_c("i =", i, " j = ",j, "\n"))
  }
}
#> i =1 j = 1
#> i =1 j = 2
#> i =2 j = 1
#> i =2 j = 2
#> i =3 j = 1
#> i =3 j = 2
```

We here use the function `cat` to print out a string (`\n` indicates new line). Note how the nested loops are executed:

* Set `i = 1` (outer loop)
   - Set `j = 1` (inner loop), `i` stays 1
   - Set `j = 2` (inner loop), `i` stays 1
   - Inner loop finishes, proceed with outer loop.
* Increase `i = 2` (outer loop)
   - Set `j = 1` (inner loop), `i` stays 2
   - Set `j = 2` (inner loop), `i` stays 2
   - Inner loop finishes, proceed with outer loop.
* Increase `i = 3` (outer loop)
   - Set `j = 1` (inner loop), `i` stays 3
   - Set `j = 2` (inner loop), `i` stays 3
   - Inner loop finishes, proceed with outer loop.
* Outer loop finishes as well (we looped over `i in 1:3`). Job done.

Nested loops can be used to iterate over matrices or data frames:


```r
mat <- matrix(NA, nrow = 2, ncol = 3)
mat
#>      [,1] [,2] [,3]
#> [1,]   NA   NA   NA
#> [2,]   NA   NA   NA
for (i in 1:nrow(mat)) {
  for (j in 1:ncol(mat)) {
     mat[i,j] <- (i-1)*ncol(mat) + j
     cat(str_c("Entry (", i, ", ", j, ") = ", mat[i,j], "\n"))
  }
}
#> Entry (1, 1) = 1
#> Entry (1, 2) = 2
#> Entry (1, 3) = 3
#> Entry (2, 1) = 4
#> Entry (2, 2) = 5
#> Entry (2, 3) = 6
mat
#>      [,1] [,2] [,3]
#> [1,]    1    2    3
#> [2,]    4    5    6
```

Often you can replace nested loops with a single loop by using `expand_grid`:


```r
library(tidyverse)  # load function expand_grid
mat <- matrix(NA, nrow = 2, ncol = 3)
ite <- expand_grid(i = 1:2, j=1:3)
ite
#> # A tibble: 6 × 2
#>       i     j
#>   <int> <int>
#> 1     1     1
#> 2     1     2
#> 3     1     3
#> 4     2     1
#> 5     2     2
#> 6     2     3
for (r in 1:nrow(ite)) { # iterate over rows
   i <- ite$i[r]
   j <- ite$j[r]
   mat[i,j] <- (i-1)*ncol(mat) + j
   cat(str_c("Entry (", i, ", ", j, ") = ", mat[i,j], "\n"))
}
#> Entry (1, 1) = 1
#> Entry (1, 2) = 2
#> Entry (1, 3) = 3
#> Entry (2, 1) = 4
#> Entry (2, 2) = 5
#> Entry (2, 3) = 6
mat
#>      [,1] [,2] [,3]
#> [1,]    1    2    3
#> [2,]    4    5    6
```

Note `expand_grid` creates a data frame with all combinations. This way of looping is a more flexible approach since you can

* nest more loops by adding more columns to `ite`,
* add different values in each column.

For instance, if you only want to calculate values for row 2 and columns 1 and 3 the code becomes:


```r
mat <- matrix(NA, nrow = 2, ncol = 3)
ite <- expand_grid(i = 2, j = c(1,3))
ite
#> # A tibble: 2 × 2
#>       i     j
#>   <dbl> <dbl>
#> 1     2     1
#> 2     2     3
for (r in 1:nrow(ite)) { # iterate over rows
   i <- ite$i[r]
   j <- ite$j[r]
   mat[i,j] <- (i-1)*ncol(mat) + j
   cat(str_c("Entry (", i, ", ", j, ") = ", mat[i,j], "\n"))
}
#> Entry (2, 1) = 4
#> Entry (2, 3) = 6
mat
#>      [,1] [,2] [,3]
#> [1,]   NA   NA   NA
#> [2,]    4   NA    6
```


## Recap {#rc-r-loops-cond}

*Comparison/relational operators* known to R are:

- `<` for less than,
- `>` for greater than,
- `<=` for less than or equal to,
- `>=` for greater than or equal to,
- `==` for equal to each other (and not `=` which is typically used for assignment!),
- `!=` not equal to each other.
   
*Logical operators* known to R are:

- `&` and,
- `|` or,
- `!` not.

If you use `&&` and `||` only the first element in vectors are compared. In general this is used rarely. 

Useful functions that return a logical are `any` and `all` which can be used to join logical values in vectors.

Conditional Statements can be constructed using for instance `if` and `while` statements. Moreover, function `if_else` is a vectorized alternative.

*Loops* can be created using `for` and `while` statements. 

You can break out of a loop using `break` and jump to the next iteration (skipping the remainder of the code in the loop) using `next`.

Do not use a loop when a vectorized alternative exists.

Do not grow objects during the loop. Instead, allocate an object to hold the results and fill it in during the loop.

Nested loops are possible in R. However, often they can be converted into a single loop by defining a data frame having the values of the nested loops in each row. Here function `expand_grid` may be useful to create the data frame. 

You may also have a look at the [slides for this module](https://bss-osca.github.io/tfa/slides/06-01_r-loops-cond-slides.html).


## Exercises {#ex-r-loops-cond}

Below you will find a set of exercises. Always have a look at the exercises before you meet in your study group and try to solve them yourself. Are you stuck, see the [help page](#help). Some of the solutions to each exercise can be seen by pressing the button at each question. Beware, you will not learn by giving up too early. Put some effort into finding a solution!

[Link to the project on RStudio Cloud for this module][r-cloud-mod13]. 

### Exercise (conditional expressions)

*Solve this exercise using a script file*

1) Consider object `x`:

   
   ```r
   x <- c(1,2,-3,4)
   ```
  
   What will this conditional expression return?

   
   ```r
   if(all(x>0)){
    print("All Postives")
   } else {
    print("Not all positives")
   }
   ```

2) What will the following expressions return?

   
   ```r
   x <- c(TRUE, FALSE, TRUE, TRUE)
   all(x)
   any(x)
   any(!x)
   all(!x)
   ```

3) Which of the expressions above is always `FALSE` when at least one entry of a logical vector `x` is TRUE?

Consider vector:


```r
library(tidyverse)
x <- 1:15
x
#>  [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15
```


<div class="modal fade bs-example-modal-lg" id="FurLqSNyuRujWgme6T0H" tabindex="-1" role="dialog" aria-labelledby="FurLqSNyuRujWgme6T0H-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="FurLqSNyuRujWgme6T0H-title">Solution</h4></div><div class="modal-body">

```r
if_else(x < 7, as.integer(0), x)
#>  [1]  0  0  0  0  0  0  7  8  9 10 11 12 13 14 15
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#FurLqSNyuRujWgme6T0H">Solution</button>

<div class="modal fade bs-example-modal-lg" id="segyPJ33FZ6bzU8JqoA2" tabindex="-1" role="dialog" aria-labelledby="segyPJ33FZ6bzU8JqoA2-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="segyPJ33FZ6bzU8JqoA2-title">Hint</h4></div><div class="modal-body">

```r
if_else(x < 7, as.integer(___), ___)
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#segyPJ33FZ6bzU8JqoA2">Hint</button>

4) Use the `if_else` function to set elements with value below 7 to 0.




<div class="modal fade bs-example-modal-lg" id="ouXolNifap6CudRylWwz" tabindex="-1" role="dialog" aria-labelledby="ouXolNifap6CudRylWwz-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="ouXolNifap6CudRylWwz-title">Solution</h4></div><div class="modal-body">

```r
if_else(x < 7 | x > 10, NA_integer_, x)
#>  [1] NA NA NA NA NA NA  7  8  9 10 NA NA NA NA NA
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#ouXolNifap6CudRylWwz">Solution</button>

<div class="modal fade bs-example-modal-lg" id="TJm4GHp0LZgWiU8J67KN" tabindex="-1" role="dialog" aria-labelledby="TJm4GHp0LZgWiU8J67KN-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="TJm4GHp0LZgWiU8J67KN-title">Hint</h4></div><div class="modal-body">

```r
if_else(___, NA_integer_, ___)
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#TJm4GHp0LZgWiU8J67KN">Hint</button>

5) Use the `if_else` function to set elements with value below 7 or above 10 to `NA_integer_` (which is the NA/missing value of an integer).




<div class="modal fade bs-example-modal-lg" id="Hqhr4HcnDTVLiZP18yy8" tabindex="-1" role="dialog" aria-labelledby="Hqhr4HcnDTVLiZP18yy8-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="Hqhr4HcnDTVLiZP18yy8-title">Solution</h4></div><div class="modal-body">

```r
x <- sample(c(1:10,NA,5.5), 1)
if (is.na(x)) {
  y <- "missing"
} else if (x %% 2 == 0) {
  y <- "even"
} else if (x %% 2 == 1) {
  y <- "odd"
} else if (x %% 1 > 0) {
  y <- "decimal"
} 
x
#> [1] 7
y
#> [1] "odd"
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#Hqhr4HcnDTVLiZP18yy8">Solution</button>

<div class="modal fade bs-example-modal-lg" id="9gK7aMp1G1OrGw9RKEKv" tabindex="-1" role="dialog" aria-labelledby="9gK7aMp1G1OrGw9RKEKv-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="9gK7aMp1G1OrGw9RKEKv-title">Hint</h4></div><div class="modal-body">

```r
x <- sample(c(1:10,NA,5.5), 1)
if (is.na(x)) {
  y <- ___
} else if (x %% 2 == 0) {
  ___
} else if (___) {
  ___
} else if (___) {
  y <- "decimal"
} 
x
y
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#9gK7aMp1G1OrGw9RKEKv">Hint</button>

6) Consider code

   
   ```r
   x <- sample(c(1:10,NA,5.5), 1)
   x
   #> [1] 3
   ```

   which generates a number from the vector `c(1:10,NA,5.5)`. 

   Write code which set object `y` equal to "even" if `x` is even, "odd" if `x` is odd, "decimal" if `x` has a decimal not zero and "missing" if `x` is `NA`. Hint: have a look at `?'%%'` (the modulo operator).





### Exercise (loops)


<div class="modal fade bs-example-modal-lg" id="7vbQjfgwK3lhdzvNPJjs" tabindex="-1" role="dialog" aria-labelledby="7vbQjfgwK3lhdzvNPJjs-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="7vbQjfgwK3lhdzvNPJjs-title">Solution</h4></div><div class="modal-body">

```r
x <- rep(NA,4)
for (i in 1:4) {
  x[i] <- 2 * i + 4
}
x
#> [1]  6  8 10 12
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#7vbQjfgwK3lhdzvNPJjs">Solution</button>

<div class="modal fade bs-example-modal-lg" id="E9P6c4tuaseFhEYZUeSU" tabindex="-1" role="dialog" aria-labelledby="E9P6c4tuaseFhEYZUeSU-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="E9P6c4tuaseFhEYZUeSU-title">Hint</h4></div><div class="modal-body">

```r
x <- rep(NA,4)
for (i in 1:4) {
  x[i] <- ___
}
x
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#E9P6c4tuaseFhEYZUeSU">Hint</button>

1) Using a `for` loop, create a vector having values $2i + 4$ given $i=1\ldots 4$.




<div class="modal fade bs-example-modal-lg" id="P9Z0jPPdiLXh2IeIcC5b" tabindex="-1" role="dialog" aria-labelledby="P9Z0jPPdiLXh2IeIcC5b-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="P9Z0jPPdiLXh2IeIcC5b-title">Solution</h4></div><div class="modal-body">

```r
i_val <- c(2, 5, 6, 12)
x <- rep(NA, length(i_val))
for (idx in 1:length(i_val)) {
  x[idx] <- 2 * i_val[idx] + 4
}
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#P9Z0jPPdiLXh2IeIcC5b">Solution</button>

<div class="modal fade bs-example-modal-lg" id="NDZR7rhoIj8rAaDyHqx8" tabindex="-1" role="dialog" aria-labelledby="NDZR7rhoIj8rAaDyHqx8-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="NDZR7rhoIj8rAaDyHqx8-title">Hint</h4></div><div class="modal-body">

```r
i_val <- c(2, 5, 6, 12)
x <- rep(NA, length(i_val))
for (idx in 1:length(i_val)) {
  x[idx] <- ___
}
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#NDZR7rhoIj8rAaDyHqx8">Hint</button>

2) Using a `for` loop, create a vector having values $2i + 4$ given $i=2,5,6,12$.




<div class="modal fade bs-example-modal-lg" id="2oWUhNKafW7Vlx8LQQWf" tabindex="-1" role="dialog" aria-labelledby="2oWUhNKafW7Vlx8LQQWf-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="2oWUhNKafW7Vlx8LQQWf-title">Solution</h4></div><div class="modal-body">

```r
i_val <- c(2, 5, 6, 12)
x <- rep(NA, length(i_val))
idx <- 1
while (idx < 5) {
  x[idx] <- 2 * i_val[idx] + 4
  idx <- idx + 1
}
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#2oWUhNKafW7Vlx8LQQWf">Solution</button>

<div class="modal fade bs-example-modal-lg" id="u6g6imdoJB0lX7BQPpGR" tabindex="-1" role="dialog" aria-labelledby="u6g6imdoJB0lX7BQPpGR-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="u6g6imdoJB0lX7BQPpGR-title">Hint</h4></div><div class="modal-body">

```r
i_val <- c(2, 5, 6, 12)
x <- rep(NA, length(i_val))
idx <- 1
while (idx < 5) {
  x[idx] <- ___
  idx <- ___
}
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#u6g6imdoJB0lX7BQPpGR">Hint</button>

3) Solve Question 2 using a `while` loop.




<div class="modal fade bs-example-modal-lg" id="e4HRp1wpzoqY64pxLpzw" tabindex="-1" role="dialog" aria-labelledby="e4HRp1wpzoqY64pxLpzw-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="e4HRp1wpzoqY64pxLpzw-title">Solution</h4></div><div class="modal-body">

```r
2 * 1:4 + 4             # Q1
#> [1]  6  8 10 12
2* c(2, 5, 6, 12) + 4   # Q2
#> [1]  8 14 16 28
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#e4HRp1wpzoqY64pxLpzw">Solution</button>

<div class="modal fade bs-example-modal-lg" id="vCdvqYmTEdgo4ATGEhFu" tabindex="-1" role="dialog" aria-labelledby="vCdvqYmTEdgo4ATGEhFu-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="vCdvqYmTEdgo4ATGEhFu-title">Hint</h4></div><div class="modal-body">

```r
2 * ___ + 4             # Q1
___   # Q2
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#vCdvqYmTEdgo4ATGEhFu">Hint</button>

4) Solve Questions 1 and 2 using a vectorized alternative. 




### Exercise (calculating distances) {#ex-dist}

Consider zip codes in Jutland:


```r
# remotes::install_github("bss-osca/tfa/tfa-package", upgrade = FALSE)  # run to upgrade
library(tidyverse)
library(tfa)   
zips
#> # A tibble: 376 × 2
#>      Zip Area           
#>    <dbl> <chr>          
#>  1  5320 "Agedrup"      
#>  2  6753 "Agerb\xe6k"   
#>  3  6534 "Agerskov"     
#>  4  8961 "Alling\xe5bro"
#>  5  6051 "Almind"       
#>  6  8592 "Anholt"       
#>  7  8643 "Ans By"       
#>  8  6823 "Ansager"      
#>  9  9510 "Arden"        
#> 10  5466 "Asperup"      
#> # … with 366 more rows
```

We want to calculate distances between a subset of zip areas:


```r
idx <- 1:5
dat <- zips[idx,]
dat
#> # A tibble: 5 × 2
#>     Zip Area           
#>   <dbl> <chr>          
#> 1  5320 "Agedrup"      
#> 2  6753 "Agerb\xe6k"   
#> 3  6534 "Agerskov"     
#> 4  8961 "Alling\xe5bro"
#> 5  6051 "Almind"
distanceMat <- matrix(NA, nrow = length(idx), ncol = length(idx))
colnames(distanceMat) <- str_c(dat$Zip[idx], dat$Area[idx], sep = " ") 
rownames(distanceMat) <- colnames(distanceMat)
distanceMat
#>                    5320 Agedrup 6753 Agerb\xe6k 6534 Agerskov 8961 Alling\xe5bro 6051 Almind
#> 5320 Agedrup                 NA              NA            NA                 NA          NA
#> 6753 Agerb\xe6k              NA              NA            NA                 NA          NA
#> 6534 Agerskov                NA              NA            NA                 NA          NA
#> 8961 Alling\xe5bro           NA              NA            NA                 NA          NA
#> 6051 Almind                  NA              NA            NA                 NA          NA
```

We can find average distances between two zip codes (here rows 1 and 2 in `dat`) using Bing maps:


```r
key <- "AlUJdApmvPe8y2_IMrC4j4x8fzytbD2M0SvlmpemL09ae_CWS6-IuNSgrAtXoyeP"
url <- str_c("http://dev.virtualearth.net/REST/V1/Routes/Driving?wp.0=",
             dat$Zip[1], ",Denmark",
             "&wp.1=",
             dat$Zip[2], ",Denmark",
             "&avoid=minimizeTolls&key=", key)
library(jsonlite)
lst <- jsonlite::fromJSON(url)
dist <- lst$resourceSets$resources[[1]]$travelDistance
dist
#> [1] 140
lst$statusCode
#> [1] 200
lst$statusDescription
#> [1] "OK"
```

Note we call the Bing maps API with the two zip codes. A [json file](https://en.wikipedia.org/wiki/JSON) is returned and stored in a list. To get the average travel distance we access `travelDistance`. The status code should be 200 if the calculation returned is okay.


<div class="modal fade bs-example-modal-lg" id="GJQiKBXcAoU38bIBiQhe" tabindex="-1" role="dialog" aria-labelledby="GJQiKBXcAoU38bIBiQhe-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="GJQiKBXcAoU38bIBiQhe-title">Solution</h4></div><div class="modal-body">

```r
key <- "AlUJdApmvPe8y2_IMrC4j4x8fzytbD2M0SvlmpemL09ae_CWS6-IuNSgrAtXoyeP"
for(i in 1:nrow(distanceMat)) {
   for(j in 1:ncol(distanceMat)) {
      if (i>j) {distanceMat[i,j] <- distanceMat[j,i]; next}   # assume symmetric distances
      if (!is.na(distanceMat[i,j])) next   # value already calculated 
      if (i==j) {distanceMat[i,j] <- 0; next}
      
      url <- str_c("http://dev.virtualearth.net/REST/V1/Routes/Driving?wp.0=",
                   dat$Zip[i], ",Denmark",
                   "&wp.1=",
                   dat$Zip[j], ",Denmark",
                   "&avoid=minimizeTolls&key=", key)
      lst <- jsonlite::fromJSON(url)
      if (lst$statusCode == 200) {
         distanceMat[i,j] <- lst$resourceSets$resources[[1]]$travelDistance
      }
   }
}
distanceMat
#>                    5320 Agedrup 6753 Agerb\xe6k 6534 Agerskov 8961 Alling\xe5bro 6051 Almind
#> 5320 Agedrup                0.0           140.1         144.5                215        88.5
#> 6753 Agerb\xe6k           140.1             0.0         107.0                180        61.3
#> 6534 Agerskov             144.5           107.0           0.0                204        65.6
#> 8961 Alling\xe5bro        215.2           180.4         204.3                  0       150.8
#> 6051 Almind                88.5            61.3          65.6                151         0.0
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#GJQiKBXcAoU38bIBiQhe">Solution</button>

<div class="modal fade bs-example-modal-lg" id="OgDSPKFpUqYxZwiT15Fy" tabindex="-1" role="dialog" aria-labelledby="OgDSPKFpUqYxZwiT15Fy-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="OgDSPKFpUqYxZwiT15Fy-title">Hint</h4></div><div class="modal-body">

```r
key <- "AlUJdApmvPe8y2_IMrC4j4x8fzytbD2M0SvlmpemL09ae_CWS6-IuNSgrAtXoyeP"
for(i in 1:nrow(distanceMat)) {
   for(j in 1:ncol(___)) {
      if (i>j) {distanceMat[i,j] <- ___; next}   # assume symmetric distances
      if (!is.na(distanceMat[i,j])) next   # value already calculated 
      if (i==j) {distanceMat[i,j] <- ___; next}
      
      url <- str_c("http://dev.virtualearth.net/REST/V1/Routes/Driving?wp.0=",
                   dat$Zip[i], ",Denmark",
                   "&wp.1=",
                   dat$Zip[j], ",Denmark",
                   "&avoid=minimizeTolls&key=", key)
      lst <- jsonlite::fromJSON(url)
      if (lst$statusCode == ___) {
         distanceMat[i,j] <- ___
      }
   }
}
distanceMat
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#OgDSPKFpUqYxZwiT15Fy">Hint</button>

Use nested for loops to fill `distanceMat` with distances. Assume that the distance from a to b is the same as from b to a. That is, you only have to call the API once for two zip codes. Use an if statement to check if the status code is okay.


### Exercise (`expand_grid`)


<div class="modal fade bs-example-modal-lg" id="gbzQPkgwmXCS3Gt17Cua" tabindex="-1" role="dialog" aria-labelledby="gbzQPkgwmXCS3Gt17Cua-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="gbzQPkgwmXCS3Gt17Cua-title">Solution</h4></div><div class="modal-body">

```r
ite <- expand_grid(i = c(1,5), j = 2:3)
ite
#> # A tibble: 4 × 2
#>       i     j
#>   <dbl> <int>
#> 1     1     2
#> 2     1     3
#> 3     5     2
#> 4     5     3
key <- "AlUJdApmvPe8y2_IMrC4j4x8fzytbD2M0SvlmpemL09ae_CWS6-IuNSgrAtXoyeP"
for (r in 1:nrow(ite)) { # iterate over rows
   i <- ite$i[r]
   j <- ite$j[r]
   if (i==j) {distanceMat[i,j] <- 0; next}
   url <- str_c("http://dev.virtualearth.net/REST/V1/Routes/Driving?wp.0=",
                dat$Zip[i], ",Denmark",
                "&wp.1=",
                dat$Zip[j], ",Denmark",
                "&avoid=minimizeTolls&key=", key)
   lst <- jsonlite::fromJSON(url)
   if (lst$statusCode == 200) {
      distanceMat[i,j] <- lst$resourceSets$resources[[1]]$travelDistance
      distanceMat[j,i] <- distanceMat[i,j]
   }
}
distanceMat
#>                    5320 Agedrup 6753 Agerb\xe6k 6534 Agerskov 8961 Alling\xe5bro 6051 Almind
#> 5320 Agedrup                0.0           140.1         144.5                215        88.5
#> 6753 Agerb\xe6k           140.1             0.0         107.0                180        58.8
#> 6534 Agerskov             144.5           107.0           0.0                204        62.4
#> 8961 Alling\xe5bro        215.2           180.4         204.3                  0       150.8
#> 6051 Almind                88.5            58.8          62.4                151         0.0
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#gbzQPkgwmXCS3Gt17Cua">Solution</button>

<div class="modal fade bs-example-modal-lg" id="cMjCZQ3rjPMy4keAN8Et" tabindex="-1" role="dialog" aria-labelledby="cMjCZQ3rjPMy4keAN8Et-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="cMjCZQ3rjPMy4keAN8Et-title">Hint</h4></div><div class="modal-body">

```r
ite <- expand_grid(i = ___, j = ___)
ite
key <- "AlUJdApmvPe8y2_IMrC4j4x8fzytbD2M0SvlmpemL09ae_CWS6-IuNSgrAtXoyeP"
for (r in 1:nrow(ite)) { # iterate over rows
   i <- ite$i[r]
   j <- ite$j[r]
   if (i==j) {distanceMat[i,j] <- 0; next}
   url <- str_c("http://dev.virtualearth.net/REST/V1/Routes/Driving?wp.0=",
                dat$Zip[i], ",Denmark",
                "&wp.1=",
                dat$Zip[j], ",Denmark",
                "&avoid=minimizeTolls&key=", key)
   lst <- jsonlite::fromJSON(url)
   if (lst$statusCode == ___) {
      distanceMat[i,j] <- lst$resourceSets$resources[[1]]$travelDistance
      distanceMat[j,i] <- ___
   }
}
distanceMat
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#cMjCZQ3rjPMy4keAN8Et">Hint</button>

Consider the solution of Exercise \@ref(ex-dist) and assume that you only want to calculate the distance from rows 1 and 5 to rows 2 and 3 in `dat`. Modify the solution using `expand_grid` so only one loop is used.


[BSS]: https://bss.au.dk/en/

[course-help]: https://github.com/bss-osca/tfa/issues
[cran]: https://cloud.r-project.org
[cheatsheet-readr]: https://rawgit.com/rstudio/cheatsheets/master/data-import.pdf
[course-welcome-to-the-tidyverse]: https://github.com/rstudio-education/welcome-to-the-tidyverse

[DataCamp]: https://www.datacamp.com/
[datacamp-signup]: https://www.datacamp.com/groups/shared_links/cbaee6c73e7d78549a9e32a900793b2d5491ace1824efc1760a6729735948215
[datacamp-r-intro]: https://learn.datacamp.com/courses/free-introduction-to-r
[datacamp-r-rmarkdown]: https://campus.datacamp.com/courses/reporting-with-rmarkdown
[datacamp-r-communicating]: https://learn.datacamp.com/courses/communicating-with-data-in-the-tidyverse
[datacamp-r-communicating-chap3]: https://campus.datacamp.com/courses/communicating-with-data-in-the-tidyverse/introduction-to-rmarkdown
[datacamp-r-communicating-chap4]: https://campus.datacamp.com/courses/communicating-with-data-in-the-tidyverse/customizing-your-rmarkdown-report
[datacamp-r-intermediate]: https://learn.datacamp.com/courses/intermediate-r
[datacamp-r-intermediate-chap1]: https://campus.datacamp.com/courses/intermediate-r/chapter-1-conditionals-and-control-flow
[datacamp-r-intermediate-chap2]: https://campus.datacamp.com/courses/intermediate-r/chapter-2-loops
[datacamp-r-intermediate-chap3]: https://campus.datacamp.com/courses/intermediate-r/chapter-3-functions
[datacamp-r-intermediate-chap4]: https://campus.datacamp.com/courses/intermediate-r/chapter-4-the-apply-family
[datacamp-r-functions]: https://learn.datacamp.com/courses/introduction-to-writing-functions-in-r
[datacamp-r-tidyverse]: https://learn.datacamp.com/courses/introduction-to-the-tidyverse
[datacamp-r-strings]: https://learn.datacamp.com/courses/string-manipulation-with-stringr-in-r
[datacamp-r-dplyr]: https://learn.datacamp.com/courses/data-manipulation-with-dplyr
[datacamp-r-dplyr-bakeoff]: https://learn.datacamp.com/courses/working-with-data-in-the-tidyverse
[datacamp-r-ggplot2-intro]: https://learn.datacamp.com/courses/introduction-to-data-visualization-with-ggplot2
[datacamp-r-ggplot2-intermediate]: https://learn.datacamp.com/courses/intermediate-data-visualization-with-ggplot2
[dplyr-cran]: https://CRAN.R-project.org/package=dplyr
[debug-in-r]: https://rstats.wtf/debugging-r-code.html

[excel-vs-r]: https://www.jessesadler.com/post/excel-vs-r/

[google-form]: https://forms.gle/s39GeDGV9AzAXUo18
[google-grupper]: https://docs.google.com/spreadsheets/d/1DHxthd5AQywAU4Crb3hM9rnog2GqGQYZ2o175SQgn_0/edit?usp=sharing
[GitHub]: https://github.com/
[git-install]: https://git-scm.com/downloads
[github-actions]: https://github.com/features/actions
[github-pages]: https://pages.github.com/

[happy-git]: https://happygitwithr.com
[hg-install-git]: https://happygitwithr.com/install-git.html
[hg-why]: https://happygitwithr.com/big-picture.html#big-picture
[hg-github-reg]: https://happygitwithr.com/github-acct.html#github-acct
[hg-git-install]: https://happygitwithr.com/install-git.html#install-git
[hg-exist-github-first]: https://happygitwithr.com/existing-github-first.html
[hg-exist-github-last]: https://happygitwithr.com/existing-github-last.html
[hg-credential-helper]: https://happygitwithr.com/credential-caching.html
[hypothes.is]: https://web.hypothes.is/

[osca-programme]: https://kandidat.au.dk/en/operationsandsupplychainanalytics/

[Peergrade]: https://peergrade.io
[peergrade-signup]: https://app.peergrade.io/join
[point-and-click]: https://en.wikipedia.org/wiki/Point_and_click
[pkg-bookdown]: https://bookdown.org/yihui/bookdown/
[pkg-openxlsx]: https://ycphs.github.io/openxlsx/index.html
[pkg-ropensci-writexl]: https://docs.ropensci.org/writexl/
[pkg-jsonlite]: https://cran.r-project.org/web/packages/jsonlite/index.html

[R]: https://www.r-project.org
[RStudio]: https://rstudio.com
[rstudio-cloud]: https://rstudio.cloud/spaces/176810/join?access_code=LSGnG2EXTuzSyeYaNXJE77vP33DZUoeMbC0xhfCz
[r-cloud-mod12]: https://rstudio.cloud/spaces/176810/project/2963819
[r-cloud-mod13]: https://rstudio.cloud/spaces/176810/project/3020139
[r-cloud-mod14]: https://rstudio.cloud/spaces/176810/project/3020322
[r-cloud-mod15]: https://rstudio.cloud/spaces/176810/project/3020509
[r-cloud-mod16]: https://rstudio.cloud/spaces/176810/project/3026754
[r-cloud-mod17]: https://rstudio.cloud/spaces/176810/project/3034015
[r-cloud-mod18]: https://rstudio.cloud/spaces/176810/project/3130795
[r-cloud-mod19]: https://rstudio.cloud/spaces/176810/project/3266132
[rstudio-download]: https://rstudio.com/products/rstudio/download/#download
[rstudio-customizing]: https://support.rstudio.com/hc/en-us/articles/200549016-Customizing-RStudio
[rstudio-key-shortcuts]: https://support.rstudio.com/hc/en-us/articles/200711853-Keyboard-Shortcuts
[rstudio-workbench]: https://www.rstudio.com/wp-content/uploads/2014/04/rstudio-workbench.png
[r-markdown]: https://rmarkdown.rstudio.com/
[ropensci-writexl]: https://docs.ropensci.org/writexl/
[r4ds-pipes]: https://r4ds.had.co.nz/pipes.html
[r4ds-factors]: https://r4ds.had.co.nz/factors.html
[r4ds-strings]: https://r4ds.had.co.nz/strings.html
[r4ds-iteration]: https://r4ds.had.co.nz/iteration.html

[stat-545]: https://stat545.com
[stat-545-functions-part1]: https://stat545.com/functions-part1.html
[stat-545-functions-part2]: https://stat545.com/functions-part2.html
[stat-545-functions-part3]: https://stat545.com/functions-part3.html
[slides-welcome]: https://bss-osca.github.io/tfa/slides/00-tfa_welcome.html
[slides-m1-3]: https://bss-osca.github.io/tfa/slides/01-welcome_r_part.html
[slides-m4-5]: https://bss-osca.github.io/tfa/slides/02-programming.html
[slides-m6-8]: https://bss-osca.github.io/tfa/slides/03-transform.html
[slides-m9]: https://bss-osca.github.io/tfa/slides/04-plot.html
[slides-m83]: https://bss-osca.github.io/tfa/slides/05-joins.html

[tidyverse-main-page]: https://www.tidyverse.org
[tidyverse-packages]: https://www.tidyverse.org/packages/
[tidyverse-core]: https://www.tidyverse.org/packages/#core-tidyverse
[tidyverse-ggplot2]: https://ggplot2.tidyverse.org/
[tidyverse-dplyr]: https://dplyr.tidyverse.org/
[tidyverse-tidyr]: https://tidyr.tidyverse.org/
[tidyverse-readr]: https://readr.tidyverse.org/
[tidyverse-purrr]: https://purrr.tidyverse.org/
[tidyverse-tibble]: https://tibble.tidyverse.org/
[tidyverse-stringr]: https://stringr.tidyverse.org/
[tidyverse-forcats]: https://forcats.tidyverse.org/
[tidyverse-readxl]: https://readxl.tidyverse.org
[tidyverse-googlesheets4]: https://googlesheets4.tidyverse.org/index.html
[tutorial-markdown]: https://commonmark.org/help/tutorial/

[Udemy]: https://www.udemy.com/

[vba-yt-course1]: https://www.youtube.com/playlist?list=PLpOAvcoMay5S_hb2D7iKznLqJ8QG_pde0
[vba-course1-hello]: https://youtu.be/f42OniDWaIo

[vba-yt-course2]: https://www.youtube.com/playlist?list=PL3A6U40JUYCi4njVx59-vaUxYkG0yRO4m
[vba-course2-devel-tab]: https://youtu.be/awEOUaw9q58
[vba-course2-devel-editor]: https://youtu.be/awEOUaw9q58
[vba-course2-devel-project]: https://youtu.be/fp6PTbU7bXo
[vba-course2-devel-properties]: https://youtu.be/ks2QYKAd9Xw
[vba-course2-devel-hello]: https://youtu.be/EQ6tDWBc8G4

[video-install]: https://vimeo.com/415501284
[video-rstudio-intro]: https://vimeo.com/416391353
[video-packages]: https://vimeo.com/416743698
[video-projects]: https://vimeo.com/319318233
[video-r-intro-p1]: https://www.youtube.com/watch?v=vGY5i_J2c-c
[video-r-intro-p2]: https://www.youtube.com/watch?v=w8_XdYI3reU
[video-r-intro-p3]: https://www.youtube.com/watch?v=NuY6jY4qE7I
[video-subsetting]: https://www.youtube.com/watch?v=hWbgqzsQJF0&list=PLjTlxb-wKvXPqyY3FZDO8GqIaWuEDy-Od&index=10&t=0s
[video-datatypes]: https://www.youtube.com/watch?v=5AQM-yUX9zg&list=PLjTlxb-wKvXPqyY3FZDO8GqIaWuEDy-Od&index=10
[video-control-structures]: https://www.youtube.com/watch?v=s_h9ruNwI_0
[video-conditional-loops]: https://www.youtube.com/watch?v=2evtsnPaoDg
[video-functions]: https://www.youtube.com/watch?v=ffPeac3BigM
[video-tibble-vs-df]: https://www.youtube.com/watch?v=EBk6PnvE1R4
[video-dplyr]: https://www.youtube.com/watch?v=aywFompr1F4

[wiki-snake-case]: https://en.wikipedia.org/wiki/Snake_case
[wiki-camel-case]: https://en.wikipedia.org/wiki/Camel_case
[wiki-interpreted]: https://en.wikipedia.org/wiki/Interpreted_language
[wiki-literate-programming]: https://en.wikipedia.org/wiki/Literate_programming
[wiki-csv]: https://en.wikipedia.org/wiki/Comma-separated_values
[wiki-json]: https://en.wikipedia.org/wiki/JSON














<!-- <div class = "boxExercise"> -->
<!-- `<i class="fa-pull-right fa-5x iconStyle1 fas fa-laptop-code"></i>`{=html}   -->

<!-- **Exercise 1** -->
<!-- asdf asdlfkj sdfklj fsdjka æ -->

<!--    1. sdf -->
<!--    2. edasf -->

<!-- **Exercise 2** -->
<!-- asdfav sdaf sdhj sdjkahdf jkhasdkjæsdfh asjf -->

<!--    1. sdf -->
<!--    2. sdf -->
<!-- </div> -->


<!-- `<i class="fa-pull-right fa-5x iconStyle1 fas fa-file-code"></i>`{=html} -->
<!-- `<i class="fa-pull-right fa-5x iconStyle1 fas fa-code"></i>`{=html} -->
<!-- `<i class="fa-pull-right fa-5x iconStyle1 fas fa-external-link-alt"></i>`{=html} -->




