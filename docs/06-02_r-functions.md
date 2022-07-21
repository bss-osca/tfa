---
output: html_document
editor_options: 
  chunk_output_type: console
---



# Functions {#mod-r-functions}

> To understand computations in R, two slogans are helpful:
>
>    Everything that exists is an object.
>
>    Everything that happens is a function call.
>
>   John Chambers

Writing functions is a core activity of an R programmer. It represents the key step of the transition from a user to a programmer. Functions have inputs and outputs. Functions (and control structures) are what makes your code more dynamic.

Functions are often used to encapsulate a sequence of expressions that needs to be executed numerous times, perhaps under slightly different conditions. In programming, functional programming is a programming paradigm, a style of how code is written. Rather than repeating the code, functions and control structures allow one to build code in blocks. As a result, your code becomes more structured, more readable and much easier to maintain and debug (find errors).

We are all different and you may like different learning styles compared to others. In the learning path diagram, there may be links to alternative online content. Note this is an alternative to the standard learning path that you may use instead. The learning path may also have extra content, that is not a part of syllabus, you can have a look at. 


```{=html}
<div id="htmlwidget-55522757fb837c081ac7" style="width:100%;height:480px;" class="grViz html-widget"></div>
<script type="application/json" data-for="htmlwidget-55522757fb837c081ac7">{"x":{"diagram":"digraph {\n\ngraph [layout = \"neato\",\n       outputorder = \"edgesfirst\",\n       bgcolor = \"white\"]\n\nnode [fontname = \"Helvetica\",\n      fontsize = \"10\",\n      shape = \"circle\",\n      fixedsize = \"true\",\n      width = \"0.5\",\n      style = \"filled\",\n      fillcolor = \"aliceblue\",\n      color = \"gray70\",\n      fontcolor = \"gray50\"]\n\nedge [fontname = \"Helvetica\",\n     fontsize = \"8\",\n     len = \"1.5\",\n     color = \"gray80\",\n     arrowsize = \"0.5\"]\n\n  \"1\" [label = \"💡 Functions\", URL = \"#r-dc-functions\", tooltip = \"Functions\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"egg\", margin = \"0.2\", width = \"0.5\", fillcolor = \"DarkSeaGreen4\", pos = \"0,2!\"] \n  \"2\" [label = \"📖 Functions\\n(further)\", URL = \"#r-functions-extra\", tooltip = \"Functions returning multiple objects\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", width = \"0.5\", fillcolor = \"DarkSeaGreen4\", pos = \"2,2!\"] \n  \"3\" [label = \"📖 The ...\\nargument\", URL = \"#r-functions-arg\", tooltip = \"The `...` argument\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", width = \"0.5\", fillcolor = \"DarkSeaGreen4\", pos = \"4,2!\"] \n  \"4\" [label = \"📖 Documentation\", URL = \"#r-functions-doc\", tooltip = \"Documenting your functions\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", width = \"0.5\", fillcolor = \"DarkSeaGreen4\", pos = \"6,2!\"] \n  \"5\" [label = \"💻 Exercises\", URL = \"#ex-r-functions\", tooltip = \"Exercises\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"egg\", margin = \"0.2\", width = \"0.5\", fillcolor = \"DarkSeaGreen4\", pos = \"8,2!\"] \n  \"6\" [label = \"💡 Functions\\n(detailed)\", URL = \"https://app.datacamp.com/learn/courses/introduction-to-writing-functions-in-r\", tooltip = \"A detailed interactive tutorial about functions.\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"egg\", margin = \"0.2\", width = \"0.5\", fillcolor = \"PeachPuff3\", pos = \"2,0.5!\"] \n  \"7\" [label = \"🎬 Functions\", URL = \"https://www.youtube.com/watch?v=ffPeac3BigM\", tooltip = \"Hefin Rhys has a video about writing functions with examples.\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", width = \"0.5\", fillcolor = \"DarkOrange4\", pos = \"0,4!\"] \n  \"8\" [label = \"📖 Functions\", URL = \"https://bookdown.org/rdpeng/rprogdatascience/functions.html\", tooltip = \"An introduction to functions given in Chapter 14 of the book by Peng (2018).\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", width = \"0.5\", fillcolor = \"DarkOrange4\", pos = \"2,4!\"] \n  \"9\" [label = \"📖 Functions (Part 1)\", URL = \"https://stat545.com/functions-part1.html\", tooltip = \"A detailed tutorial on functions is given in Chapters 18, 19 and 20 of Bryan (2017).\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", width = \"0.5\", fillcolor = \"PeachPuff3\", pos = \"0,0.5!\"] \n  \"10\" [label = \"📖 Functions (Part 2)\", URL = \"https://stat545.com/functions-part2.html\", tooltip = \"A detailed tutorial on functions is given in Chapters 18, 19 and 20 of Bryan (2017).\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", width = \"0.5\", fillcolor = \"PeachPuff3\", pos = \"0,-0.5!\"] \n  \"11\" [label = \"📖 Functions (Part 3)\", URL = \"https://stat545.com/functions-part3.html\", tooltip = \"A detailed tutorial on functions is given in Chapters 18, 19 and 20 of Bryan (2017).\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", width = \"0.5\", fillcolor = \"PeachPuff3\", pos = \"0,-1.5!\"] \n  \"12\" [label = \"\", URL = \"\", tooltip = \" \", style = \"filled\", fixedsize = \"true\", fontsize = \"9\", fontcolor = \"white\", penwidth = \"0.5\", fontname = \"Helvetica\", shape = \"rect\", height = \"1\", width = \"6\", fillcolor = \"#F0F8FF\", pos = \"5.9,3.91!\"] \n  \"13\" [label = \"Color:\", URL = \"\", tooltip = \" \", style = \"filled\", fixedsize = \"true\", fontsize = \"9\", fontcolor = \"black\", penwidth = \"0\", fontname = \"Helvetica\", shape = \"none\", height = \"0\", width = \"0.8\", fillcolor = \"#FFFFFE\", pos = \"3.27,4.25!\"] \n  \"14\" [label = \"mandatory\", URL = \"\", tooltip = \"Mandatory syllabus.\", style = \"filled\", fixedsize = \"true\", fontsize = \"9\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica\", shape = \"rect\", width = \"0.8\", fillcolor = \"DarkSeaGreen4\", pos = \"3.5,3.85!\"] \n  \"15\" [label = \"alternative\", URL = \"\", tooltip = \"Alternative syllabus if you prefer another learning style.\", style = \"filled\", fixedsize = \"true\", fontsize = \"9\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica\", shape = \"rect\", width = \"0.8\", fillcolor = \"DarkOrange4\", pos = \"4.5,3.85!\"] \n  \"16\" [label = \"extra\", URL = \"\", tooltip = \"Extra learning if you are interested (not part of syllabus).\", style = \"filled\", fixedsize = \"true\", fontsize = \"9\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica\", shape = \"rect\", width = \"0.8\", fillcolor = \"PeachPuff3\", pos = \"5.5,3.85!\"] \n  \"17\" [label = \"Shape:\", URL = \"\", tooltip = \" \", style = \"filled\", fixedsize = \"true\", fontsize = \"9\", fontcolor = \"black\", penwidth = \"0\", fontname = \"Helvetica\", shape = \"none\", height = \"0\", width = \"1\", fillcolor = \"#FFFFFE\", pos = \"6.7,4.25!\"] \n  \"18\" [label = \"non-interactive\", URL = \"\", tooltip = \"Non-interactive learning content (e.g. reading).\", style = \"filled\", fixedsize = \"true\", fontsize = \"9\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica\", shape = \"rect\", width = \"1\", fillcolor = \"Grey40\", pos = \"7,3.85!\"] \n  \"19\" [label = \"interactive\", URL = \"\", tooltip = \"Interactive learning content (tutorial, exercises etc.).\", style = \"filled\", fixedsize = \"true\", fontsize = \"9\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica\", shape = \"egg\", width = \"1\", fillcolor = \"Grey40\", pos = \"8.25,3.85!\"] \n\"1\"->\"2\" [color = \"black\", arrowhead = \"vee\"] \n\"1\"->\"7\" [color = \"black\", arrowhead = \"vee\"] \n\"1\"->\"8\" [color = \"black\", arrowhead = \"vee\"] \n\"1\"->\"9\" [color = \"black\", arrowhead = \"vee\"] \n\"2\"->\"3\" [color = \"black\", arrowhead = \"vee\"] \n\"2\"->\"6\" [color = \"black\", arrowhead = \"vee\"] \n\"3\"->\"4\" [color = \"black\", arrowhead = \"vee\"] \n\"4\"->\"5\" [color = \"black\", arrowhead = \"vee\"] \n\"9\"->\"10\" [color = \"black\", arrowhead = \"vee\"] \n\"10\"->\"11\" [color = \"black\", arrowhead = \"vee\"] \n}","config":{"engine":"dot","options":null}},"evals":[],"jsHooks":[]}</script>
```



