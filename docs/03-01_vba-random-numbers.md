---
output: html_document
editor_options: 
  chunk_output_type: console
---


# (PART) Extra topics in VBA {-}

# Generating random numbers {#mod-vba-random-numbers}

This module gives a short introduction on how to generate random numbers and using them in a simulation. 
__Learning path diagram__

Click/hover the nodes to follow links and see details.


```{=html}
<div id="htmlwidget-c710dd5aa821fbd5aa9a" style="width:100%;height:200px;" class="grViz html-widget"></div>
<script type="application/json" data-for="htmlwidget-c710dd5aa821fbd5aa9a">{"x":{"diagram":"digraph {\n\ngraph [layout = \"neato\",\n       outputorder = \"edgesfirst\",\n       bgcolor = \"white\"]\n\nnode [fontname = \"Helvetica\",\n      fontsize = \"10\",\n      shape = \"circle\",\n      fixedsize = \"true\",\n      width = \"0.5\",\n      style = \"filled\",\n      fillcolor = \"aliceblue\",\n      color = \"gray70\",\n      fontcolor = \"gray50\"]\n\nedge [fontname = \"Helvetica\",\n     fontsize = \"8\",\n     len = \"1.5\",\n     color = \"gray80\",\n     arrowsize = \"0.5\"]\n\n  \"1\" [label = \"📖 Random numbers\", URL = \"#vba-random-numbers\", tooltip = \"Random numbers\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", width = \"0.5\", fillcolor = \"DarkSeaGreen4\", pos = \"2,1!\"] \n  \"2\" [label = \"📖 Simulation\", URL = \"#vba-simulation\", tooltip = \"Simulation\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", width = \"0.5\", fillcolor = \"DarkSeaGreen4\", pos = \"5,1!\"] \n  \"3\" [label = \"💻 Exercises\", URL = \"#ex-vba-random-numbers\", tooltip = \"Exercises\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"egg\", margin = \"0.2\", width = \"0.5\", fillcolor = \"DarkSeaGreen4\", pos = \"8,1!\"] \n  \"4\" [label = \"\", URL = \"\", tooltip = \" \", style = \"filled\", fixedsize = \"true\", fontsize = \"9\", fontcolor = \"white\", penwidth = \"0.5\", fontname = \"Helvetica\", shape = \"rect\", height = \"1\", width = \"6\", fillcolor = \"#F0F8FF\", pos = \"4.1,-0.34!\"] \n  \"5\" [label = \"Color:\", URL = \"\", tooltip = \" \", style = \"filled\", fixedsize = \"true\", fontsize = \"9\", fontcolor = \"black\", penwidth = \"0\", fontname = \"Helvetica\", shape = \"none\", height = \"0\", width = \"0.8\", fillcolor = \"#FFFFFE\", pos = \"1.47,0!\"] \n  \"6\" [label = \"mandatory\", URL = \"\", tooltip = \"Mandatory syllabus.\", style = \"filled\", fixedsize = \"true\", fontsize = \"9\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica\", shape = \"rect\", width = \"0.8\", fillcolor = \"DarkSeaGreen4\", pos = \"1.7,-0.4!\"] \n  \"7\" [label = \"alternative\", URL = \"\", tooltip = \"Alternative syllabus if you prefer another learning style.\", style = \"filled\", fixedsize = \"true\", fontsize = \"9\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica\", shape = \"rect\", width = \"0.8\", fillcolor = \"DarkOrange4\", pos = \"2.7,-0.4!\"] \n  \"8\" [label = \"extra\", URL = \"\", tooltip = \"Extra learning if you are interested (not part of syllabus).\", style = \"filled\", fixedsize = \"true\", fontsize = \"9\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica\", shape = \"rect\", width = \"0.8\", fillcolor = \"PeachPuff3\", pos = \"3.7,-0.4!\"] \n  \"9\" [label = \"Shape:\", URL = \"\", tooltip = \" \", style = \"filled\", fixedsize = \"true\", fontsize = \"9\", fontcolor = \"black\", penwidth = \"0\", fontname = \"Helvetica\", shape = \"none\", height = \"0\", width = \"1\", fillcolor = \"#FFFFFE\", pos = \"4.9,0!\"] \n  \"10\" [label = \"non-interactive\", URL = \"\", tooltip = \"Non-interactive learning content (e.g. reading).\", style = \"filled\", fixedsize = \"true\", fontsize = \"9\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica\", shape = \"rect\", width = \"1\", fillcolor = \"Grey40\", pos = \"5.2,-0.4!\"] \n  \"11\" [label = \"interactive\", URL = \"\", tooltip = \"Interactive learning content (tutorial, exercises etc.).\", style = \"filled\", fixedsize = \"true\", fontsize = \"9\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica\", shape = \"egg\", width = \"1\", fillcolor = \"Grey40\", pos = \"6.45,-0.4!\"] \n\"1\"->\"2\" [color = \"black\", arrowhead = \"vee\"] \n\"2\"->\"3\" [color = \"black\", arrowhead = \"vee\"] \n}","config":{"engine":"dot","options":null}},"evals":[],"jsHooks":[]}</script>
```

