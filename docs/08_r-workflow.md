---
output: html_document
editor_options: 
  chunk_output_type: console
---


# R basics and workflows {#mod-r-workflow}

This module contains an introduction to using R, the syntax, data types etc. Coding in R is, as VBA, best learnt by trying it out and learn by trial and error. Hence the modules often contains links to interactive tutorials.

We are all different and you may like different learning styles compared to others. In the learning path diagram, there may be links to alternative online content. Note this is an alternative to the standard learning path that you may use instead. The learning path may also have extra content, that is not a part of syllabus, you can have a look at. 


```{=html}
<div id="htmlwidget-c160c378b547def1341c" style="width:100%;height:480px;" class="grViz html-widget"></div>
<script type="application/json" data-for="htmlwidget-c160c378b547def1341c">{"x":{"diagram":"digraph {\n\ngraph [layout = \"neato\",\n       outputorder = \"edgesfirst\",\n       bgcolor = \"white\"]\n\nnode [fontname = \"Helvetica\",\n      fontsize = \"10\",\n      shape = \"circle\",\n      fixedsize = \"true\",\n      width = \"0.5\",\n      style = \"filled\",\n      fillcolor = \"aliceblue\",\n      color = \"gray70\",\n      fontcolor = \"gray50\"]\n\nedge [fontname = \"Helvetica\",\n     fontsize = \"8\",\n     len = \"1.5\",\n     color = \"gray80\",\n     arrowsize = \"0.5\"]\n\n  \"1\" [label = \"📖 Command line\\noperatons\", URL = \"#working-with-r-at-the-command-line-in-rstudio\", tooltip = \"Command line operatons\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", width = \"0.5\", fillcolor = \"DarkSeaGreen4\", pos = \"0,2!\"] \n  \"2\" [label = \"💡 Intro to R\", URL = \"#your-first-datacamp-course\", tooltip = \"Datacamp tutorial\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"egg\", margin = \"0.2\", width = \"0.5\", fillcolor = \"DarkSeaGreen4\", pos = \"2,2!\"] \n  \"3\" [label = \"📖 Pipes\", URL = \"#pipes\", tooltip = \"Pipes\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", width = \"0.5\", fillcolor = \"DarkSeaGreen4\", pos = \"4,2!\"] \n  \"4\" [label = \"📖 RStudio\\nProjects\", URL = \"#rprojs\", tooltip = \"RStudio\\nProjects\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", width = \"0.5\", fillcolor = \"DarkSeaGreen4\", pos = \"5.5,2!\"] \n  \"5\" [label = \"📖 Global\\nOptions\", URL = \"#global-options\", tooltip = \"Global\\nOptions\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", width = \"0.5\", fillcolor = \"DarkSeaGreen4\", pos = \"7,2!\"] \n  \"6\" [label = \"📖 Working Dir\", URL = \"#working-directory\", tooltip = \"Working Dir\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", width = \"0.5\", fillcolor = \"DarkSeaGreen4\", pos = \"8.5,2!\"] \n  \"7\" [label = \"🎬 Intro to R (I)\", URL = \"https://www.youtube.com/watch?v=vGY5i_J2c-c&ab_channel=RogerPeng\", tooltip = \"Introduction by Roger Peng on YouTube about data types and basic operations.\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", width = \"0.5\", fillcolor = \"DarkOrange4\", pos = \"1,3!\"] \n  \"8\" [label = \"🎬 Intro to R (II)\", URL = \"https://www.youtube.com/watch?v=w8_XdYI3reU&ab_channel=RogerPeng\", tooltip = \"Introduction by Roger Peng on YouTube about data types (vectors, matrices and lists).\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", width = \"0.5\", fillcolor = \"DarkOrange4\", pos = \"1,4!\"] \n  \"9\" [label = \"🎬 Intro to R (III)\", URL = \"https://www.youtube.com/watch?v=NuY6jY4qE7I&ab_channel=RogerPeng\", tooltip = \"Introduction by Roger Peng on YouTube about data types (factors, missing values and data frames).\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", width = \"0.5\", fillcolor = \"DarkOrange4\", pos = \"1,5!\"] \n  \"10\" [label = \"💻 Exercises\", URL = \"#ex-r-basics\", tooltip = \"\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"egg\", margin = \"0.2\", width = \"0.5\", fillcolor = \"DarkSeaGreen4\", pos = \"10.5,2!\"] \n  \"11\" [label = \"📖 Intro to R\", URL = \"https://bookdown.org/rdpeng/rprogdatascience/r-nuts-and-bolts.html\", tooltip = \"An introduction to R is given in Chapter 4 of Peng (2018).\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", width = \"0.5\", fillcolor = \"DarkOrange4\", pos = \"3,3!\"] \n  \"12\" [label = \"📖 Subsetting\", URL = \"https://bookdown.org/rdpeng/rprogdatascience/subsetting-r-objects.html\", tooltip = \"A detailed tutorial given in Chapter 9 of Peng (2018).\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", width = \"0.5\", fillcolor = \"PeachPuff3\", pos = \"1.5,1!\"] \n  \"13\" [label = \"📖 Factors\", URL = \"https://r4ds.had.co.nz/factors.html\", tooltip = \"A longer tutorial given in Chapter 15 of H. Wickham (2017).\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", width = \"0.5\", fillcolor = \"PeachPuff3\", pos = \"2.75,1!\"] \n  \"14\" [label = \"📖 Pipes\", URL = \"https://r4ds.had.co.nz/pipes.html\", tooltip = \"A detailed introduction to pipes in Chapter 18 in H. Wickham (2017).\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", width = \"0.5\", fillcolor = \"PeachPuff3\", pos = \"4,1!\"] \n  \"15\" [label = \"💡 String\\nManipulation\", URL = \"https://learn.datacamp.com/courses/string-manipulation-with-stringr-in-r\", tooltip = \"DataCamp - String Manipulation with stringr in R.\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"egg\", margin = \"0.2\", width = \"0.5\", fillcolor = \"PeachPuff3\", pos = \"10.5,0.75!\"] \n  \"16\" [label = \"📖 Coding\\nConvention\", URL = \"https://discdown.org/rprogramming/style-guide.html\", tooltip = \"An introduction to good coding conventions (Chapter 16 of Stauffer, Simon, and Zeileis, 2020).\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", width = \"0.5\", fillcolor = \"PeachPuff3\", pos = \"0,1!\"] \n  \"17\" [label = \"\", URL = \"\", tooltip = \" \", style = \"filled\", fixedsize = \"true\", fontsize = \"9\", fontcolor = \"white\", penwidth = \"0.5\", fontname = \"Helvetica\", shape = \"rect\", height = \"1\", width = \"6\", fillcolor = \"#F0F8FF\", pos = \"7.4,4.81!\"] \n  \"18\" [label = \"Color:\", URL = \"\", tooltip = \" \", style = \"filled\", fixedsize = \"true\", fontsize = \"9\", fontcolor = \"black\", penwidth = \"0\", fontname = \"Helvetica\", shape = \"none\", height = \"0\", width = \"0.8\", fillcolor = \"#FFFFFE\", pos = \"4.77,5.15!\"] \n  \"19\" [label = \"mandatory\", URL = \"\", tooltip = \"Mandatory syllabus.\", style = \"filled\", fixedsize = \"true\", fontsize = \"9\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica\", shape = \"rect\", width = \"0.8\", fillcolor = \"DarkSeaGreen4\", pos = \"5,4.75!\"] \n  \"20\" [label = \"alternative\", URL = \"\", tooltip = \"Alternative syllabus if you prefer another learning style.\", style = \"filled\", fixedsize = \"true\", fontsize = \"9\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica\", shape = \"rect\", width = \"0.8\", fillcolor = \"DarkOrange4\", pos = \"6,4.75!\"] \n  \"21\" [label = \"extra\", URL = \"\", tooltip = \"Extra learning if you are interested (not part of syllabus).\", style = \"filled\", fixedsize = \"true\", fontsize = \"9\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica\", shape = \"rect\", width = \"0.8\", fillcolor = \"PeachPuff3\", pos = \"7,4.75!\"] \n  \"22\" [label = \"Shape:\", URL = \"\", tooltip = \" \", style = \"filled\", fixedsize = \"true\", fontsize = \"9\", fontcolor = \"black\", penwidth = \"0\", fontname = \"Helvetica\", shape = \"none\", height = \"0\", width = \"1\", fillcolor = \"#FFFFFE\", pos = \"8.2,5.15!\"] \n  \"23\" [label = \"non-interactive\", URL = \"\", tooltip = \"Non-interactive learning content (e.g. reading).\", style = \"filled\", fixedsize = \"true\", fontsize = \"9\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica\", shape = \"rect\", width = \"1\", fillcolor = \"Grey40\", pos = \"8.5,4.75!\"] \n  \"24\" [label = \"interactive\", URL = \"\", tooltip = \"Interactive learning content (tutorial, exercises etc.).\", style = \"filled\", fixedsize = \"true\", fontsize = \"9\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica\", shape = \"egg\", width = \"1\", fillcolor = \"Grey40\", pos = \"9.75,4.75!\"] \n\"1\"->\"2\" [color = \"black\", arrowhead = \"vee\"] \n\"1\"->\"16\" [color = \"black\", arrowhead = \"vee\"] \n\"2\"->\"11\" [color = \"black\", arrowhead = \"vee\"] \n\"2\"->\"7\" [color = \"black\", arrowhead = \"vee\"] \n\"2\"->\"3\" [color = \"black\", arrowhead = \"vee\"] \n\"2\"->\"12\" [color = \"black\", arrowhead = \"vee\"] \n\"2\"->\"13\" [color = \"black\", arrowhead = \"vee\"] \n\"3\"->\"4\" [color = \"black\", arrowhead = \"vee\"] \n\"3\"->\"14\" [color = \"black\", arrowhead = \"vee\"] \n\"4\"->\"5\" [color = \"black\", arrowhead = \"vee\"] \n\"5\"->\"6\" [color = \"black\", arrowhead = \"vee\"] \n\"6\"->\"10\" [color = \"black\", arrowhead = \"vee\"] \n\"7\"->\"8\" [color = \"black\", arrowhead = \"vee\"] \n\"8\"->\"9\" [color = \"black\", arrowhead = \"vee\"] \n\"10\"->\"15\" [color = \"black\", arrowhead = \"vee\"] \n}","config":{"engine":"dot","options":null}},"evals":[],"jsHooks":[]}</script>
```

<!-- ## Different learning paths {#lp-r-workflow} -->