<!-- We are all different and you may like different learning styles compared to others. You may prefer a different learning path than suggested. Here is a list of possible different learning paths that may be useful for you. Note these suggestions are not a part of syllabus! -->

<!-- * For a more detailed interactive tutorial about functions see the DataCamp course [Introduction to Writing Functions in R][datacamp-r-functions]. -->
<!-- * Hefin Rhys has a video about [Writing functions in R][video-functions] giving examples in RStudio. -->
<!-- * An introduction to functions is also given in [Chapter 14](https://bookdown.org/rdpeng/rprogdatascience/functions.html) of @rdpeng. -->
<!-- * A detailed tutorial on functions is given in Chapters [18][stat-545-functions-part1], [19][stat-545-functions-part2] and [20][stat-545-functions-part3] of @stat545. -->



## Learning outcomes {#lo-r-functions}

By the end of this module, you are expected to be able to:

* Call a function.
* Formulate a function with different input arguments.
* Describe why functions are important in R.
* Set defaults for input arguments. 
* Return values from functions.
* Explain how variable scope and precedence works.
* Document functions. 

The learning outcomes relate to the [overall learning goals](#lg-course) number 2, 3, 4 and 10 of the course.

<!-- SOLO increasing: identify · memorize · name · do simple procedure · collect data · -->
<!-- enumerate · describe · interpret · formulate · list · paraphrase · combine · do -->
<!-- algorithms · compare · contrast · explain causes · analyze · relate · derive · -->
<!-- evaluate · apply · argue · theorize · generalize · hypothesis · solve · reflect -->


## DataCamp course {#r-dc-functions}

An excellent introduction to functions is given in [Chapter 3][datacamp-r-intermediate-chap3] in the DataCamp course [Intermediate R][datacamp-r-intermediate]. Please complete the chapter before continuing. 


## Functions returning multiple objects {#r-functions-extra}

Functions in R only return a single object. However, note that the object may be a list. That is, if you want to return multiple arguments, store them in a list. A simple example:


```r
test <- function() {
  # the function does some stuff and calculate some results
  res1 <- 45
  res2 <- "Success"
  res3 <- c(4, 7, 9)
  res4 <- list(cost = 23, profit = 200)
  lst <- list(days = res1, run = res2, id = res3, money = res4)
  return(lst)
}
test()
#> $days
#> [1] 45
#> 
#> $run
#> [1] "Success"
#> 
#> $id
#> [1] 4 7 9
#> 
#> $money
#> $money$cost
#> [1] 23
#> 
#> $money$profit
#> [1] 200
```


## The `...` argument {#r-functions-arg}

The special argument `...` indicates a variable number of arguments and is usually used to pass arguments to nested functions used inside the function. Consider example:


```r
my_name <- function(first = "Lars", last = "Nielsen") {
  str_c(first, last, sep = " ")
}
my_name()
#> [1] "Lars Nielsen"

cite_text <- function(text, ...) {
  str_c(text, ', -', my_name(...))
}
cite_text("Learning by doing is the best way to learn how to program!")
#> [1] "Learning by doing is the best way to learn how to program!, -Lars Nielsen"
cite_text("Learning by doing is the best way to learn how to program!", last = "Relund")
#> [1] "Learning by doing is the best way to learn how to program!, -Lars Relund"
cite_text("To be or not to be", first = "Shakespeare", last = "")
#> [1] "To be or not to be, -Shakespeare "
```

Note in the first function run, we use the defaults in `my_name`. In the second run, we change the default last name and in the last run, we change both arguments.

If you need to retrieve/capture the content of the `...` argument, put it in a list:


```r
test <- function(...) {
  return(list(...))
}
test(x = 4, y = "hey", z = 1:5)
#> $x
#> [1] 4
#> 
#> $y
#> [1] "hey"
#> 
#> $z
#> [1] 1 2 3 4 5
```



## Documenting your functions {#r-functions-doc}

It is always a good idea to document your functions. This is in fact always done in functions of a package. For instance try `?mutate` and see the documentation in the **Help** tab.

Assume that you have written a function


```r
subtract <- function(x, y) {
  return(x-y)
}
```

In RStudio you can insert a [Roxygen](https://cran.r-project.org/web/packages/roxygen2/vignettes/roxygen2.html) documentation skeleton by having the cursor at the first line of the function and go to **Code > Insert Roxygen Skeleton** (Ctrl+Alt+Shift+R):


```r
#' Title
#'
#' @param x 
#' @param y 
#'
#' @return
#' @export
#'
#' @examples
subtract <- function(x, y) {
  return(x-y)
}
```

You now can modify your documentation to


```r
#' Subtract two vectors
#'
#' @param x First vector.
#' @param y Vector to be subtracted.
#'
#' @return The difference.
#' @export
#'
#' @examples
#' subtract(x = c(5,5), y = c(2,3))
subtract <- function(x, y) {
  return(x-y)
}
```

Note 

* Parameters/function arguments are documented using the `@param` tag.
* Return value is documented using the `@return` tag. 
* Under the `@examples` tag you can insert some examples. 
* Ignore the `@export` tag. This is used if you include your function in your own package. Package development is beyond the scope of this course. If you are interested, have a look at the book @r-pkgs. 

A list of further tags can be seen in the vignette [Rd (documentation) tags](https://roxygen2.r-lib.org/articles/rd.html).


## Recap {#rc-functions}

Writing functions is a core activity of an R programmer. It represents the key step of the transition from a user to a programmer. Functions have inputs and outputs. Functions (and control structures) are what makes your code more dynamic.

Functions are often used to encapsulate a sequence of expressions that need to be executed numerous times, perhaps under slightly different conditions. In programming, functional programming is a programming paradigm, a style of how code is written. Rather than repeating the code, functions and control structures allow one to build code in blocks. As a result, your code becomes more structured, more readable and much easier to maintain and debug (find errors).

Functions can be defined using the `function()` directive. 

The named arguments (input values) can have default values. Moreover, R passes arguments by value. That is, an R function cannot change the variable that you input to that function. 

A function can be called using its name and its arguments can be specified by name or by position in the argument list.

Functions always return the last expression evaluated in the function body or when you use the `return` flow control statement (good coding practice). 

Scoping refers to the rules R use to look up the value of variables. A function will first look inside the body of the function to identify all the variables. If all variables exist, no further search is required. Otherwise, R will look one level up to see if the variable exists. 

Functions can be assigned to R objects just like any other R object.

Document your functions using the Roxygen skeleton!

You may also have a look at the [slides for this module](https://bss-osca.github.io/tfa/slides/06-02_r-functions-slides.html).



## Exercises {#ex-r-functions}

Below you will find a set of exercises. Always have a look at the exercises before you meet in your study group and try to solve them yourself. Are you stuck, see the [help page](#help). Some of the solutions to each exercise can be seen by pressing the button at each question. Beware, you will not learn by giving up too early. Put some effort into finding a solution!

[Link to the project on RStudio Cloud for this module][r-cloud-mod14]. 

### Exercise (defining functions)

*Solve this exercise using a script file.*


<div class="modal fade bs-example-modal-lg" id="091UStmposqvicZ0J01W" tabindex="-1" role="dialog" aria-labelledby="091UStmposqvicZ0J01W-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="091UStmposqvicZ0J01W-title">Solution</h4></div><div class="modal-body">

```r
#' Computes the sum of the integers from 1 to n (inclusive).
#'
#' @param n Max value in the sum.
#'
#' @return Sum of the integers from 1 to n.
#'
#' @examples
#' sum_n(30)
sum_n <- function(n) {
  return(sum(1:n))
}
sum_n(5000)
#> [1] 12502500
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#091UStmposqvicZ0J01W">Solution</button>

<div class="modal fade bs-example-modal-lg" id="7f1ZBELbJf1gRUqZuH4f" tabindex="-1" role="dialog" aria-labelledby="7f1ZBELbJf1gRUqZuH4f-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="7f1ZBELbJf1gRUqZuH4f-title">Hint</h4></div><div class="modal-body">

```r
#' Computes the sum of the integers from 1 to n (inclusive).
#'
#' @param n Max value in the sum.
#'
#' @return Sum of the integers from 1 to n.
#'
#' @examples
#' sum_n(30)
sum_n <- function(n) {
  return(___)
}
sum_n(5000)
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#7f1ZBELbJf1gRUqZuH4f">Hint</button>

1) Create a function `sum_n` that for any given value, say $n$, computes the sum of the integers from 1 to n (inclusive). Use the function to determine the sum of integers from 1 to 5000. Document your function too.



<div class="modal fade bs-example-modal-lg" id="PQi3abyGyW6C3vg4O5FL" tabindex="-1" role="dialog" aria-labelledby="PQi3abyGyW6C3vg4O5FL-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="PQi3abyGyW6C3vg4O5FL-title">Solution</h4></div><div class="modal-body">

```r
#' Computes the sum S_n = 1^2 + 2^2 + 3^2 + ... + n^2
#'
#' @param n Max input in sum.
#'
#' @return S_n
compute_s_n <- function(n) {
  return(sum((1:n)^2))
}
compute_s_n(10)
#> [1] 385
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#PQi3abyGyW6C3vg4O5FL">Solution</button>

2) Write a function `compute_s_n` that for any given $n$ computes the sum $S_n = 1^2 + 2^2 + 3^2 + \dots + n^2$. Report the value of the sum when $n=10$.



<div class="modal fade bs-example-modal-lg" id="ryUOMqNIkU9tPhnPMU8N" tabindex="-1" role="dialog" aria-labelledby="ryUOMqNIkU9tPhnPMU8N-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="ryUOMqNIkU9tPhnPMU8N-title">Solution 1</h4></div><div class="modal-body">

```r
s_n <- vector('numeric', 25)
for (n in 1:25) {
  s_n[n] <- compute_s_n(n)
}
s_n
#>  [1]    1    5   14   30   55   91  140  204  285  385  506  650  819 1015 1240 1496 1785 2109 2470
#> [20] 2870 3311 3795 4324 4900 5525
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#ryUOMqNIkU9tPhnPMU8N">Solution 1</button>

<div class="modal fade bs-example-modal-lg" id="zv8WrvMLC4LPC83ivCIj" tabindex="-1" role="dialog" aria-labelledby="zv8WrvMLC4LPC83ivCIj-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="zv8WrvMLC4LPC83ivCIj-title">Hint 1</h4></div><div class="modal-body">

```r
s_n <- vector('numeric', 25)
for (n in 1:25) {
  s_n[n] <- ___
}
s_n
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#zv8WrvMLC4LPC83ivCIj">Hint 1</button>

<div class="modal fade bs-example-modal-lg" id="Hi7rOq8Wmv4dDyLHdTAG" tabindex="-1" role="dialog" aria-labelledby="Hi7rOq8Wmv4dDyLHdTAG-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="Hi7rOq8Wmv4dDyLHdTAG-title">Solution 2</h4></div><div class="modal-body">

```r
compute_s_n_alt <- function(n) {
  return(n*(n+1)*(2*n+1)/6)
}
for (n in 1:25) {
  if (s_n[n] != compute_s_n_alt(n)) {
    cat('Error!')
    break
  }
}
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#Hi7rOq8Wmv4dDyLHdTAG">Solution 2</button>

<div class="modal fade bs-example-modal-lg" id="9Y5XHfPnQ5gOFwTZ1S2e" tabindex="-1" role="dialog" aria-labelledby="9Y5XHfPnQ5gOFwTZ1S2e-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="9Y5XHfPnQ5gOFwTZ1S2e-title">Hint 2</h4></div><div class="modal-body">

```r
compute_s_n_alt <- function(n) {
  return(n*(n+1)*___)
}
for (n in 1:25) {
  if (s_n[n] != ___) {
    cat('Error!')
    break
  }
}
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#9Y5XHfPnQ5gOFwTZ1S2e">Hint 2</button>

3) Define an empty numerical vector `s_n` of size 25 using `s_n <- vector("numeric", 25)` and store in the results of $S_1, S_2, \dots S_{25}$ using a for-loop. 
   Confirm that the formula for the sum is $S_n= n(n+1)(2n+1)/6$ for $n = 1, \ldots, 25$.






<div class="modal fade bs-example-modal-lg" id="IzfTxl165k9IVrJ6r7jG" tabindex="-1" role="dialog" aria-labelledby="IzfTxl165k9IVrJ6r7jG-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="IzfTxl165k9IVrJ6r7jG-title">Solution</h4></div><div class="modal-body">

```r
biggest <- function(a, b) {
  if (a > b) return(1)
  return(0)
}
biggest(3,4)
#> [1] 0
biggest(3,3)
#> [1] 0
biggest(8,2)
#> [1] 1
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#IzfTxl165k9IVrJ6r7jG">Solution</button>

<div class="modal fade bs-example-modal-lg" id="D8uFagQ44n0F3DVFpqks" tabindex="-1" role="dialog" aria-labelledby="D8uFagQ44n0F3DVFpqks-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="D8uFagQ44n0F3DVFpqks-title">Hint</h4></div><div class="modal-body">

```r
biggest <- function(a, b) {
  if (a > b) ___
  return(0)
}
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#D8uFagQ44n0F3DVFpqks">Hint</button>

4) Write a function `biggest` which takes two integers as arguments.  Let the 
function  return  1  if  the  first argument  is  larger  than  the second and return  0 
otherwise. 



<div class="modal fade bs-example-modal-lg" id="4z5AS1NS2xR23XYICFfJ" tabindex="-1" role="dialog" aria-labelledby="4z5AS1NS2xR23XYICFfJ-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="4z5AS1NS2xR23XYICFfJ-title">Solution</h4></div><div class="modal-body">

```r
shipping_cost <- function(total) {
  return(0.1 * total)
}
shipping_cost(450)
#> [1] 45
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#4z5AS1NS2xR23XYICFfJ">Solution</button>

<div class="modal fade bs-example-modal-lg" id="9XYI8k4ya9c5wAxptAtg" tabindex="-1" role="dialog" aria-labelledby="9XYI8k4ya9c5wAxptAtg-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="9XYI8k4ya9c5wAxptAtg-title">Hint</h4></div><div class="modal-body">

```r
shipping_cost <- function(total) {
  return(___)
}
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#9XYI8k4ya9c5wAxptAtg">Hint</button>

5) Write a function that returns the shipping cost as 10% of the total cost of an 
order (input argument).   




<div class="modal fade bs-example-modal-lg" id="3tjlZX1xyKWX8p2HdY0R" tabindex="-1" role="dialog" aria-labelledby="3tjlZX1xyKWX8p2HdY0R-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="3tjlZX1xyKWX8p2HdY0R-title">Solution</h4></div><div class="modal-body">

```r
shipping_cost <- function(total, pct = 0.1) {
  return(pct * total)
}
shipping_cost(450)
#> [1] 45
shipping_cost(450, pct = 0.2)
#> [1] 90
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#3tjlZX1xyKWX8p2HdY0R">Solution</button>

<div class="modal fade bs-example-modal-lg" id="wVByR9RrCdbahlZcrTma" tabindex="-1" role="dialog" aria-labelledby="wVByR9RrCdbahlZcrTma-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="wVByR9RrCdbahlZcrTma-title">Hint</h4></div><div class="modal-body">

```r
shipping_cost <- function(total, pct = ___) {
  ___
}
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#wVByR9RrCdbahlZcrTma">Hint</button>

6) Given Question 5, rewrite the function so the percentage is an input argument with a default of 10%. 



<div class="modal fade bs-example-modal-lg" id="uIATmVhBoTFfTD3dKgI9" tabindex="-1" role="dialog" aria-labelledby="uIATmVhBoTFfTD3dKgI9-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="uIATmVhBoTFfTD3dKgI9-title">Solution</h4></div><div class="modal-body">

```r
shipping_cost <- function(total) {
  return(0.1 * total)
}

gasoline_cost <- function(total) {
  return(shipping_cost(total) * 0.5)
}
gasoline_cost(450)
#> [1] 22.5
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#uIATmVhBoTFfTD3dKgI9">Solution</button>

<div class="modal fade bs-example-modal-lg" id="yXEqymsqMJzDMyMMnHhQ" tabindex="-1" role="dialog" aria-labelledby="yXEqymsqMJzDMyMMnHhQ-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="yXEqymsqMJzDMyMMnHhQ-title">Hint</h4></div><div class="modal-body">

```r
gasoline_cost <- function(total) {
  return(shipping_cost(___) * ___)
}
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#yXEqymsqMJzDMyMMnHhQ">Hint</button>

7) Given Question 5, the shipping cost can be split into parts. One part is gasoline which is 50% of the shipping cost. Write a function that has total cost as input argument and calculate the gasoline cost and use the function defined in Question 5 inside it.   
  
  
  

<div class="modal fade bs-example-modal-lg" id="2YME853hnJrc9TSnrtei" tabindex="-1" role="dialog" aria-labelledby="2YME853hnJrc9TSnrtei-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="2YME853hnJrc9TSnrtei-title">Solution</h4></div><div class="modal-body">

```r
shipping_cost <- function(total, pct = 0.1) {
  return(pct * total)
}

gasoline_cost <- function(total, ...) {
  return(shipping_cost(total, ...) * 0.5)
}
gasoline_cost(450)
#> [1] 22.5
gasoline_cost(450, pct = 0.2)
#> [1] 45
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#2YME853hnJrc9TSnrtei">Solution</button>

<div class="modal fade bs-example-modal-lg" id="k1SvK9UGNVC44jRJ4vm8" tabindex="-1" role="dialog" aria-labelledby="k1SvK9UGNVC44jRJ4vm8-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="k1SvK9UGNVC44jRJ4vm8-title">Hint</h4></div><div class="modal-body">

```r
gasoline_cost <- function(total, ...) {
  return(shipping_cost(___) * ___)
}
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#k1SvK9UGNVC44jRJ4vm8">Hint</button>

8) Given Question 6, the shipping cost can be split into parts. One part is gasoline which is 50% of the shipping cost. Write a function that has total cost a input argument and calculate the gasoline cost and use the function defined in Question 6 inside it. Hint: Use the `...` argument to pass arguments to `shipping_cost`.




<div class="modal fade bs-example-modal-lg" id="wyqbPZmhgH5IWZ4NN7Av" tabindex="-1" role="dialog" aria-labelledby="wyqbPZmhgH5IWZ4NN7Av-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="wyqbPZmhgH5IWZ4NN7Av-title">Solution</h4></div><div class="modal-body">

```r
shipping_cost <- function(total, pct = 0.1) {
  return(pct * total)
}

gasoline_cost <- function(total, ...) {
  return(shipping_cost(total, ...) * 0.5)
}

costs <- function(total, ...) {
  lst <- list(total = total, shipping = shipping_cost(total, ...), gasoline = gasoline_cost(total, ...))
  return(lst)
}
costs(450)
#> $total
#> [1] 450
#> 
#> $shipping
#> [1] 45
#> 
#> $gasoline
#> [1] 22.5
costs(450, pct = 0.15)
#> $total
#> [1] 450
#> 
#> $shipping
#> [1] 67.5
#> 
#> $gasoline
#> [1] 33.8
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#wyqbPZmhgH5IWZ4NN7Av">Solution</button>

<div class="modal fade bs-example-modal-lg" id="CtJTEDH998cJJncVuazi" tabindex="-1" role="dialog" aria-labelledby="CtJTEDH998cJJncVuazi-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="CtJTEDH998cJJncVuazi-title">Hint</h4></div><div class="modal-body">

```r
shipping_cost <- function(total, pct = 0.1) {
  return(pct * total)
}

gasoline_cost <- function(total, ...) {
  return(shipping_cost(total, ...) * 0.5)
}

costs <- function(total, ...) {
  lst <- list(total = ___, shipping = ___, gasoline = ___)
  return(lst)
}
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#CtJTEDH998cJJncVuazi">Hint</button>

9) Given Question 8, write a function `costs` that, given total cost, returns the total cost, shipping cost and gasoline cost.

  
  
  
### Exercise (scope)


<div class="modal fade bs-example-modal-lg" id="9MD60AqQgn1ixRMHTDy0" tabindex="-1" role="dialog" aria-labelledby="9MD60AqQgn1ixRMHTDy0-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="9MD60AqQgn1ixRMHTDy0-title">Solution</h4></div><div class="modal-body">

<p>That value is still 3 since <code>x</code> defined inside the function is a local variable.</p>

</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#9MD60AqQgn1ixRMHTDy0">Solution</button>

1) After running the code below, what is the value of variable `x`?


```r
x <- 3
my_func <- function(y){
  x <- 5
  return(y + 5)
}
my_func(7)
```


<div class="modal fade bs-example-modal-lg" id="hSBDdTQBCCs7F6iS6X3W" tabindex="-1" role="dialog" aria-labelledby="hSBDdTQBCCs7F6iS6X3W-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="hSBDdTQBCCs7F6iS6X3W-title">Solution</h4></div><div class="modal-body">

<p>The code runs. But it is not good coding practice to call global variables inside a function (<code>x</code>). Instead <code>x</code> should have been an argument to the function.</p>

</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#hSBDdTQBCCs7F6iS6X3W">Solution</button>

2) Is there any problems with the following code?


```r
x <- 3
my_func <- function(y){
  return(y + x) 
}
my_func(7)
```


<div class="modal fade bs-example-modal-lg" id="lOIfHexXkQhZLGyYTGnE" tabindex="-1" role="dialog" aria-labelledby="lOIfHexXkQhZLGyYTGnE-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="lOIfHexXkQhZLGyYTGnE-title">Solution</h4></div><div class="modal-body">

<p>That value is still 3 since <code>my_func</code> has not been called yet.</p>

</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#lOIfHexXkQhZLGyYTGnE">Solution</button>

3) Have a look at the documentation for operator `<<-` (run `?'<<-'`). After running the code below, what is the value of variable `x`?


```r
x <- 3
my_func <- function(y){
  x <- 4
  x <<- 5
  return(y + 5)
}
```


<div class="modal fade bs-example-modal-lg" id="j2xnk5ZOiTMLAL5KuNvG" tabindex="-1" role="dialog" aria-labelledby="j2xnk5ZOiTMLAL5KuNvG-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="j2xnk5ZOiTMLAL5KuNvG-title">Solution</h4></div><div class="modal-body">

<p>That value of <code>x</code> is 5 since <code>&lt;&lt;-</code> is used to look at the parent environment. The function call returns 11 since the <code>x</code> used is the local variable. In general avoid using <code>&lt;&lt;-</code> and give local variables different names compared to global ones.</p>

</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#j2xnk5ZOiTMLAL5KuNvG">Solution</button>

4) After running the code below, what is the value of variable `x` and output of the function call?


```r
x <- 3
my_func <- function(y){
  x <- 4
  x <<- 5
  return(y + x)
}
my_func(7)
```


### Exercise (job sequencing)

*Solve this exercise using a script file.*

This exercise is based on Exercise 6.12 in @vba-book. 

Consider a problem of determining the best sequencing of jobs on a machine. A set of startup costs are given for 5 machines:


```r
startup_costs <- c(27, 28, 32, 35, 26)
startup_costs
#> [1] 27 28 32 35 26
```

Moreover, when changing from one job to another job, the setup costs are given as:


```r
setup_costs <- matrix(c(
  NA, 35, 22, 44, 12,
  49, NA, 46, 38, 17,
  46, 12, NA, 29, 41,
  23, 37, 31, NA, 26,
  17, 23, 28, 34, NA), 
  byrow = T, nrow = 5)
setup_costs
#>      [,1] [,2] [,3] [,4] [,5]
#> [1,]   NA   35   22   44   12
#> [2,]   49   NA   46   38   17
#> [3,]   46   12   NA   29   41
#> [4,]   23   37   31   NA   26
#> [5,]   17   23   28   34   NA
```

The goal of the problem is to determine a sequence of jobs which minimizes the total setup cost including the startup cost.

One possible way to find a sequence is the use a greedy strategy:

```
Greedy Algorithm
Step 0: Start with the job which has minimal startup cost.
Step 1: Select the next job as the job not already done 
        with minimal setup cost given current job. 
Step 2: Set next job in Step 1 to current job and 
        go to Step 1 if not all jobs are done.
```

In R the greedy algorithm can be implemented as:


```r
greedy <- function(startup, setup) {
  jobs <- nrow(setup)
  cur_job <- which.min(startup)
  cost <- startup[cur_job]
  # cat("Start job:", cur_job, "\n")
  job_seq <- cur_job
  setup[, cur_job] <- NA
  for (i in 1:(jobs-1)) {
    next_job <- which.min(setup[cur_job, ])
    # cat("Next job:", next_job, "\n") 
    cost <- cost + setup[cur_job, next_job]
    job_seq <- c(job_seq, next_job)
    cur_job <- next_job
    setup[, cur_job] <- NA
  }
  # print(setup)
  return(list(seq = job_seq, cost = cost))
}
greedy(startup_costs, setup_costs)
#> $seq
#> [1] 5 1 3 2 4
#> 
#> $cost
#> [1] 115
```

First, the job with minimum startup cost is found using function `which.min` and we define cost as the startup cost. We use `cat` to make some debugging statements and initialize `job_seq` with the first job. Next, we have to find a way of ignoring jobs already done. We do that here by setting the columns of setup cost equal to NA for jobs already done. Hence, they will not be selected by `which.min`. The `for` loop runs 4 times and selects jobs and accumulate the total cost.

A well-known better strategy is to:

```
Better Algorithm
Step 0: Subtract minimum of startup and setup cost for each job from setup and 
        startup costs (that is columnwise)
Step 1: Call the greedy algorithm with the modified costs. Note that the total 
        cost returned has to be modified a bit.
```


<div class="modal fade bs-example-modal-lg" id="cDMSjn4vFdjfhGseIGtX" tabindex="-1" role="dialog" aria-labelledby="cDMSjn4vFdjfhGseIGtX-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="cDMSjn4vFdjfhGseIGtX-title">Solution</h4></div><div class="modal-body">

```r
better <- function(startup, setup) {
  jobs <- nrow(setup)
  min_col_val <- apply(rbind(startup, setup), 2, min, na.rm = T)
  startup <- startup - min_col_val
  min_mat <- matrix(rep(min_col_val, jobs), 
                    ncol = jobs, byrow = T)
  setup <- setup - min_mat
  lst <- greedy(startup, setup)
  lst$cost <- lst$cost + sum(min_col_val)
  return(lst)
}
better(startup_costs, setup_costs)
#> $seq
#> [1] 4 1 3 2 5
#> 
#> $cost
#> [1] 109
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#cDMSjn4vFdjfhGseIGtX">Solution</button>

<div class="modal fade bs-example-modal-lg" id="HI6WqDC2nrMjDGs1d6s3" tabindex="-1" role="dialog" aria-labelledby="HI6WqDC2nrMjDGs1d6s3-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="HI6WqDC2nrMjDGs1d6s3-title">Hint 2</h4></div><div class="modal-body">

```r
better <- function(startup, setup) {
  jobs <- nrow(setup)
  min_col_val <- apply(rbind(startup, setup), 2, min, na.rm = T)
  startup <- startup - min_col_val
  min_mat <- matrix(rep(min_col_val, jobs), 
                    ncol = jobs, byrow = T)
  setup <- setup - ___
  lst <- greedy(startup, setup)
  lst$cost <- lst$cost + sum(___)
  return(lst)
}
better(startup_costs, setup_costs)
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#HI6WqDC2nrMjDGs1d6s3">Hint 2</button>

<div class="modal fade bs-example-modal-lg" id="GX7E0ii5j44Lc0fR10gS" tabindex="-1" role="dialog" aria-labelledby="GX7E0ii5j44Lc0fR10gS-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="GX7E0ii5j44Lc0fR10gS-title">Hint 1</h4></div><div class="modal-body">

```r
better <- function(startup, setup) {
  jobs <- nrow(setup)
  min_col_val <- apply(___)
  startup <- startup - ___
  min_mat <- matrix(rep(min_col_val, jobs), 
                    ncol = ___, byrow = T)
  setup <- setup - ___
  lst <- greedy(___, ___)
  lst$cost <- lst$cost + ___
  return(lst)
}
better(startup_costs, setup_costs)
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#GX7E0ii5j44Lc0fR10gS">Hint 1</button>

Implement a `better` function calculating a better strategy. Hint: to find the minimum column costs, you may use `apply(rbind(startup, setup), 2, min, na.rm = T)`.



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