## Learning outcomes {#lo-vba-random-numbers}

By the end of this module, you are expected to be able to:

* Describe what a random number is.
* Generate a random number from a distribution.
* Run a simulation and compare/analyse results.


The learning outcomes relate to the [overall learning goals](#lg-course) number 2-4, 8-14 and 16 of the course.

<!-- SOLO increasing: identify · memorise · name · do simple procedure · collect data · -->
<!-- enumerate · describe · interpret · formulate · list · paraphrase · combine · do -->
<!-- algorithms · compare · contrast · explain causes · analyse · relate · derive · -->
<!-- evaluate · apply · argue · theorise · generalise · hypothesise · solve · reflect -->


## Generating random numbers {#vba-random-numbers}

Often we want to model a system where some of the elements are uncertain. To simulate the system we want to generate some random numbers following different distributions. This can be done using the built-in VBA and Excel functions.

Read Sections 18.1 of Chapter 18 in @vba-book. 


## Simulation {#vba-simulation}

Given an uncertain system we simulate the system by constructing a deterministic model (that is we assume the random numbers have some specific values) and algorithms for solving it. Next, random numbers are generated and used to solve the model and store the results. This is repeated a number of times and statistics such as min, mean, standard deviation or max value of a statistic can be found.

Read Sections 18.2 of Chapter 18 in @vba-book. 


## Recap

- Often we want to model a system where some of the elements are uncertain. To simulate the system we want to generate some random numbers following different distributions. This can be done using the built-in VBA and Excel functions.
- Initialize generation of random numbers using 
  ```
  Randomize()     ' chooses a random seed 
  ```
  Or
  ```
  Randomize(100)     ' generate the same random numbers
  ```
  We normally use the first option.
- When generating random numbers in VBA and writing them to the worksheet, they will NOT be changed when the worksheet is updated! Only when the code is executed!
- Examples on some distributions are
   - Uniform between 0 and 1: `Rnd()`
   - Uniform between i and j:  `i + (j - i) * Rnd`
   - Normal distribution: `WorksheetFunction.NormInv(Rnd, dblMean, dblSD)`
   - Binomial distribution: `WorksheetFunction.Binom_Inv(intTrials, dblPr, Rnd)`
- Given an uncertain system we simulate the system by constructing a 
   - Deterministic model (that is we assume the random numbers have some specific values) and algorithms for solving it. 
   - Generate random numbers and used to solve the model and store the results. 
   - Repeat a number of times and calculate statistics such as min, mean and standard deviation.

You may also have a look at the [slides for this module](https://bss-osca.github.io/tfa/slides/03-01_vba-random-numbers-slides.html).


## Exercises {#ex-vba-random-numbers}

Below you will find a set of exercises. Always have a look at the exercises before you meet in your study group and try to solve them yourself. Are you stuck, see the [help page](#help). Some of the solutions to each exercise can be seen by pressing the button at each question. Beware, you will not learn by giving up too early. Put some effort into finding a solution!

### Exercise - Generating random numbers {#ex-vba-generate}

This [file](https://github.com/bss-osca/tfa/blob/master/vba/vba-generate-template.xlsm) should be used as a starting point for this exercise.

   (1) Create a procedure `GenNormal` with arguments `intSize`, `dblMean`, `dblSD`  and `ary`. The procedure must generate `intSize` random numbers from a normal distribution with mean `dblMean` and standard deviation `dblSD`. The procedure must store the values in `ary`.
   (2) Create a procedure `GenUniform` with arguments `intSize`, `dblMin`, `dblMax` and `ary`. The procedure must generate `intSize` random numbers from a uniform distribution in the range `dblMin` to `dblMax`. The procedure must store the values in `ary`.
   (3) Create a procedure `GenBinomial` with arguments `intSize`, `intTrials`, `dblPr` and `ary`. The procedure must generate `intSize` random numbers from a binomial distribution using `intTrials` trials with `dblPr` probability of success. The procedure must store the values in `ary`.
   (4) Create a procedure `GenPoisson` with arguments `intSize`, `dblLambda` and `ary`. The procedure must generate `intSize` random numbers from a poisson distribution with mean `dblLambda`. The procedure must store the values in `ary`. You may use the `PoissonInv` function. 
   (5) Create a procedure `GenDiscrete` with arguments `intSize`, `dblDens` and `ary`. The procedure must generate `intSize` random numbers from a discrete distribution with density `dblDens` (first column in the array contains the outcome and the second the probability). The procedure must store the values in `ary`. You may use the `DiscreteInv` function. 
   (6) Create a procedure `Main` that generate 5000 random numbers of 
       - A normal distribution with mean 100 and standard deviation 20.
       - An uniform distribution with range 10 to 500.
       - A binomial distribution with 100 trials and a 0.2 probability of success.
       - A poisson distribution with mean 5.
       - Plot the results for each distribution using `CreatePlot`.

### Exercise - Traveling salesman problem {#ex-vba-tsp}

This [file](https://github.com/bss-osca/tfa/blob/master/vba/vba-tsp-template.xlsm) should be used as a starting point for this exercise.

The [travelling salesman problem](https://en.wikipedia.org/wiki/Travelling_salesman_problem) (TSP) asks the following question: 

> Given a list of cities and the distances between each pair of the cities, 
> what is the shortest possible route that visits each city exactly once 
> and returns to the origin city?

The problem is an NP-hard problem (worst case solution time grows exponential with the number of cities) in combinatorial optimization, important in theoretical computer science and operations research. The problem was first formulated in 1930 and is one of the most intensively studied problems in optimization. Even though the problem is computationally difficult, many heuristics and exact algorithms are known. 

The goal with this exercise is to test different heuristics on a set of problem instances. To see which one works best.

   (1) Create a procedure `GenTSPData` satisfying:
       - Arguments are `ByRef dblCoord() As Double, Optional intCities As Integer = 0, Optional blnPrint As Boolean = False`.
       - Each city has an id number and a  x and y-coordinate.
       - The generated cities are stored in array `dblCoord` with `intCities` rows and three columns (column 1 store the city id, column 2 the x-coordinate and column 3 the y-coordinate) 
       - The x and y-coordinates are random numbers from an uniform distribution between 0 and 10. 
       - If `blnPrint` is true then coordinates are printed to the main sheet starting in cell A2. 
       - If `intCities` is zero then use an input box to ask for the number of cities.  
   (2) Create a procedure `BtnGenTSPData` that calls `GenTSPData`, ask for the number of cities and print the result to cell A2. A button linking to the procedure has already been created in the template file. 
   (3) Create a procedure `CalcDistArray` satisfying:
       - Arguments are `ByRef dblDist() As Double, dblCoord() As Double` where `dblCoord` are the coordinates found using `GenTSPData`.
       - The distance between two cities are stored in `dblDist`, i.e. `dblDist(i, j)` store the distance between city `i` and `j`.
       - Symmetric distances are assumed, i.e. `dblDist(i, j) = dblDist(j, i)`.
   (4) Create a procedure `SolveTSPIncX` satisfying:
       - Arguments are `dblCoord() As Double, dblDist() As Double, ByRef dblCost As Double, ByRef intSeq() As Integer`
       - Sort the array `dblCoord` increasing in the x-coordinate (you may use the procedure `ArySort` in module `ModuleAry` to do this).
       - Visit the cities in the order of the sorted array and return to the starting city.
       - The visiting city sequence are stored in `intSeq`.
       - The total cost are stored in `dblCost`. You may use the `CalcCost` function to find the total cost.
   (5) Create a procedure `BtnSolveTSPIncX` that calls `SolveTSPIncX` using the TSP data in the Main sheet and print out the total cost in cell H4. A button linking to the procedure has already been created.
   (6) Create a procedure `SolveTSPIncY` satisfying:
       - Arguments are `dblCoord() As Double, dblDist() As Double, ByRef dblCost As Double, ByRef intSeq() As Integer`
       - Sort the array `dblCoord` increasing in the y-coordinate (you may use the procedure `ArySort` in module `ModuleAry` to do this).
       - Visit the cities in the order of the sorted array and return to the starting city.
       - The visiting city sequence are stored in `intSeq`.
       - The total cost are stored in `dblCost`. You may use the `CalcCost` function to find the total cost.
   (7) Create a procedure `BtnSolveTSPIncY` that calls `SolveTSPIncY` using the TSP data in the Main sheet and print out the total cost in cell H8. A button linking to the procedure has already been created.
   (8) Create a procedure `SolveTSPRand` satisfying:
       - Arguments are `dblCoord() As Double, dblDist() As Double, ByRef dblCost As Double, ByRef intSeq() As Integer`
       - Visit the cities in the order of the `dblCoord` array and return to the starting city. This may seen as we visit the cities in random order since generate x and y-coordinate random.
       - The visiting city sequence are stored in `intSeq`.
       - The total cost are stored in `dblCost`. You may use the `CalcCost` function to find the total cost.
   (9) Create a procedure `BtnSolveTSPRand` that calls `SolveTSPRand` using the TSP data in the Main sheet and print out the total cost in cell H11. A button linking to the procedure has already been created.
  (10) Create a procedure `SolveTSPNN` satisfying:
       - Arguments are `dblCoord() As Double, dblDist() As Double, ByRef dblCost As Double, ByRef intSeq() As Integer`
       - Start in city 1.
       - Given the current city find the next city (not already visited) as the city with shortest distance.
       - The visiting city sequence are stored in `intSeq`.
       - The total cost are stored in `dblCost`. You may use the `CalcCost` function to find the total cost.
  (11) Create a procedure `BtnSolveTSPNN` that calls `SolveTSPNN` using the TSP data in the Main sheet and print out the total cost in cell H14. A button linking to the procedure has already been created.
  (12) Create a procedure `Simulation` satisfying:
       - Generate an instance of TSP data with `intCities` cities which are chosen random between 10 and 500.
       - Calculate the distance matrix.
       - Solve the instance using all of the above solutions algorithms.
       - Store the result in a row in the _Simulation_ sheet. 
       - Repeat 100 times and calculate min, mean and max values for each solution algorithm.
       
       Have a look at sheet _Simulation example_ for an example. Note you do not have to print the coordinates out to the _Main_ sheet.
  (13) Which solution algorithm seems to give the shortest total travel distance?
  
  
### Exercise - Dan's bakery {#ex-vba-bakery}

This [file](https://github.com/bss-osca/tfa/blob/master/vba/vba-bakery-template.xlsm) should be used as a starting point for this exercise.

Dan owns a small bakery baking a single cold-rised bread. The demand level $l$ for bread is uncertain and on a given day the demand level equals $l=1$ (low) with probability 0.2, $l=2$ (medium) with probability 0.5 and $l=3$ (high) with probability 0.3. The actual demand (number of customers) depends on the demand level and is Poisson distributed with mean $50 + 20l$. The sales price per bread is 45 DKK and production cost 7 DKK. If a customer arrives and Dan has no bread left then he estimates the loss of goodwill to be 10 DKK. A customer always buy one bread. Dan can have 20 breads in the oven a time and hence always produce a multiple of 20 breads.

   (1) Create a function `Profit` that returns the daily profit given a specific demand and production.
   (2) Create a procedure `Simulate` that simulate the system for $y$ days given that Dan choose to produce $x$ breads each day. Number of runs (days), production, price, production cost, and lost goodwill cost instead of contribution margin and lost goodwill, average profit, standard deviation, min and max profit should be returned in an array. You may use functions `DiscreteInv` and `PoissonInv` to generate numbers.
   (3) Create a procedure `BtnSimulate` that calls `Simulate` for different production levels and output the results in sheet _Simulation_.
   (4) Is it best for Pierre to produce 80 or 120 breads?
   (5) Create a function `OptimalProd` that search for the optimal production using the following steps:
       - Start with production of 20 bread.
       - Calculate the average profit based on 500 simulations.
       - Increase the production with 20 breads unit until no better average profit is found.
       - Return the production found.
   (6) Test it on the data in sheet _OptimalProd_.


  
  

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