<!-- We are all different and you may like different learning styles compared to others. You may prefer a different learning path than suggested. Here is a list of possible different learning paths that may be useful for you. Note these suggestions are not a part of syllabus! -->

<!-- * Roger Peng has a lot of [videos](https://www.youtube.com/playlist?list=PLjTlxb-wKvXPqyY3FZDO8GqIaWuEDy-Od) on YouTube about R. Of special interest are -->

<!--    - An introduction to the R language ([Part 1][video-r-intro-p1], [Part 2][video-r-intro-p2], [Part 3][video-r-intro-p3]) including data types and basic operations. -->
<!--    - [An introduction to subsetting in R][video-subsetting]. -->
<!--    - [A detailed description af data types][video-datatypes]. -->

<!-- * An introduction to R is given in [Chapter 4](https://bookdown.org/rdpeng/rprogdatascience/r-nuts-and-bolts.html) of @rdpeng. -->
<!-- * A detailed tutorial on subsetting is given in [Chapter 9](https://bookdown.org/rdpeng/rprogdatascience/subsetting-r-objects.html) of @rdpeng. -->
<!-- * A longer tutorial to factors is given in [Chapter 15][r4ds-factors] of @r4ds. -->
<!-- * For a more detailed introduction to pipes see [Chapter 18][r4ds-pipes] in @r4ds. -->
<!-- * For a detailed introduction to strings (see exercise below) check out the DataCamp course [String Manipulation with stringr in R][datacamp-r-strings]. -->
<!-- * An introduction to good coding conventions in given in [Chapter 16](https://eeecon.uibk.ac.at/~discdown/rprogramming/style-guide.html) of @discdown. -->


## Learning outcomes {#lo-r-workflow}

By the end of this module, you are expected to have:

* Tried R and RStudio.
* Learned how the RStudio IDE works.
* Finished your first course on DataCamp.
* Solved your first exercises.

The learning outcomes relate to the [overall learning goals](#lg-course) number 2, 5, 6, 8, 11, 13 and 15 of the course.


## Working with R at the command line in RStudio 

R is a programming language and free software environment. The R language is widely used among statisticians and data miners for data analysis. To run R you need to install it on your laptop or use a cloud version. We will use R via RStudio. First time users often confuse the two. At its simplest, R is like a car's engine while RStudio is like a car's dashboard as illustrated in Figure \@ref(fig:R-vs-RStudio-1).

<div class="figure" style="text-align: center">
<img src="img/R_vs_RStudio_1.png" alt="Analogy of difference between R and RStudio." width="95%" />
<p class="caption">(\#fig:R-vs-RStudio-1)Analogy of difference between R and RStudio.</p>
</div>

More precisely, R is a programming language that runs computations, while RStudio is an *integrated development environment (IDE)* that provides an interface by adding many convenient features and tools. So just as the way of having access to a speedometer, rearview mirrors, and a navigation system makes driving much easier, using RStudio's interface makes using R much easier as well. RStudio can be accessed using both your laptop version or [RStudio Cloud][rstudio-cloud]. We will assume that you are using R via [RStudio Cloud][rstudio-cloud] if not stated otherwise.

Compared to Excel, the benefit of using Excel is that the initial learning curve is quite minimal, and most analysis can be done via point-and-click on the top panel. Once a user imports their data into the program, it's not exceedingly hard to make basic graphs and charts. R is a programming language, however, meaning the initial learning curve is steeper. It will take you some time to become familiar with the interface and master the various functions. Luckily, using R can quickly become second-nature with practice. For a detailed comparison you may see [Excel vs R: A Brief Introduction to R][excel-vs-r] by Jesse Sadler.

Compared to VBA, R is an [interpreted language][wiki-interpreted]; users typically access it through a command-line or script file. To run VBA you need to compile and execute it.   

<!-- Recall our car analogy from earlier. As we do not drive a car by interacting directly with the engine but rather by interacting with elements on the car's dashboard, we will not be using R directly but rather we will use RStudio's interface. After you install R and RStudio on your laptop, you will have two new *programs* (also called *applications*) you can open. We will always work in RStudio on your laptop or in RStudio Cloud (except when you do online tutorials) and not in the R application. Figure \@ref(fig:R-vs-RStudio-2) shows what icon you should be clicking on your laptop.  -->


<!-- ```{r R-vs-RStudio-2, echo=FALSE, fig.align="center", fig.cap="Icons of R versus RStudio on your laptop.", out.width="90%", purl=FALSE} -->
<!-- knitr::include_graphics("img/R_vs_RStudio.png") -->
<!-- ``` -->

Launch [RStudio][r-cloud-mod12] (follow this link to get to the correct project). An personal copy of the _01-module-12_ project is now created for you. Consider the panes:

* Console (left)
* Environment/History (tabbed in upper right)
* Files/Plots/Packages/Help (tabbed in lower right)

FYI: you can change the default location of the panes, among many other things: [Customizing RStudio][rstudio-customizing].

Now that you are set up with R and RStudio, you are probably asking yourself, "OK - now how do I use R?". The first thing to note is that unlike other software programs like Excel or SPSS that provide [point-and-click] interfaces, R is an [interpreted language][wiki-interpreted]. This means you have to type in commands written in *R code*. In other words, you have to code/program in R. Note that we will use the terms "coding" and "programming" interchangeably.

Go into the Console, where we interact with the live R process.

Make an assignment and then inspect the object you just created:


```r
x <- 3 * 4
x
#> [1] 12
```

All R statements where you create objects -- "assignments" -- have this form:

```r
object_name <- value
```
and in my head I hear, e.g., "x equals 12". You will make lots of assignments and the operator `<-` is a pain to type. Do not be lazy and use `=`, although it would work, because it will just sow confusion later. Instead, utilize RStudio's keyboard shortcut: Alt+- (the minus sign).

Note that RStudio automatically surrounds `<-` with spaces, which demonstrates a useful code formatting practice. Give your eyes a break and use spaces.

RStudio offers many handy [keyboard shortcuts][rstudio-key-shortcuts]. Also, Alt+Shift+K brings up a keyboard shortcut reference card.

Object names cannot start with a digit and cannot contain certain other characters such as a comma or a space. You are advised to adopt a naming convention; some use [snake case][wiki-snake-case] others use [camel case][wiki-camel-case]. Choose the naming convention you like best in your study group. But stick only to one of them.

```
this_is_snake_case   # note you do not use capital letters here
thisIsCamelCase      # you start each word with a capital letter
```

Make another assignment:

```r
this_is_a_long_name <- 2.5
```

To inspect this, try out RStudio's completion facility: type the first few characters, press TAB, add characters until you agree, then press return.

In VBA you have procedures and functions. In R we only use functions which always return an object. R has a mind-blowing collection of built-in functions that are accessed like so:


```r
function_name(arg1 = val1, arg2 = val2, ...)
```

Let's try function `seq()` which makes regular sequences of numbers and at the same time demo more helpful features of RStudio.

Type `se` and hit TAB. A pop-up shows you possible completions. Specify `seq()` by typing more or use the up/down arrows to select. Note the floating tool-tip-type help that pops up, reminding you of a function's arguments. If you want even more help, press F1 as directed to get the full documentation in the help tab of the lower right pane. Now open the parentheses and note the automatic addition of the closing parenthesis and the placement of the cursor in the middle. Type the arguments `1, 10` and hit return.  


```r
seq(1, 10)
#>  [1]  1  2  3  4  5  6  7  8  9 10
```

The above also demonstrates something about how R resolves function arguments. Type seq and press F1 or type:


```r
?seq
```

The Help tab of the lower right pane will show the help documentation of function `seq` with a description of usage, arguments, return value etc. Note all function arguments have names. You can always specify arguments using `name = value` form. But if you do not, R attempts to resolve by position. So above, it is assumed that we want a sequence `from = 1` that goes `to = 10`. Since we did not specify step size, the default value of `by` in the function definition is used, which ends up being 1 in this case. Note since the default value for `from` is 1, the same result is obtained by typing:


```r
seq(to = 10)
#>  [1]  1  2  3  4  5  6  7  8  9 10
```

Make this assignment and note similar help with quotation marks.

```r
yo <- "hello world"
```

If you just create an assignment, you do not see the value. You may see the value by:


```r
yo          # same as print(yo)
#> [1] "hello world"
print(yo)  
#> [1] "hello world"
```

Now look at your Environment tab in the upper right pane where user-defined objects accumulate. You can also get a listing of these objects with commands:


```r
objects()
#>  [1] "add_graph_legend"     "addIcon"              "addSolution"          "create_learning_path"
#>  [5] "ctrSol"               "g"                    "link_excel_file"      "link_excel_file_text"
#>  [9] "link_slide_file_text" "strExercises"         "strLPath"             "this_is_a_long_name" 
#> [13] "x"                    "yo"
ls()
#>  [1] "add_graph_legend"     "addIcon"              "addSolution"          "create_learning_path"
#>  [5] "ctrSol"               "g"                    "link_excel_file"      "link_excel_file_text"
#>  [9] "link_slide_file_text" "strExercises"         "strLPath"             "this_is_a_long_name" 
#> [13] "x"                    "yo"
```

If you want to remove the object named `yo`, you can do this:


```r
rm(yo)
```

To remove everything:


```r
rm(list = ls())
```

or click the broom in RStudio's Environment pane.


## Your first DataCamp course

[DataCamp] is an online platform for learning data science. We are going to use the platform for online tutorials. First, sign up to the organization __Tools for analytics__ at DataCamp __using your university e-mail__ [here](https://www.datacamp.com/groups/shared_links/27a2552c6f9759a23e473bf403548817d731fde6478552ff871c65dc4350ef30) (IMPORTANT do this before running the course/tutorial below!). 

DataCamp runs all the courses in your browser. That is, R is run on a server and you do not use RStudio here. The first course gives an [Introduction to R][datacamp-r-intro]. You are expected to have completed [the course][datacamp-r-intro] before continuing this module! 


## Pipes

Most functions support the pipe operator which is a powerful tool for clearly expressing a sequence of multiple operations. The pipe operator `%>%`, comes from the magrittr package and is loaded automatically when you load tidyverse. You may use the RStudio keyboard shortcut Ctrl+Shift+M.

Consider the following code:


```r
# calculate x as a sequence of operations
x <- 16
x <- sqrt(x)
x <- log2(x)
x
#> [1] 2
# same as
y <- log2(sqrt(16))
y
#> [1] 2
```

Note we here calculate `x` using a sequence of operations:

$$ \mbox{original data (x)}
\rightarrow \mbox{ sqrt }
\rightarrow \mbox{ log2 }. $$

That is, we take what is left of the arrow (the object `x`) and put it into the function on the right of the arrow. These operations can be done using the pipe operator:


```r
library(tidyverse)
x <- 16
x <- x %>%
   sqrt() %>%
   log2()
x
#> [1] 2
```
In general, the pipe _sends_ the result of the left side of the pipe to be the first argument of the function on the right side of the pipe. That is, you may have other arguments in your functions:


```r
16 %>% sqrt() %>% log2()
#> [1] 2
16 %>% sqrt() %>% log(base = 2)   # equivalent
#> [1] 2
```

The above example is simple but illustrates that you can use pipes to skip intermediate assignment operations. Later you will do more complex pipes when we consider data wrangling. For instance,


```r
mtcars %>% select(cyl, gear, hp, mpg) %>% filter(gear == 4, cyl == 4)
#>                cyl gear  hp  mpg
#> Datsun 710       4    4  93 22.8
#> Merc 240D        4    4  62 24.4
#> Merc 230         4    4  95 22.8
#> Fiat 128         4    4  66 32.4
#> Honda Civic      4    4  52 30.4
#> Toyota Corolla   4    4  65 33.9
#> Fiat X1-9        4    4  66 27.3
#> Volvo 142E       4    4 109 21.4
```

selects the columns related to cylinders, gears, horse power and miles, and then rows with cars having four cylinders and gears. For a more detailed introduction to pipes see [Chapter 18][r4ds-pipes] in @r4ds.



## RStudio projects {#rprojs}

One day you will need to quit R, do something else and return to your analysis later.

One day you will have multiple analyses going that use R and you want to keep them separate.

One day you will need to bring data from the outside world into R and send numerical results and figures from R back out into the world.

To handle these real life situations, you need to store your work in a project that keeps all the files associated with a project organized together (such as input data, R scripts, analytical results and figures). RStudio has built-in support for this via its [_projects_][rstudio-using-projects]. You may think of a project as a folder where you store all you work. 

On RStudio Cloud you create a project inside a workspace. Projects have already been made for most modules. However, let us try to create a project in your _Your Workspace_ workspace. Expand the left menu and select your _Your Workspace_ workspace. Press the _New Project_ button and select _New RStudio Project_. The project is now created and you can rename it in the upper left corner. Go back to the project _01-module-12_ in the _Tools for Analytics_ workspace that we will use for the remaining of the module.

For RStudio on your laptop you create a project for the rest of this module by doing this: **File > New Project... > New Directory > New Project >**. The directory name you choose here will be the project name. Call it whatever you want (or follow me for convenience). I used `tfa_testing` in my `tmp` directory (that is `tfa_testing` is now a subfolder of `tmp`.

You now need a way to store R code in your project. We will use 2 ways of storing your code. An R script file or an R Markdown document. Normally you store lines of R code in a script file that you need to run. 

R Markdown provides an easy way to produce a rich, fully-documented reproducible analysis. Here you combine text, figures and metadata needed to reproduce the analysis from the beginning to the end in a single file. R Markdown compiles to nicely formatted HTML, PDF, or Word. We are going to use R Markdown for larger projects (e.g. the mandatory R report). We will come back to R Markdown later.


### Storing your code in a script file

R code can be stored in a script file with file suffix `.R`. A script file contains a line for each R command to run (think of each line as a command added to the console). Create a new script file **File > New File > R Script**. Let us add some R code to the file:


```r
# this is a comment
a <- 2
b <- -3
sig_sq <- 0.5
x <- runif(40)
y <- a + b * x + rnorm(40, sd = sqrt(sig_sq))
(avg_x <- mean(x))
write(avg_x, "avg_x.txt")
plot(x, y)
abline(a, b, col = "purple")
dev.print(pdf, "toy_line_plot.pdf")
```

Save the file as `testing.R` Now run each line by setting the cursor at the first line, hit Ctrl+Enter (runs the line in the Console and moves the cursor to the next line). Repeat Ctrl+Enter until you have run all the lines. Alternatively you may select all the code and hit Ctrl+Enter. 

Change some things in your code. For instance set a sample size `n` at the top, e.g. `n <- 40`, and then replace all the hard-wired 40's with `n`. Change some other minor, but detectable, stuff, e.g. alter the sample size `n`, the slope of the line `b`, the color of the line etc. Practice the different ways to rerun the code:

* Walk through line by line by keyboard shortcut (Ctrl+Enter) or mouse (click "Run" in the upper right corner of editor pane).
  
* Source the entire document by entering `source('testing.R')` in the Console or use keyboard shortcut (Shift+Ctrl+S) or mouse (click "Source" in the upper right corner of editor pane or select from the mini-menu accessible from the associated down triangle).
  
* Source with echo from the Source mini-menu.
  
Try to get an overview of the different planes and tabs. For instance in the Files tab (lower right plane) you can get an overview of your project files. You may also see this [video about projects][video-projects].


<!-- ## Global options -->

<!-- This section is relevant if you use RStudio on your laptop. Quit RStudio. Inspect the folder associated with your project if you wish. Maybe view the PDF in an external viewer. Restart RStudio. Note that things, by default, restore to where we were earlier. Check the Environment tap (top-right plane). The environment should be empty. If it contains objects you defined before you closed R, it is because they have been restored. This is in general not advisable and should be changed by opening **Tools > Global Options ...**. Under **General** set the check marks as:   -->

<!-- ```{r echo=FALSE, out.width='60%'} -->
<!-- knitr::include_graphics('img/global_options_general.png') -->
<!-- ``` -->

<!-- Quit RStudio and reopen it. The Environment tab should now be empty.  -->


<!-- ## Working directory -->

<!-- Any process running on your laptop has a notion of its "working directory". In R, this is where R will look, by default, for files you ask it to load. It is also where, by default, any files you write to disk will go. Chances are your current working directory is the directory we inspected above, i.e. the one where RStudio wanted to save the workspace. -->

<!-- You can explicitly check your working directory with: -->

<!-- ```{r, eval = FALSE} -->
<!-- getwd() -->
<!-- ``` -->

<!-- It is also displayed at the top of the RStudio console. In general it should be the directory of your R project. You can set R's working directory at the command line like so: -->

<!-- ```{r, eval = FALSE} -->
<!-- setwd("./subfolder")  # sets the working dir to a subfolder of you project folder -->
<!-- ``` -->

<!-- You can also use RStudio's Files pane to navigate to a directory and then set it as working directory from the menu: **Session > Set Working Directory > To Files Pane Location**. -->



## Recap {#rc-r-workflow}

R is a programming language that runs computations, while RStudio is an integrated development environment (IDE) that provides an interface by adding many convenient features and tools. 

Adopt a naming convention. Either use snake case or use camel case. Choose the naming convention you like best in your study group. But stick only to one of them.

Store your work in a project that keeps all the files associated with a project organized together (such as input data, R scripts, analytical results and figures). You may think of a project as a folder where you store all your work. 

This workflow will serve you well in the future:

* Create an RStudio project for an analytical project (a project for most modules is already created in RStudio Cloud)
* Keep inputs there (we will soon talk about importing)
* Keep scripts there; edit them, run them in bits or as a whole from there
* Keep outputs there (like the PDF written above)

Avoid using the mouse for pieces of your analytical workflow, such as loading a dataset or saving a figure. This is extremely important for the reproducibility and for making it possible to retrospectively determine how a numerical table or PDF was actually produced.

Learn and use shortcuts as much as possible. For instance Alt+- for the assignment operator and Ctrl+Shift+M for the pipe operator. A reference card of shortcuts can be seen using Alt+Shift+K.

Store your R commands in a script file and R scripts with a `.R` suffix. 

Comments start with one or more `#` symbols. Use them. RStudio helps you (de)comment selected lines with Ctrl+Shift+C (Windows and Linux) or Cmd+Shift+C (Mac).

Values saved in R are stored in *Objects*. 

The interactive DataCamp course gave an introduction to some basic programming concepts and terminology:

* *Data types*: integers, doubles/numerics, logicals, and characters.  Integers are values like -1, 0, 2, 4092. Doubles or numerics are a larger set of values containing both the integers but also fractions and decimal values like -24.932 and 0.8. Logicals are either `TRUE` or `FALSE` while characters are text such as "Hamilton", "The Wire is the greatest TV show ever", and "This ramen is delicious." Note that characters are often denoted with the quotation marks around them.
* *Vectors*: a series of values. These are created using the `c()` function, where `c()` stands for "combine" or "concatenate." For example, `c(6, 11, 13, 31, 90, 92)` creates a six element series of positive integer values \index{vectors}.
* *Factors*: *categorical data* are commonly represented in R as factors. Categorical data can also be represented as *strings*. 
* *Data frames*: rectangular spreadsheets. They are representations of datasets in R where the rows correspond to *observations* and the columns correspond to *variables* that describe the observations. 
* *Lists* are general containers that can be used to store a set of different objects under one name (that is, the name of the list) in an ordered way. These objects can be matrices, vectors, data frames, even other lists, etc. It is not even required that these objects are related to each other in any way.
* *Comparison operators* known to R are:

   - `<` for less than,
   - `>` for greater than,
   - `<=` for less than or equal to,
   - `>=` for greater than or equal to,
   - `==` for equal to each other (and not `=` which is typically used for assignment!),
   - `!=` not equal to each other.

<!--   + Logical operators: `&` representing "and" as well as `|` representing "or." For example, `(2 + 1 == 3) & (2 + 1 == 4)` returns `FALSE` since both clauses are not `TRUE` (only the first clause is `TRUE`). On the other hand, `(2 + 1 == 3) | (2 + 1 == 4)` returns `TRUE` since at least one of the two clauses is `TRUE`. \index{operators!logical} -->
<!-- * *Functions*, also called *commands*: Functions perform tasks in R. They take in inputs called *arguments* and return outputs. You can either manually specify a function's arguments or use the function's *default values*. \index{functions} -->

A *pipe* (`%>%`) sends the result of the left side of the pipe to be the first argument of the function on the right side of the pipe. Use pipes if you have many intermediate assignment operations.




You may also have a look at the [slides for this module](https://bss-osca.github.io/tfa/slides/05-02_r-workflow-slides.html).


## Exercises {#ex-r-workflow}

Below you will find a set of exercises. Always have a look at the exercises before you meet in your study group and try to solve them yourself. Are you stuck, see the [help page](#help). Some of the solutions to each exercise can be seen by pressing the button at each question. Beware, you will not learn by giving up too early. Put some effort into finding a solution! 

Practice using shortcuts in RStudio (use Shift+Alt+K to get an overview). [Link to the project on RStudio Cloud for this module][r-cloud-mod12]. 

### Exercise (group work)

_You are not expected to start solving this exercise before you meet in your group._

You have all been allocated into groups. During the course, you are expected to solve the R exercises in these groups. Before you start, it is a good idea to agree on a set of group rules:

   1) It is a good idea to have a shared place for your code. Have a look at the section [Working in groups](#groups) and decide on a place to share your code.
   1) Create a shared folder and project for your group.
   1) Agree on a coding convention.



<!-- ### Exercise (install packages) -->

<!-- *This exercise is done from the Console in RStudio (under Windows, [remember to have admin rights](#install-r)).* -->

<!-- ```{r, solution=TRUE, eval=FALSE, include=FALSE} -->
<!-- install.packages("devtools") -->
<!-- ``` -->

<!--    1) Install the package `devtools` using function `install.packages`. Note you can always get help/see documentation of a function by typing `?install.packages` or typing `install.packages` and press F1. -->

<!-- You now have installed the package from the default repository ([CRAN][cran]). -->

<!-- You may also install packages from other repositories (e.g. GitHub): -->

   <!-- 2) Have a look at the documentation for function `install_github` in the package `devtools`. This can be done in different ways: -->

   <!-- r -->
   <!-- library(devtools)    # we here load all the functions in devtools -->
   <!-- ?install_github -->

   <!-- ?devtools::install_github     # we here use the namespace devtools to load only one function -->


<!-- ```{r, echo=FALSE, eval=FALSE, include=FALSE} -->
<!-- devtools::install_github("bss-osca/tfa/tfa-package") -->
<!-- ``` -->

   <!-- 3) Install the package `tfa` from GitHub using path `bss-osca/tfa/tfa-package`. --> 



### Exercise (piping)

*Solve this exercise using a script file (e.g. `exercises/pipe.R` which already has been created). Remember that you can run a line in the file using Ctrl+Enter.* 

The pipe `%>%` can be used to perform operations sequentially without having to define intermediate objects (Ctrl+Shift+M). Have a look at the dataset `mtcars`: 


```r
head(mtcars)
?mtcars
```

The pipe


```r
library(tidyverse)
mtcars %>% select(cyl, gear, hp, mpg) %>% filter(gear == 4 & cyl == 4)
#>                cyl gear  hp  mpg
#> Datsun 710       4    4  93 22.8
#> Merc 240D        4    4  62 24.4
#> Merc 230         4    4  95 22.8
#> Fiat 128         4    4  66 32.4
#> Honda Civic      4    4  52 30.4
#> Toyota Corolla   4    4  65 33.9
#> Fiat X1-9        4    4  66 27.3
#> Volvo 142E       4    4 109 21.4
```

selects the columns related to cylinders, gears, horse power and miles, and then rows with cars having four cylinders and (operator `&`) gears. 


<div class="modal fade bs-example-modal-lg" id="Px3kgzk1kKZFhTGiJzZV" tabindex="-1" role="dialog" aria-labelledby="Px3kgzk1kKZFhTGiJzZV-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="Px3kgzk1kKZFhTGiJzZV-title">Solution</h4></div><div class="modal-body">

```r
mtcars %>% 
   select(mpg, hp, am, gear)
#>                      mpg  hp am gear
#> Mazda RX4           21.0 110  1    4
#> Mazda RX4 Wag       21.0 110  1    4
#> Datsun 710          22.8  93  1    4
#> Hornet 4 Drive      21.4 110  0    3
#> Hornet Sportabout   18.7 175  0    3
#> Valiant             18.1 105  0    3
#> Duster 360          14.3 245  0    3
#> Merc 240D           24.4  62  0    4
#> Merc 230            22.8  95  0    4
#> Merc 280            19.2 123  0    4
#> Merc 280C           17.8 123  0    4
#> Merc 450SE          16.4 180  0    3
#> Merc 450SL          17.3 180  0    3
#> Merc 450SLC         15.2 180  0    3
#> Cadillac Fleetwood  10.4 205  0    3
#> Lincoln Continental 10.4 215  0    3
#> Chrysler Imperial   14.7 230  0    3
#> Fiat 128            32.4  66  1    4
#> Honda Civic         30.4  52  1    4
#> Toyota Corolla      33.9  65  1    4
#> Toyota Corona       21.5  97  0    3
#> Dodge Challenger    15.5 150  0    3
#> AMC Javelin         15.2 150  0    3
#> Camaro Z28          13.3 245  0    3
#> Pontiac Firebird    19.2 175  0    3
#> Fiat X1-9           27.3  66  1    4
#> Porsche 914-2       26.0  91  1    5
#> Lotus Europa        30.4 113  1    5
#> Ford Pantera L      15.8 264  1    5
#> Ferrari Dino        19.7 175  1    5
#> Maserati Bora       15.0 335  1    5
#> Volvo 142E          21.4 109  1    4
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#Px3kgzk1kKZFhTGiJzZV">Solution</button>

<div class="modal fade bs-example-modal-lg" id="X5UrW52kNqOOsxXf0UZz" tabindex="-1" role="dialog" aria-labelledby="X5UrW52kNqOOsxXf0UZz-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="X5UrW52kNqOOsxXf0UZz-title">Hint</h4></div><div class="modal-body">

```r
mtcars %>% 
   select(___, ___, ___, ___)
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#X5UrW52kNqOOsxXf0UZz">Hint</button>

1) Create a pipe that selects columns related to miles, horsepower, transmission and gears.



<div class="modal fade bs-example-modal-lg" id="DvecqC3xBJf4UAfqieNo" tabindex="-1" role="dialog" aria-labelledby="DvecqC3xBJf4UAfqieNo-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="DvecqC3xBJf4UAfqieNo-title">Solution</h4></div><div class="modal-body">

```r
mtcars %>% 
   select(mpg, hp, am, gear) %>% 
   filter(mpg < 20, gear == 4)
#>            mpg  hp am gear
#> Merc 280  19.2 123  0    4
#> Merc 280C 17.8 123  0    4
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#DvecqC3xBJf4UAfqieNo">Solution</button>

<div class="modal fade bs-example-modal-lg" id="cAHvirA6mY5iX7HbLG8A" tabindex="-1" role="dialog" aria-labelledby="cAHvirA6mY5iX7HbLG8A-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="cAHvirA6mY5iX7HbLG8A-title">Hint</h4></div><div class="modal-body">

```r
mtcars %>% 
   select(mpg, hp, am, gear) %>% 
   filter(___, ___)
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#cAHvirA6mY5iX7HbLG8A">Hint</button>

2) Given the answer in 1), filter so cars have miles less than 20 and 4 gears.




<div class="modal fade bs-example-modal-lg" id="QAbxYeYozTr9cJCP6mbn" tabindex="-1" role="dialog" aria-labelledby="QAbxYeYozTr9cJCP6mbn-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="QAbxYeYozTr9cJCP6mbn-title">Solution</h4></div><div class="modal-body">

```r
mtcars %>% 
   select(mpg, hp, am, gear) %>% 
   filter(mpg < 20 | gear == 4)
#>                      mpg  hp am gear
#> Mazda RX4           21.0 110  1    4
#> Mazda RX4 Wag       21.0 110  1    4
#> Datsun 710          22.8  93  1    4
#> Hornet Sportabout   18.7 175  0    3
#> Valiant             18.1 105  0    3
#> Duster 360          14.3 245  0    3
#> Merc 240D           24.4  62  0    4
#> Merc 230            22.8  95  0    4
#> Merc 280            19.2 123  0    4
#> Merc 280C           17.8 123  0    4
#> Merc 450SE          16.4 180  0    3
#> Merc 450SL          17.3 180  0    3
#> Merc 450SLC         15.2 180  0    3
#> Cadillac Fleetwood  10.4 205  0    3
#> Lincoln Continental 10.4 215  0    3
#> Chrysler Imperial   14.7 230  0    3
#> Fiat 128            32.4  66  1    4
#> Honda Civic         30.4  52  1    4
#> Toyota Corolla      33.9  65  1    4
#> Dodge Challenger    15.5 150  0    3
#> AMC Javelin         15.2 150  0    3
#> Camaro Z28          13.3 245  0    3
#> Pontiac Firebird    19.2 175  0    3
#> Fiat X1-9           27.3  66  1    4
#> Ford Pantera L      15.8 264  1    5
#> Ferrari Dino        19.7 175  1    5
#> Maserati Bora       15.0 335  1    5
#> Volvo 142E          21.4 109  1    4
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#QAbxYeYozTr9cJCP6mbn">Solution</button>

<div class="modal fade bs-example-modal-lg" id="OnhA2Ax8uoZAAmUPBfK8" tabindex="-1" role="dialog" aria-labelledby="OnhA2Ax8uoZAAmUPBfK8-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="OnhA2Ax8uoZAAmUPBfK8-title">Hint</h4></div><div class="modal-body">

```r
mtcars %>% 
   select(mpg, hp, am, gear) %>% 
   filter(___ | ___)
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#OnhA2Ax8uoZAAmUPBfK8">Hint</button>

3) Given the answer in 1), filter so cars have miles less than 20 or 4 gears. The "or" operator in R is `|`.



<div class="modal fade bs-example-modal-lg" id="7BBlRxqpYdnwfqPGOkPN" tabindex="-1" role="dialog" aria-labelledby="7BBlRxqpYdnwfqPGOkPN-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="7BBlRxqpYdnwfqPGOkPN-title">Solution</h4></div><div class="modal-body">

```r
mtcars %>% 
   filter(mpg < 20, gear == 4) %>% 
   select(wt, vs) 
#>             wt vs
#> Merc 280  3.44  1
#> Merc 280C 3.44  1
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#7BBlRxqpYdnwfqPGOkPN">Solution</button>

<div class="modal fade bs-example-modal-lg" id="KouIGRfeeXNtXvL87oUN" tabindex="-1" role="dialog" aria-labelledby="KouIGRfeeXNtXvL87oUN-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="KouIGRfeeXNtXvL87oUN-title">Hint</h4></div><div class="modal-body">

```r
mtcars %>% 
   filter(mpg < 20, gear == 4) %>% 
   select(___, ___) 
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#KouIGRfeeXNtXvL87oUN">Hint</button>

4) Create a pipe that filters the cars having miles less than 20 and 4 gears and selects columns related to weight and engine.




<div class="modal fade bs-example-modal-lg" id="dq6LzUkYbFw7JL127lfb" tabindex="-1" role="dialog" aria-labelledby="dq6LzUkYbFw7JL127lfb-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="dq6LzUkYbFw7JL127lfb-title">Solution</h4></div><div class="modal-body">

```r
dat <- mtcars 
dat <- filter(dat, mpg < 20, gear == 4) 
dat <- select(dat, wt, vs) 
dat
#>             wt vs
#> Merc 280  3.44  1
#> Merc 280C 3.44  1
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#dq6LzUkYbFw7JL127lfb">Solution</button>

<div class="modal fade bs-example-modal-lg" id="e7A4LtJJjoH8igTgKVVK" tabindex="-1" role="dialog" aria-labelledby="e7A4LtJJjoH8igTgKVVK-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="e7A4LtJJjoH8igTgKVVK-title">Hint</h4></div><div class="modal-body">

```r
dat <- mtcars 
dat <- filter(dat, ___) 
dat <- select(dat, ___) 
dat
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#e7A4LtJJjoH8igTgKVVK">Hint</button>

5) Solve Question 4 without the pipe operator. 




