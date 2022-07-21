---
output: html_document
editor_options: 
  chunk_output_type: console
---


# Loops and conditional statements {#mod-vba-loops-cond}

This module gives a short introduction to loops and conditional statements. In general syllabus will point to chapters in @vba-book; however, there is a lot for videos about VBA online such as course [14-Hour VBA Course][vba-yt-course2]. You may have a look at these videos instead if you prefer a different learning style. In the learning path diagram, links to alternative online content will be pointed out. Note this is alternatives to the standard learning path that you may use instead. The learning path may also have extra content that is not a part of syllabus you can have a look at.

__Learning path diagram__

Click/hover the nodes to follow links and see details.


```{=html}
<div id="htmlwidget-9357f3084f8cbefd9007" style="width:100%;height:400px;" class="grViz html-widget"></div>
<script type="application/json" data-for="htmlwidget-9357f3084f8cbefd9007">{"x":{"diagram":"digraph {\n\ngraph [layout = \"neato\",\n       outputorder = \"edgesfirst\",\n       bgcolor = \"white\"]\n\nnode [fontname = \"Helvetica\",\n      fontsize = \"10\",\n      shape = \"circle\",\n      fixedsize = \"true\",\n      width = \"0.5\",\n      style = \"filled\",\n      fillcolor = \"aliceblue\",\n      color = \"gray70\",\n      fontcolor = \"gray50\"]\n\nedge [fontname = \"Helvetica\",\n     fontsize = \"8\",\n     len = \"1.5\",\n     color = \"gray80\",\n     arrowsize = \"0.5\"]\n\n  \"1\" [label = \"📖 Conditional statements\", URL = \"#vba-cond\", tooltip = \"Conditional statements\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", width = \"0.5\", fillcolor = \"DarkSeaGreen4\", pos = \"2,1!\"] \n  \"2\" [label = \"📖 Loops\", URL = \"#vba-loops\", tooltip = \"Loops\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", width = \"0.5\", fillcolor = \"DarkSeaGreen4\", pos = \"5,1!\"] \n  \"3\" [label = \"💻 Exercises\", URL = \"#ex-vba-loops-cond\", tooltip = \"Exercises\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"egg\", margin = \"0.2\", width = \"0.5\", fillcolor = \"DarkSeaGreen4\", pos = \"8,1!\"] \n  \"4\" [label = \"🎬 Relational Operators\", URL = \"https://youtu.be/d1nmq2Huz44\", tooltip = \"Relational Operators\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", width = \"0.5\", fillcolor = \"PeachPuff3\", pos = \"2,2!\"] \n  \"5\" [label = \"🎬 Logical Operators\", URL = \"https://youtu.be/IYy9LKyAaCs\", tooltip = \"Logical Operators\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", width = \"0.5\", fillcolor = \"PeachPuff3\", pos = \"2,3!\"] \n  \"6\" [label = \"🎬 IF statements\", URL = \"https://youtu.be/bsQbgoSf7Ig\", tooltip = \"IF statements\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", width = \"0.5\", fillcolor = \"PeachPuff3\", pos = \"2,4!\"] \n  \"7\" [label = \"🎬 Do While loop\", URL = \"https://youtu.be/QZd8SPovofU\", tooltip = \"Do While loop\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", width = \"0.5\", fillcolor = \"PeachPuff3\", pos = \"5,2!\"] \n  \"8\" [label = \"🎬 For Next loop\", URL = \"https://youtu.be/hfdjZlknAI8\", tooltip = \"For Next loop\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", width = \"0.5\", fillcolor = \"PeachPuff3\", pos = \"5,3!\"] \n  \"9\" [label = \"\", URL = \"\", tooltip = \" \", style = \"filled\", fixedsize = \"true\", fontsize = \"9\", fontcolor = \"white\", penwidth = \"0.5\", fontname = \"Helvetica\", shape = \"rect\", height = \"1\", width = \"6\", fillcolor = \"#F0F8FF\", pos = \"6.2,4.16!\"] \n  \"10\" [label = \"Color:\", URL = \"\", tooltip = \" \", style = \"filled\", fixedsize = \"true\", fontsize = \"9\", fontcolor = \"black\", penwidth = \"0\", fontname = \"Helvetica\", shape = \"none\", height = \"0\", width = \"0.8\", fillcolor = \"#FFFFFE\", pos = \"3.57,4.5!\"] \n  \"11\" [label = \"mandatory\", URL = \"\", tooltip = \"Mandatory syllabus.\", style = \"filled\", fixedsize = \"true\", fontsize = \"9\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica\", shape = \"rect\", width = \"0.8\", fillcolor = \"DarkSeaGreen4\", pos = \"3.8,4.1!\"] \n  \"12\" [label = \"alternative\", URL = \"\", tooltip = \"Alternative syllabus if you prefer another learning style.\", style = \"filled\", fixedsize = \"true\", fontsize = \"9\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica\", shape = \"rect\", width = \"0.8\", fillcolor = \"DarkOrange4\", pos = \"4.8,4.1!\"] \n  \"13\" [label = \"extra\", URL = \"\", tooltip = \"Extra learning if you are interested (not part of syllabus).\", style = \"filled\", fixedsize = \"true\", fontsize = \"9\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica\", shape = \"rect\", width = \"0.8\", fillcolor = \"PeachPuff3\", pos = \"5.8,4.1!\"] \n  \"14\" [label = \"Shape:\", URL = \"\", tooltip = \" \", style = \"filled\", fixedsize = \"true\", fontsize = \"9\", fontcolor = \"black\", penwidth = \"0\", fontname = \"Helvetica\", shape = \"none\", height = \"0\", width = \"1\", fillcolor = \"#FFFFFE\", pos = \"7,4.5!\"] \n  \"15\" [label = \"non-interactive\", URL = \"\", tooltip = \"Non-interactive learning content (e.g. reading).\", style = \"filled\", fixedsize = \"true\", fontsize = \"9\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica\", shape = \"rect\", width = \"1\", fillcolor = \"Grey40\", pos = \"7.3,4.1!\"] \n  \"16\" [label = \"interactive\", URL = \"\", tooltip = \"Interactive learning content (tutorial, exercises etc.).\", style = \"filled\", fixedsize = \"true\", fontsize = \"9\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica\", shape = \"egg\", width = \"1\", fillcolor = \"Grey40\", pos = \"8.55,4.1!\"] \n\"1\"->\"2\" [color = \"black\", arrowhead = \"vee\"] \n\"1\"->\"4\" [color = \"black\", arrowhead = \"vee\"] \n\"2\"->\"3\" [color = \"black\", arrowhead = \"vee\"] \n\"2\"->\"7\" [color = \"black\", arrowhead = \"vee\"] \n\"4\"->\"5\" [color = \"black\", arrowhead = \"vee\"] \n\"5\"->\"6\" [color = \"black\", arrowhead = \"vee\"] \n\"7\"->\"8\" [color = \"black\", arrowhead = \"vee\"] \n}","config":{"engine":"dot","options":null}},"evals":[],"jsHooks":[]}</script>
```