### Exercise (working dir)

*Do this exercise from the Console in RStudio.*

When reading and writing to local files, your working directory becomes important. You can get and set the working directory using functions `getwd` and `setwd`. 

Set the working directory to the project directory using the menu: **Session > Set Working Directory > To Project Directory**. Now let us create some files:


```r
   library(tidyverse)
   dir.create("subfolder", showWarnings = FALSE) 
   write_file("Some text in a file", file = "test1.txt")
   write_file("Some other text in a file", file = "subfolder/test2.txt")
```

1) Which folders and files have been created? You may have a look in the **Files** tab in RStudio.

We can read the file again using:


```r
read_file("test1.txt")
```



<div class="modal fade bs-example-modal-lg" id="CJiQgZmiY9aUQgEqGopy" tabindex="-1" role="dialog" aria-labelledby="CJiQgZmiY9aUQgEqGopy-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="CJiQgZmiY9aUQgEqGopy-title">Solution</h4></div><div class="modal-body">

```r
read_file("subfolder/test2.txt")
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#CJiQgZmiY9aUQgEqGopy">Solution</button>

<div class="modal fade bs-example-modal-lg" id="bW4mOa8fVXGZK5gvYfvm" tabindex="-1" role="dialog" aria-labelledby="bW4mOa8fVXGZK5gvYfvm-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="bW4mOa8fVXGZK5gvYfvm-title">Hint</h4></div><div class="modal-body">

```r
read_file("subfolder/___")
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#bW4mOa8fVXGZK5gvYfvm">Hint</button>

2) Read the file `test2.txt`.



3) Set the working directory to `subfolder` using function `setwd`. Note that `setwd` supports relative paths. Check that you are in the right working directory using `getwd`. You may also have a look at the files in the directory using function `list.files`.




<div class="modal fade bs-example-modal-lg" id="BMbMgMhcN2uZzdEKQiNv" tabindex="-1" role="dialog" aria-labelledby="BMbMgMhcN2uZzdEKQiNv-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="BMbMgMhcN2uZzdEKQiNv-title">Solution</h4></div><div class="modal-body">

```r
setwd("subfolder")  # done in Q3
read_file("../test1.txt")
read_file("test2.txt")
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#BMbMgMhcN2uZzdEKQiNv">Solution</button>

<div class="modal fade bs-example-modal-lg" id="nKfNTVfgRCDDiLFMcnKe" tabindex="-1" role="dialog" aria-labelledby="nKfNTVfgRCDDiLFMcnKe-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="nKfNTVfgRCDDiLFMcnKe-title">Hint</h4></div><div class="modal-body">

```r
setwd("subfolder")  # done in Q3
read_file("../___")
read_file("___")
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#nKfNTVfgRCDDiLFMcnKe">Hint</button>

4) Read files `test1.txt` and `test2.txt`. Note that in relative paths `../` means going to the parent folder.  What is different compared to Question 2?