## Learning outcomes {#lo-vba-loops-cond}

By the end of this module, you are expected to be able to:

* Describe what a conditional statement is.
* Test a condition built using relational/logical operators.
* Declare a conditional statement.
* Describe what a loop is.
* Declare a loop.
* Declare nested loops.
* Exit a loop.

The learning outcomes relate to the [overall learning goals](#lg-course) number 1, 2, 4, 8, 9-12 and 16 of the course.

<!-- SOLO increasing: identify · memorise · name · do simple procedure · collect data · -->
<!-- enumerate · describe · interpret · formulate · list · paraphrase · combine · do -->
<!-- algorithms · compare · contrast · explain causes · analyse · relate · derive · -->
<!-- evaluate · apply · argue · theorise · generalise · hypothesise · solve · reflect -->


## Conditional statements {#vba-cond}

Conditional statements are used to make decisions based on the conditions, i.e. a conditional statement control the flow in which the code runs. If the condition is met then the code is executed. 
  
Read Sections 6.1-6.2.1 in Chapter 6 in @vba-book. You may also have a look at the extra videos as listed in the learning path diagram.


## Loops {#vba-loops}

Loops are used to repeat pieces of code.

Read Sections 6.3-6.4 and Section 6.5.2 in Chapter 6 in @vba-book. You may also have a look at the extra videos as listed in the learning path diagram.


## Recap

- Loops are used to repeat pieces of code.
- For loops (repeat a number of times):
  ```
  For i = 1 To 10 
      <code>
  Next
  ```
      
- While loops (repeat until a condition is met - two versions):

   ```
   While {condition true}    
       <code>
   Wend
   
   Do While {condition true}    
       <code>
   Loop
   ```
      
- Use `Exit for` and `Exit Do` to break a `For` and a `Do While` loop before it ends (jump to the code after the loop). You can not exit `While` loops this way.
- Loops may be nested inside each other:

   ```
   For i = 1 To 2     
     For j = 1 To 3  
         MsgBox ("(" & i & "," & j & ")")
     Next
   Next
   ```
   
- Conditional Statements are used to make decisions based on the conditions. If the condition is met then the code is executed. 
- An if-then-else statement:

   ```
   If k <= 10 Then
    <code>
   ElseIf k <= 13 Then
    <code>
   Else
    <code>
   End If
   ```
   
- You may drop `ElseIf` and `Else` code chunks. 

You may also have a look at the [slides for this module](https://bss-osca.github.io/tfa/slides/02-03_vba-loops-cond-slides.html).

## Exercises {#ex-vba-loops-cond}

Below you will find a set of exercises. Always have a look at the exercises before you meet in your study group and try to solve them yourself. Are you stuck, see the [help page](#help). Some of the solutions to each exercise can be seen by pressing the button at each question. Beware, you will not learn by giving up too early. Put some effort into finding a solution!

### Exercise - Loops {#ex-vba-loops}

The [file](https://github.com/bss-osca/tfa/blob/master/vba/vba-loops-template.xlsm) may be used as a starting point for this exercise. Use the sheet _Testing_ for output.

   (1) Create a for loop that writes numbers 1 to 4 in rows 1 to 4 in column A.  
   (2) Create a while loop that writes numbers 1 to 4 in rows 1 to 4 in column B. 
   (3) Create a do while loop that writes numbers 1 to 4 in rows 1 to 4 in column C.
   (4) Create a loop that writes numbers 1 to 4 in rows 3 to 6 in column D.
   (5) Create a loop that writes numbers -1 to -4 in rows 1 to 4 in column E.
   (6) Create a loop that writes numbers 1 to 4 in rows 4 to 7 in column F, except if the number is 3 then the output should to a string `missing`.
   (7) Create a do while loop that writes numbers i = 1, 2, ... in column G until i/5 + 3 = 8. Hint: you may use a `Exit Do` to quit the loop. 
   (8) Create a sub `Main` that runs all the loops.

### Exercise - Flight search {#ex-vba-flight}

The [file](https://github.com/bss-osca/tfa/blob/master/vba/vba-flight-template.xlsm) should be used as a starting point for this exercise. 

The sheet _Data_ contains a set of flights between different destinations. You task is to create a program that can search for matching flights given a set of origins and destinations. 

   (1) Have a look at the results in sheet _Main_. The origin and destinations to search for are given in columns A and B and the search result in columns D, E and F. 
   (2) Try pressing the **Clear Search** button and see what happens. Have a look at the code in the VBA editor for this sub and get an overview. You are not expected to understand all the code.
   (3) Try to finish the first part of the `SearchFlights` sub and store the flights in arrays. Use the debugger to check if the values are stored correctly. 


<div class="modal fade bs-example-modal-lg" id="OSigvl2J4QGH0cZXW8oO" tabindex="-1" role="dialog" aria-labelledby="OSigvl2J4QGH0cZXW8oO-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="OSigvl2J4QGH0cZXW8oO-title">Hint 2</h4></div><div class="modal-body">

```r
 For o = 1 To intOrigins
     For i = 0 To intFlights - 1
         If Cells(5 + o, 1) = Origin(i) Then 
             For d = 1 To intDestinations
                 ___
             Next 
         End If
     Next 
 Next 
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#OSigvl2J4QGH0cZXW8oO">Hint 2</button>

<div class="modal fade bs-example-modal-lg" id="5Vl9wWGsBU2n9MhHZ1xE" tabindex="-1" role="dialog" aria-labelledby="5Vl9wWGsBU2n9MhHZ1xE-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="5Vl9wWGsBU2n9MhHZ1xE-title">Hint 1</h4></div><div class="modal-body">

<p>You need nested loops (loop over origins, flights, destinations)</p>

</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#5Vl9wWGsBU2n9MhHZ1xE">Hint 1</button>
   
   (4) Try to finish the second part of the `SearchFlights` sub and search for matching origin-destination pairs. Note origins and destinations listed to be searched for are also matching origin-destination pairs if they are not in the same row.

### Exercise - Job sequencing {#ex-vba-job-seq}

The [file](https://github.com/bss-osca/tfa/blob/master/vba/vba-job-sequence-template.xlsm) should be used as a starting point for this exercise. 

Consider $i = 1,...,n$ jobs that has to be done on a machine and let $c_{ij}$ denote the setup cost of switching from job $i$ to job $j$. Moreover, let $c_{0i}$ denote the setup cost of setting up job $i$ when the machine is idle (index 0). Let $s = (0, s_1, \ldots, s_n)$ denote the sequence of jobs and $C$ the total setup costs, e.g. if $s = (0,1,3,2,6,5,4)$, then $C = c_{01} + c_{13} + c_{32} + c_{26} + c_{65} + c_{54}$. Different algorithms for finding a good strategy minimizing the total setup costs exists. A greedy algorithm is:

<div class="box">
**Step 0**: Select the first job as one with minimal idle setup cost.

**Step 1**: Given current job $i$ select the unscheduled with minimal setup cost. 

**Step 2**: If no unscheduled jobs then stop and output the found job sequence else go to Step 1.
</div>

Often a better algorithm is:

<div class="box">
**Step 0**: For each column $j$ find $\bar{c}_j = min(c_{0j},\ldots,c_{j-1,j},c_{j+1,j},\ldots,c_{nj})$ and define relative setup costs $\hat{c}_{ij} = c_{ij}-\bar{c}_{j}$ (the cost is subtracted the minimum value in that column).

**Step 1**: Call the greedy algorithm using costs $\hat{c}_{ij}$.
</div>

Consider sheet _Main_ that contains the setup costs for a scheduling problem.

   (1) Implement the greedy algorithm in a sub `Greedy` that store the setup costs in an ($n+1 \times n$) 2D array `costs` assuming the setup costs table start in cell A4. Next, call the sub `GreedyAlg(costs)` that takes the costs as input argument. The sub must
       - Store the job sequence in an 1D array.
       - Output the number of jobs in cell C1, the job sequence in cell C2 and the total setup costs in cell F1.
       - Highlight the cells with setup costs used in the sequence.
       
   (2) Implement the better algorithm in a sub `Better` that
       - Find and store the minimum setup costs for each column.
       - Calculate the relative costs.
       - Call the greedy algorithm using the relative costs.
       - Correct the total setup costs by adding the minimum costs.
   (3) Add three buttons to _Main_ that remove the solution, run greedy and run better.
   (4) Try to use different datasets from the sheet _Data_ and paste it into A4 in _Main_.


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