### Exercise (vectors)

*Solve this exercise using a script file.*


<div class="modal fade bs-example-modal-lg" id="sJlwW0YLiigUgetIsVJ5" tabindex="-1" role="dialog" aria-labelledby="sJlwW0YLiigUgetIsVJ5-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="sJlwW0YLiigUgetIsVJ5-title">Solution</h4></div><div class="modal-body">

```r
n <- 100
n * (n+1) / 2
#> [1] 5050
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#sJlwW0YLiigUgetIsVJ5">Solution</button>

1) What is the sum of the first 100 positive integers? The formula for the sum of integers $1$ through $n$ is $n(n+1)/2$. Define $n=100$ and then use R to compute the sum of $1$ through $100$ using the formula. What is the sum?



<div class="modal fade bs-example-modal-lg" id="LHAD6iJtBT8mVFWS3qSn" tabindex="-1" role="dialog" aria-labelledby="LHAD6iJtBT8mVFWS3qSn-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="LHAD6iJtBT8mVFWS3qSn-title">Solution</h4></div><div class="modal-body">

```r
n <- 1000
n * (n+1) / 2
#> [1] 5e+05
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#LHAD6iJtBT8mVFWS3qSn">Solution</button>

2) Now use the same formula to compute the sum of the integers from 1 through 1000.




<div class="modal fade bs-example-modal-lg" id="HocIXe8P1umAIKR9ODbC" tabindex="-1" role="dialog" aria-labelledby="HocIXe8P1umAIKR9ODbC-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="HocIXe8P1umAIKR9ODbC-title">Solution</h4></div><div class="modal-body">

<p>The answer is b).</p>

</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#HocIXe8P1umAIKR9ODbC">Solution</button>

3) Look at the result of typing the following code into R:

   
   ```r
   n <- 1000
   x <- seq(1, n)
   sum(x)
   ```

   Based on the result, what do you think the functions `seq` and `sum` do?  You can use e.g `help("sum")` or `?sum`.

   a. `sum` creates a list of numbers and `seq` adds them up.
   b. `seq` creates a list of numbers and `sum` adds them up.
   c. `seq` creates a random list and `sum` computes the sum of 1 through 1,000.
   d. `sum` always returns the same number.



<div class="modal fade bs-example-modal-lg" id="MjSru7BGRwKYsPZJ3CuW" tabindex="-1" role="dialog" aria-labelledby="MjSru7BGRwKYsPZJ3CuW-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="MjSru7BGRwKYsPZJ3CuW-title">Solution</h4></div><div class="modal-body">

<p>Sample 30 integers in the range [1, 100].</p>

</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#MjSru7BGRwKYsPZJ3CuW">Solution</button>

4) Run code. What does `sample.int` do (try running `?sample.int`)?

   
   ```r
   set.seed(123)
   v <- sample.int(100,30)
   v
   #>  [1] 31 79 51 14 67 42 50 43 97 25 90 69 57  9 72 26  7 95 87 36 78 93 76 15 32 84 82 41 23 27
   ```



<div class="modal fade bs-example-modal-lg" id="2Rn7YC7ktNf5NHoRoonR" tabindex="-1" role="dialog" aria-labelledby="2Rn7YC7ktNf5NHoRoonR-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="2Rn7YC7ktNf5NHoRoonR-title">Solution</h4></div><div class="modal-body">

```r
sum(v)
#> [1] 1598
mean(v)
#> [1] 53.3
sd(v)
#> [1] 28.8
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#2Rn7YC7ktNf5NHoRoonR">Solution</button>

5) What is the sum, mean, and standard deviation of `v`? 



<div class="modal fade bs-example-modal-lg" id="kdi0TDNbL6FfPm6QztsA" tabindex="-1" role="dialog" aria-labelledby="kdi0TDNbL6FfPm6QztsA-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="kdi0TDNbL6FfPm6QztsA-title">Solution</h4></div><div class="modal-body">

```r
v[c(1, 6, 4, 15)]
#> [1] 31 42 14 72
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#kdi0TDNbL6FfPm6QztsA">Solution</button>

<div class="modal fade bs-example-modal-lg" id="8eLeJBm5SVbKUxTtubP9" tabindex="-1" role="dialog" aria-labelledby="8eLeJBm5SVbKUxTtubP9-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="8eLeJBm5SVbKUxTtubP9-title">Hint</h4></div><div class="modal-body">

```r
v[c(1, ___, ___, ___)]
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#8eLeJBm5SVbKUxTtubP9">Hint</button>

6) Select elements 1, 6, 4, and 15 of `v`.



<div class="modal fade bs-example-modal-lg" id="vI3wi8YxaPeJJDMz958g" tabindex="-1" role="dialog" aria-labelledby="vI3wi8YxaPeJJDMz958g-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="vI3wi8YxaPeJJDMz958g-title">Solution</h4></div><div class="modal-body">

```r
v[v > 50]
#>  [1] 79 51 67 97 90 69 57 72 95 87 78 93 76 84 82
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#vI3wi8YxaPeJJDMz958g">Solution</button>

7) Select elements with value above 50.



<div class="modal fade bs-example-modal-lg" id="ctfjWeomyRJP0BqEE4Fj" tabindex="-1" role="dialog" aria-labelledby="ctfjWeomyRJP0BqEE4Fj-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="ctfjWeomyRJP0BqEE4Fj-title">Solution</h4></div><div class="modal-body">

```r
v[v > 75 | v < 25]
#>  [1] 79 14 97 90  9  7 95 87 78 93 76 15 84 82 23
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#ctfjWeomyRJP0BqEE4Fj">Solution</button>

<div class="modal fade bs-example-modal-lg" id="qUOF6OZDRDVLeNMXjDPG" tabindex="-1" role="dialog" aria-labelledby="qUOF6OZDRDVLeNMXjDPG-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="qUOF6OZDRDVLeNMXjDPG-title">Hint</h4></div><div class="modal-body">

```r
v[___ | ___]
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#qUOF6OZDRDVLeNMXjDPG">Hint</button>

8) Select elements with value above 75 or below 25.



<div class="modal fade bs-example-modal-lg" id="dBrkfcNWsaqJhGaTGZut" tabindex="-1" role="dialog" aria-labelledby="dBrkfcNWsaqJhGaTGZut-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="dBrkfcNWsaqJhGaTGZut-title">Solution</h4></div><div class="modal-body">

```r
v[v == 43]
#> [1] 43
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#dBrkfcNWsaqJhGaTGZut">Solution</button>

9) Select elements with value 43.



<div class="modal fade bs-example-modal-lg" id="GJzcwSPe9ZExbVOsMHAA" tabindex="-1" role="dialog" aria-labelledby="GJzcwSPe9ZExbVOsMHAA-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="GJzcwSPe9ZExbVOsMHAA-title">Solution</h4></div><div class="modal-body">

```r
v[is.na(v)]
#> integer(0)
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#GJzcwSPe9ZExbVOsMHAA">Solution</button>

<div class="modal fade bs-example-modal-lg" id="TFDf2hLPouHxjg3OTYhu" tabindex="-1" role="dialog" aria-labelledby="TFDf2hLPouHxjg3OTYhu-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="TFDf2hLPouHxjg3OTYhu-title">Hint</h4></div><div class="modal-body">

```r
v[is.na(___)]
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#TFDf2hLPouHxjg3OTYhu">Hint</button>

10) Select elements with value `NA`.



<div class="modal fade bs-example-modal-lg" id="cQX3GOCp9nXfAdJiOyxj" tabindex="-1" role="dialog" aria-labelledby="cQX3GOCp9nXfAdJiOyxj-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="cQX3GOCp9nXfAdJiOyxj-title">Solution</h4></div><div class="modal-body">

```r
which(v > 75 | v < 25)
#>  [1]  2  4  9 11 14 17 18 19 21 22 23 24 26 27 29
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#cQX3GOCp9nXfAdJiOyxj">Solution</button>

<div class="modal fade bs-example-modal-lg" id="FDaGWmAPTrvsfwWZKL1V" tabindex="-1" role="dialog" aria-labelledby="FDaGWmAPTrvsfwWZKL1V-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="FDaGWmAPTrvsfwWZKL1V-title">Hint</h4></div><div class="modal-body">

```r
which(___ | ___)
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#FDaGWmAPTrvsfwWZKL1V">Hint</button>

11) Which elements have value above 75 or below 25? Hint: see the documentation of function `which` (`?which`).




### Exercise (matrices)

*Solve this exercise using a script file.*

Consider matrices


```r
m1 <- matrix(c(37, 8, 51, NA, 50, 97, 86, NA, 84, 46, 17, 62L), nrow = 3)
m2 <- matrix(c(37, 8, 51, NA, 50, 97, 86, NA, 84, 46, 17, 62L), nrow = 3, byrow = TRUE)
m3 <- matrix(c(37, 8, 51, NA, 50, 97, 86, NA, 84, 46, 17, 62L), ncol = 3)
```

1) What is the difference between the three matrices (think/discuss before running the code).



<div class="modal fade bs-example-modal-lg" id="s04AljyS4el8OD3O4E3f" tabindex="-1" role="dialog" aria-labelledby="s04AljyS4el8OD3O4E3f-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="s04AljyS4el8OD3O4E3f-title">Solution</h4></div><div class="modal-body">

```r
rowSums(m1, na.rm = T)
#> [1] 169  75 294
colSums(m2, na.rm = T)
#> [1] 171 151 154  62
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#s04AljyS4el8OD3O4E3f">Solution</button>

<div class="modal fade bs-example-modal-lg" id="I64skoy66nm0mjdT90SU" tabindex="-1" role="dialog" aria-labelledby="I64skoy66nm0mjdT90SU-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="I64skoy66nm0mjdT90SU-title">Hint</h4></div><div class="modal-body">

```r
rowSums(___, na.rm = ___)
colSums(___, na.rm = ___)
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#I64skoy66nm0mjdT90SU">Hint</button>

2) Calculate the row sums of `m1` and column sums of `m2` ignoring `NA` values. Hint: have a look at the documentation of `rowSums`.



<div class="modal fade bs-example-modal-lg" id="OSi3LnpELrqI9h62z2Ku" tabindex="-1" role="dialog" aria-labelledby="OSi3LnpELrqI9h62z2Ku-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="OSi3LnpELrqI9h62z2Ku-title">Solution</h4></div><div class="modal-body">

```r
rbind(m1, c(1, 2, 3, 4))
#>      [,1] [,2] [,3] [,4]
#> [1,]   37   NA   86   46
#> [2,]    8   50   NA   17
#> [3,]   51   97   84   62
#> [4,]    1    2    3    4
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#OSi3LnpELrqI9h62z2Ku">Solution</button>

<div class="modal fade bs-example-modal-lg" id="cHjpJUhddyP7WDUMyOEc" tabindex="-1" role="dialog" aria-labelledby="cHjpJUhddyP7WDUMyOEc-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="cHjpJUhddyP7WDUMyOEc-title">Hint</h4></div><div class="modal-body">

```r
rbind(___, ___)
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#cHjpJUhddyP7WDUMyOEc">Hint</button>

3) Add row `c(1, 2, 3, 4)` as last row to `m1`. 



<div class="modal fade bs-example-modal-lg" id="8xVAczfPKp8BtJMmB1PT" tabindex="-1" role="dialog" aria-labelledby="8xVAczfPKp8BtJMmB1PT-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="8xVAczfPKp8BtJMmB1PT-title">Solution</h4></div><div class="modal-body">

```r
rbind(c(1, 2, 3, 4), m1)
#>      [,1] [,2] [,3] [,4]
#> [1,]    1    2    3    4
#> [2,]   37   NA   86   46
#> [3,]    8   50   NA   17
#> [4,]   51   97   84   62
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#8xVAczfPKp8BtJMmB1PT">Solution</button>

<div class="modal fade bs-example-modal-lg" id="QLrSXxmCJyalNlXuBH5D" tabindex="-1" role="dialog" aria-labelledby="QLrSXxmCJyalNlXuBH5D-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="QLrSXxmCJyalNlXuBH5D-title">Hint</h4></div><div class="modal-body">

```r
rbind(___, ___)
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#QLrSXxmCJyalNlXuBH5D">Hint</button>

4) Add row `c(1, 2, 3, 4)` as first row to `m1`. 



<div class="modal fade bs-example-modal-lg" id="yIjm6EG67zz8uZORh5Lg" tabindex="-1" role="dialog" aria-labelledby="yIjm6EG67zz8uZORh5Lg-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="yIjm6EG67zz8uZORh5Lg-title">Solution</h4></div><div class="modal-body">

```r
cbind(m3, c(1, 2, 3, 4))
#>      [,1] [,2] [,3] [,4]
#> [1,]   37   50   84    1
#> [2,]    8   97   46    2
#> [3,]   51   86   17    3
#> [4,]   NA   NA   62    4
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#yIjm6EG67zz8uZORh5Lg">Solution</button>

<div class="modal fade bs-example-modal-lg" id="JpDUHBwJT1XdaJtcIO9r" tabindex="-1" role="dialog" aria-labelledby="JpDUHBwJT1XdaJtcIO9r-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="JpDUHBwJT1XdaJtcIO9r-title">Hint</h4></div><div class="modal-body">

```r
cbind(___, ___)
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#JpDUHBwJT1XdaJtcIO9r">Hint</button>

5) Add column `c(1, 2, 3, 4)` as last column to `m3`.



<div class="modal fade bs-example-modal-lg" id="xYKzEb6U69HajArhl9Mf" tabindex="-1" role="dialog" aria-labelledby="xYKzEb6U69HajArhl9Mf-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="xYKzEb6U69HajArhl9Mf-title">Solution</h4></div><div class="modal-body">

```r
m1[2,4]
#> [1] 17
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#xYKzEb6U69HajArhl9Mf">Solution</button>

6) Select the element in row 2 and column 4 of `m1`. 



<div class="modal fade bs-example-modal-lg" id="WLE3Etok97yRSAaGEgHo" tabindex="-1" role="dialog" aria-labelledby="WLE3Etok97yRSAaGEgHo-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="WLE3Etok97yRSAaGEgHo-title">Solution</h4></div><div class="modal-body">

```r
m1[2:3,1:2]
#>      [,1] [,2]
#> [1,]    8   50
#> [2,]   51   97
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#WLE3Etok97yRSAaGEgHo">Solution</button>

<div class="modal fade bs-example-modal-lg" id="5oQkfRc0DhDoJgv77gQp" tabindex="-1" role="dialog" aria-labelledby="5oQkfRc0DhDoJgv77gQp-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="5oQkfRc0DhDoJgv77gQp-title">Hint</h4></div><div class="modal-body">

```r
m1[2:3,___]
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#5oQkfRc0DhDoJgv77gQp">Hint</button>

7) Select elements in rows 2-3 and columns 1-2 of `m1`. 



<div class="modal fade bs-example-modal-lg" id="y4Sh5zF3gmLMH4MBXVwL" tabindex="-1" role="dialog" aria-labelledby="y4Sh5zF3gmLMH4MBXVwL-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="y4Sh5zF3gmLMH4MBXVwL-title">Solution</h4></div><div class="modal-body">

```r
m1[3, c(1,3,4)]
#> [1] 51 84 62
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#y4Sh5zF3gmLMH4MBXVwL">Solution</button>

<div class="modal fade bs-example-modal-lg" id="S5rOjASl3oIMJ2Wgu1zI" tabindex="-1" role="dialog" aria-labelledby="S5rOjASl3oIMJ2Wgu1zI-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="S5rOjASl3oIMJ2Wgu1zI-title">Hint</h4></div><div class="modal-body">

```r
m1[3,___]
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#S5rOjASl3oIMJ2Wgu1zI">Hint</button>

8) Select elements in row 3 and columns 1, 3 and 4 of `m1`. 



<div class="modal fade bs-example-modal-lg" id="wgRo2jLpXHn5pHkx5qnN" tabindex="-1" role="dialog" aria-labelledby="wgRo2jLpXHn5pHkx5qnN-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="wgRo2jLpXHn5pHkx5qnN-title">Solution</h4></div><div class="modal-body">

```r
m1[3,]
#> [1] 51 97 84 62
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#wgRo2jLpXHn5pHkx5qnN">Solution</button>

9) Select elements in row 3 of `m1`. 



<div class="modal fade bs-example-modal-lg" id="KCZtWafWV12vlCeeOoXs" tabindex="-1" role="dialog" aria-labelledby="KCZtWafWV12vlCeeOoXs-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="KCZtWafWV12vlCeeOoXs-title">Solution</h4></div><div class="modal-body">

```r
m2[is.na(m2)]
#> [1] NA NA
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#KCZtWafWV12vlCeeOoXs">Solution</button>

<div class="modal fade bs-example-modal-lg" id="YuaQwhP1ZUsoqMs9Hfya" tabindex="-1" role="dialog" aria-labelledby="YuaQwhP1ZUsoqMs9Hfya-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="YuaQwhP1ZUsoqMs9Hfya-title">Hint</h4></div><div class="modal-body">

```r
m2[is.na(___)]
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#YuaQwhP1ZUsoqMs9Hfya">Hint</button>

10) Select all `NA` elements in `m2`. 



<div class="modal fade bs-example-modal-lg" id="W3y75sVKt1EgEJAn9pKN" tabindex="-1" role="dialog" aria-labelledby="W3y75sVKt1EgEJAn9pKN-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="W3y75sVKt1EgEJAn9pKN-title">Solution</h4></div><div class="modal-body">

```r
m2[m2 > 50]
#> [1] 84 97 51 86 NA NA 62
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#W3y75sVKt1EgEJAn9pKN">Solution</button>

11) Select all elements greater that 50 in `m2`. 



### Exercise (data frames)

*Solve this exercise using a script file.*

Data frames may be seen as cell blocks in Excel. They are representations of datasets in R where the rows correspond to *observations* and the columns correspond to *variables* that describe the observations. 

We consider the data frame `mtcars`:


```r
str(mtcars)
glimpse(mtcars)
?mtcars
```

1) Use the `head` and `tail` functions to have a look at the data.



<div class="modal fade bs-example-modal-lg" id="d51zamtky2urmN2MGqMI" tabindex="-1" role="dialog" aria-labelledby="d51zamtky2urmN2MGqMI-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="d51zamtky2urmN2MGqMI-title">Solution</h4></div><div class="modal-body">

```r
mtcars[,4]
#>  [1] 110 110  93 110 175 105 245  62  95 123 123 180 180 180 205 215 230  66  52  65  97 150 150 245
#> [25] 175  66  91 113 264 175 335 109
mtcars[,"hp"]
#>  [1] 110 110  93 110 175 105 245  62  95 123 123 180 180 180 205 215 230  66  52  65  97 150 150 245
#> [25] 175  66  91 113 264 175 335 109
mtcars$hp
#>  [1] 110 110  93 110 175 105 245  62  95 123 123 180 180 180 205 215 230  66  52  65  97 150 150 245
#> [25] 175  66  91 113 264 175 335 109
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#d51zamtky2urmN2MGqMI">Solution</button>

<div class="modal fade bs-example-modal-lg" id="lqSj6DxkoPantN5ck5Ic" tabindex="-1" role="dialog" aria-labelledby="lqSj6DxkoPantN5ck5Ic-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="lqSj6DxkoPantN5ck5Ic-title">Hint</h4></div><div class="modal-body">

```r
mtcars[,___]
mtcars[,"___"]
mtcars$___
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#lqSj6DxkoPantN5ck5Ic">Hint</button>

2) Select column `hp` using index (column 4), its name, and the `$` operator.




<div class="modal fade bs-example-modal-lg" id="kuTZjru3VLqn7iE4w9eA" tabindex="-1" role="dialog" aria-labelledby="kuTZjru3VLqn7iE4w9eA-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="kuTZjru3VLqn7iE4w9eA-title">Solution</h4></div><div class="modal-body">

```r
mtcars <- rbind(mtcars, 
   c(34, 3, 87, 112, 4.5, 1.515, 167, 1, 1, 5, 3))
rownames(mtcars)[33] <- "Phantom XE"
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#kuTZjru3VLqn7iE4w9eA">Solution</button>

<div class="modal fade bs-example-modal-lg" id="1W5HQaoCSRjipsxYWATF" tabindex="-1" role="dialog" aria-labelledby="1W5HQaoCSRjipsxYWATF-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="1W5HQaoCSRjipsxYWATF-title">Hint</h4></div><div class="modal-body">

```r
mtcars <- rbind(mtcars, ___)
rownames(mtcars)[___] <- "Phantom XE"
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#1W5HQaoCSRjipsxYWATF">Hint</button>

3) Update `mtcars` by adding row `c(34, 3, 87, 112, 4.5, 1.515, 167, 1, 1, 5, 3)`. Name the row 'Phantom XE'.



<div class="modal fade bs-example-modal-lg" id="2dX8HaA5QMqG1rKdXNBQ" tabindex="-1" role="dialog" aria-labelledby="2dX8HaA5QMqG1rKdXNBQ-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="2dX8HaA5QMqG1rKdXNBQ-title">Solution</h4></div><div class="modal-body">

```r
col <- c(NA, "green", "blue", "red", NA, "blue", "green", "blue", "red", "red", 
   "blue", "green", "blue", "blue", "green", "red", "red", NA, NA, "red", 
   "green", "red", "red", NA, "green", NA, "blue", "green", "green", "red", 
   "green", "blue", NA)
mtcars <- cbind(mtcars, col)
class(mtcars$col)
#> [1] "character"
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#2dX8HaA5QMqG1rKdXNBQ">Solution</button>

<div class="modal fade bs-example-modal-lg" id="dWejUN00z6Piksbkqbn1" tabindex="-1" role="dialog" aria-labelledby="dWejUN00z6Piksbkqbn1-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="dWejUN00z6Piksbkqbn1-title">Hint</h4></div><div class="modal-body">

```r
col <- c(NA, "green", ......)
mtcars <- cbind(mtcars, ___)
class(mtcars$___)
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#dWejUN00z6Piksbkqbn1">Hint</button>

4) Update `mtcars` by adding column:

   
   ```r
   col <- c(NA, "green", "blue", "red", NA, "blue", "green", "blue", "red", "red", 
            "blue", "green", "blue", "blue", "green", "red", "red", NA, NA, "red", 
            "green", "red", "red", NA, "green", NA, "blue", "green", "green", 
            "red", "green", "blue", NA)
   ```
   
   What class is column `col`?




<div class="modal fade bs-example-modal-lg" id="PsevAJnzJ0z93bJWn4hw" tabindex="-1" role="dialog" aria-labelledby="PsevAJnzJ0z93bJWn4hw-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="PsevAJnzJ0z93bJWn4hw-title">Solution</h4></div><div class="modal-body">

```r
mtcars[mtcars$vs == 0,]
#>                      mpg cyl disp  hp drat   wt qsec vs am gear carb   col
#> Mazda RX4           21.0   6  160 110 3.90 2.62 16.5  0  1    4    4  <NA>
#> Mazda RX4 Wag       21.0   6  160 110 3.90 2.88 17.0  0  1    4    4 green
#> Hornet Sportabout   18.7   8  360 175 3.15 3.44 17.0  0  0    3    2  <NA>
#> Duster 360          14.3   8  360 245 3.21 3.57 15.8  0  0    3    4 green
#> Merc 450SE          16.4   8  276 180 3.07 4.07 17.4  0  0    3    3 green
#> Merc 450SL          17.3   8  276 180 3.07 3.73 17.6  0  0    3    3  blue
#> Merc 450SLC         15.2   8  276 180 3.07 3.78 18.0  0  0    3    3  blue
#> Cadillac Fleetwood  10.4   8  472 205 2.93 5.25 18.0  0  0    3    4 green
#> Lincoln Continental 10.4   8  460 215 3.00 5.42 17.8  0  0    3    4   red
#> Chrysler Imperial   14.7   8  440 230 3.23 5.34 17.4  0  0    3    4   red
#> Dodge Challenger    15.5   8  318 150 2.76 3.52 16.9  0  0    3    2   red
#> AMC Javelin         15.2   8  304 150 3.15 3.44 17.3  0  0    3    2   red
#> Camaro Z28          13.3   8  350 245 3.73 3.84 15.4  0  0    3    4  <NA>
#> Pontiac Firebird    19.2   8  400 175 3.08 3.85 17.1  0  0    3    2 green
#> Porsche 914-2       26.0   4  120  91 4.43 2.14 16.7  0  1    5    2  blue
#> Ford Pantera L      15.8   8  351 264 4.22 3.17 14.5  0  1    5    4 green
#> Ferrari Dino        19.7   6  145 175 3.62 2.77 15.5  0  1    5    6   red
#> Maserati Bora       15.0   8  301 335 3.54 3.57 14.6  0  1    5    8 green
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#PsevAJnzJ0z93bJWn4hw">Solution</button>

<div class="modal fade bs-example-modal-lg" id="HF94YUUt2CVEZTZ89Pge" tabindex="-1" role="dialog" aria-labelledby="HF94YUUt2CVEZTZ89Pge-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="HF94YUUt2CVEZTZ89Pge-title">Hint</h4></div><div class="modal-body">

```r
mtcars[mtcars$___ == 0,]
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#HF94YUUt2CVEZTZ89Pge">Hint</button>

5) Select cars with a V-shaped engine.




### Exercise (lists)

*Solve this exercise using a script file.*

Lists are general containers that can be used to store a set of different objects under one name (that is, the name of the list) in an ordered way. These objects can be matrices, vectors, data frames, even other lists, etc.

Let us define a list:


```r
lst <- list(45, "Lars", TRUE, 80.5)
lst
#> [[1]]
#> [1] 45
#> 
#> [[2]]
#> [1] "Lars"
#> 
#> [[3]]
#> [1] TRUE
#> 
#> [[4]]
#> [1] 80.5
```

Elements can be accessed using brackets:


```r
x <- lst[2]
x
#> [[1]]
#> [1] "Lars"
y <- lst[[2]]
y
#> [1] "Lars"
```


<div class="modal fade bs-example-modal-lg" id="uofo7FKPdoGo0eoSC1Hu" tabindex="-1" role="dialog" aria-labelledby="uofo7FKPdoGo0eoSC1Hu-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="uofo7FKPdoGo0eoSC1Hu-title">Solution</h4></div><div class="modal-body">

```r
class(x)
#> [1] "list"
class(y)
#> [1] "character"
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#uofo7FKPdoGo0eoSC1Hu">Solution</button>

<div class="modal fade bs-example-modal-lg" id="vXDUnP6HMGTM72GyUTkf" tabindex="-1" role="dialog" aria-labelledby="vXDUnP6HMGTM72GyUTkf-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="vXDUnP6HMGTM72GyUTkf-title">Hint</h4></div><div class="modal-body">

```r
class(___)
class(___)
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#vXDUnP6HMGTM72GyUTkf">Hint</button>

1) What is the class of the two objects `x` and `y`? What is the difference between using one or two brackets?



<div class="modal fade bs-example-modal-lg" id="3hMsm8I7aYgJbzk4R3Lj" tabindex="-1" role="dialog" aria-labelledby="3hMsm8I7aYgJbzk4R3Lj-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="3hMsm8I7aYgJbzk4R3Lj-title">Solution</h4></div><div class="modal-body">

```r
names(lst) <- c("age", "name", "male", "weight")
lst
#> $age
#> [1] 45
#> 
#> $name
#> [1] "Lars"
#> 
#> $male
#> [1] TRUE
#> 
#> $weight
#> [1] 80.5
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#3hMsm8I7aYgJbzk4R3Lj">Solution</button>

<div class="modal fade bs-example-modal-lg" id="0lSifZheH6xjb7YGt0E8" tabindex="-1" role="dialog" aria-labelledby="0lSifZheH6xjb7YGt0E8-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="0lSifZheH6xjb7YGt0E8-title">Hint</h4></div><div class="modal-body">

```r
names(lst) <- c("age", ___, ___, ___)
lst
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#0lSifZheH6xjb7YGt0E8">Hint</button>

2) Add names *age, name, male and weight* to the 4 components of the list.



<div class="modal fade bs-example-modal-lg" id="KjziVRw74tQ2eTcG97VX" tabindex="-1" role="dialog" aria-labelledby="KjziVRw74tQ2eTcG97VX-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="KjziVRw74tQ2eTcG97VX-title">Solution</h4></div><div class="modal-body">

```r
lst$name
#> [1] "Lars"
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#KjziVRw74tQ2eTcG97VX">Solution</button>

3) Extract the name component using the `$` operator.


You can add/change/remove components using:


```r
lst$height <- 173  # add component
lst$name <- list(first = "Lars", last = "Nielsen")  # change the name component
lst$male <- NULL   # remove male component
lst
#> $age
#> [1] 45
#> 
#> $name
#> $name$first
#> [1] "Lars"
#> 
#> $name$last
#> [1] "Nielsen"
#> 
#> 
#> $weight
#> [1] 80.5
#> 
#> $height
#> [1] 173
```



<div class="modal fade bs-example-modal-lg" id="8AlWrf0gtd6vf9kwQIGD" tabindex="-1" role="dialog" aria-labelledby="8AlWrf0gtd6vf9kwQIGD-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="8AlWrf0gtd6vf9kwQIGD-title">Solution</h4></div><div class="modal-body">

```r
lst$name$last
#> [1] "Nielsen"
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#8AlWrf0gtd6vf9kwQIGD">Solution</button>

<div class="modal fade bs-example-modal-lg" id="ZkfXol1N3nvXqafVluo4" tabindex="-1" role="dialog" aria-labelledby="ZkfXol1N3nvXqafVluo4-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="ZkfXol1N3nvXqafVluo4-title">Hint</h4></div><div class="modal-body">

```r
lst$name$___
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#ZkfXol1N3nvXqafVluo4">Hint</button>

4) Extract the last name component using the `$` operator.


### Exercise (string management) {#ex-strings}

Strings in R can be defined using single or double quotes:


```r
str1 <- "Business Analytics (BA) refers to the scientific process of transforming data into insight for making better decisions in business."

str2 <- 'BA can both be seen as the complete decision making process for solving a business problem or as a set of methodologies that enable the creation of business value.'

str3 <- c(str1, str2)  # vector of strings
```

The stringr package in tidyverse provides many useful functions for string manipulation. We will consider a few. 


```r
str4 <- str_c(str1, 
      str2, 
      "As a process it can be characterized by descriptive, predictive, and prescriptive model building using data sources.",
      sep = " ")   # join strings
str4
#> [1] "Business Analytics (BA) refers to the scientific process of transforming data into insight for making better decisions in business. BA can both be seen as the complete decision making process for solving a business problem or as a set of methodologies that enable the creation of business value. As a process it can be characterized by descriptive, predictive, and prescriptive model building using data sources."
str_c(str3, collapse = " ")    # collapse vector to a string
#> [1] "Business Analytics (BA) refers to the scientific process of transforming data into insight for making better decisions in business. BA can both be seen as the complete decision making process for solving a business problem or as a set of methodologies that enable the creation of business value."

str_replace(str2, "BA", "Business Analytics")  # replace first occurrence
#> [1] "Business Analytics can both be seen as the complete decision making process for solving a business problem or as a set of methodologies that enable the creation of business value."
str_replace_all(str2, "the", "a")              # replace all occurrences
#> [1] "BA can both be seen as a complete decision making process for solving a business problem or as a set of methodologies that enable a creation of business value."

str_remove(str1, " for making better decisions in business")
#> [1] "Business Analytics (BA) refers to the scientific process of transforming data into insight."

str_detect(str2, "BA")  # detect a pattern
#> [1] TRUE
```



<div class="modal fade bs-example-modal-lg" id="03rZJxaWNJo2MrhgLY8m" tabindex="-1" role="dialog" aria-labelledby="03rZJxaWNJo2MrhgLY8m-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="03rZJxaWNJo2MrhgLY8m-title">Solution</h4></div><div class="modal-body">

```r
str_detect(str1, "Business")
#> [1] TRUE
str_detect(str2, "Business")
#> [1] FALSE
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#03rZJxaWNJo2MrhgLY8m">Solution</button>

<div class="modal fade bs-example-modal-lg" id="sClax9Wsr1yUOP5APLPI" tabindex="-1" role="dialog" aria-labelledby="sClax9Wsr1yUOP5APLPI-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="sClax9Wsr1yUOP5APLPI-title">Hint</h4></div><div class="modal-body">

```r
str_detect(str1, ___)
str_detect(___, ___)
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#sClax9Wsr1yUOP5APLPI">Hint</button>

1) Is `Business` (case sensitive) contained in `str1` and `str2`?



<div class="modal fade bs-example-modal-lg" id="Y9x2Nxe3PQVRc8uZX7lT" tabindex="-1" role="dialog" aria-labelledby="Y9x2Nxe3PQVRc8uZX7lT-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="Y9x2Nxe3PQVRc8uZX7lT-title">Solution</h4></div><div class="modal-body">

```r
str5 <- str_replace(str2, "BA", "Business Analytics") 
str5
#> [1] "Business Analytics can both be seen as the complete decision making process for solving a business problem or as a set of methodologies that enable the creation of business value."
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#Y9x2Nxe3PQVRc8uZX7lT">Solution</button>

<div class="modal fade bs-example-modal-lg" id="m2oGHdw0LPSivctk89BQ" tabindex="-1" role="dialog" aria-labelledby="m2oGHdw0LPSivctk89BQ-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="m2oGHdw0LPSivctk89BQ-title">Hint</h4></div><div class="modal-body">

```r
str5 <- str_replace(str2, ___, ___) 
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#m2oGHdw0LPSivctk89BQ">Hint</button>

2) Define a new string that replace `BA` with `Business Analytics` in `str2`



<div class="modal fade bs-example-modal-lg" id="5DZOZpdOh6Ga9qqTlI4R" tabindex="-1" role="dialog" aria-labelledby="5DZOZpdOh6Ga9qqTlI4R-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="5DZOZpdOh6Ga9qqTlI4R-title">Solution</h4></div><div class="modal-body">

```r
str5 <- str_remove(str5, " or as a set of methodologies that enable the creation of business value")
str5
#> [1] "Business Analytics can both be seen as the complete decision making process for solving a business problem."
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#5DZOZpdOh6Ga9qqTlI4R">Solution</button>

<div class="modal fade bs-example-modal-lg" id="SLBV1lYdTHSnaOoJaSGY" tabindex="-1" role="dialog" aria-labelledby="SLBV1lYdTHSnaOoJaSGY-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="SLBV1lYdTHSnaOoJaSGY-title">Hint</h4></div><div class="modal-body">

```r
str5 <- str_remove(str5, ___)
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#SLBV1lYdTHSnaOoJaSGY">Hint</button>

3) In the string from Question 2, remove ` or as a set of methodologies that enable the creation of business value`.



<div class="modal fade bs-example-modal-lg" id="EXR8cX9YQRpiSWF4O0rz" tabindex="-1" role="dialog" aria-labelledby="EXR8cX9YQRpiSWF4O0rz-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="EXR8cX9YQRpiSWF4O0rz-title">Solution</h4></div><div class="modal-body">

```r
str5 <- str_c(str5, "This course will focus on programming and descriptive analytics.", sep= " ")
str5
#> [1] "Business Analytics can both be seen as the complete decision making process for solving a business problem. This course will focus on programming and descriptive analytics."
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#EXR8cX9YQRpiSWF4O0rz">Solution</button>

<div class="modal fade bs-example-modal-lg" id="hptXYHeFHijAIM4iY8yY" tabindex="-1" role="dialog" aria-labelledby="hptXYHeFHijAIM4iY8yY-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="hptXYHeFHijAIM4iY8yY-title">Hint</h4></div><div class="modal-body">

```r
str5 <- str_c(str5, ___, sep= ___)
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#hptXYHeFHijAIM4iY8yY">Hint</button>

4) In the string from Question 3, add `This course will focus on programming and descriptive analytics.`.



<div class="modal fade bs-example-modal-lg" id="mqsndcG1QMOAJPlG71oT" tabindex="-1" role="dialog" aria-labelledby="mqsndcG1QMOAJPlG71oT-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="mqsndcG1QMOAJPlG71oT-title">Solution</h4></div><div class="modal-body">

```r
str5 <- str_replace(str5, "analytics", "business analytics")
str5
#> [1] "Business Analytics can both be seen as the complete decision making process for solving a business problem. This course will focus on programming and descriptive business analytics."
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#mqsndcG1QMOAJPlG71oT">Solution</button>

<div class="modal fade bs-example-modal-lg" id="n478jkzcHCnjDkrWbwwe" tabindex="-1" role="dialog" aria-labelledby="n478jkzcHCnjDkrWbwwe-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="n478jkzcHCnjDkrWbwwe-title">Hint</h4></div><div class="modal-body">

```r
str5 <- str_replace(str5, ___, ___)
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#n478jkzcHCnjDkrWbwwe">Hint</button>

5) In the string from Question 4, replace `analytics` with `business analytics`.



<div class="modal fade bs-example-modal-lg" id="4pTOIFQwGZCBiJ83vZ7Z" tabindex="-1" role="dialog" aria-labelledby="4pTOIFQwGZCBiJ83vZ7Z-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="4pTOIFQwGZCBiJ83vZ7Z-title">Solution</h4></div><div class="modal-body">

```r
str_replace(str2, "BA", "Business Analytics") %>% 
   str_remove(" or as a set of methodologies that enable the creation of business value") %>% 
   str_c("This course will focus on programming and descriptive analytics.", sep= " ") %>% 
   str_replace("analytics", "business analytics")
#> [1] "Business Analytics can both be seen as the complete decision making process for solving a business problem. This course will focus on programming and descriptive business analytics."
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#4pTOIFQwGZCBiJ83vZ7Z">Solution</button>

<div class="modal fade bs-example-modal-lg" id="XohZikNHWGpP4xDPccK8" tabindex="-1" role="dialog" aria-labelledby="XohZikNHWGpP4xDPccK8-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="XohZikNHWGpP4xDPccK8-title">Hint</h4></div><div class="modal-body">

```r
str_replace(str2, ___, ___) %>% 
   str_remove(___) %>% 
   str_c(___) %>% 
   str_replace(___)
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#XohZikNHWGpP4xDPccK8">Hint</button>

6) Do all calculations in Question 2-5 using pipes.












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

