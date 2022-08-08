--- 
title: "Tools for Analytics (TFA)"
subtitle: "Course notes"
author: 
- Lars Relund Nielsen
knit: "bookdown::render_book"
site: bookdown::bookdown_site
url: 'https\://bss-osca.github.io/tfa/'
github-repo: bss-osca/tfa
cover-image: assets/logo.png
documentclass: book
bibliography: [book.bib, packages.bib]
biblio-style: apalike
link-citations: yes
description: "Course notes for the 'Tools for Analytics' course"
favicon: assets/favicon.ico
date: "2022-08-08"
editor_options: 
  chunk_output_type: console
---


            
# Introduction to the course {#mod-intro}







This site contains course notes for the course "Tools for Analytics" held at [Aarhus BSS][BSS]. The notes show the learning path for each week and contain. The course is an introductory course at the [Operations and Supply Chain Analytics programme][osca-programme] and intended to give knowledge about IT tools for Analytics. Expect the notes to be updated when the course runs. The date listed above is the last time the notes was updated.

#### Learning path diagram {-}

Click/hover the nodes to follow links and see details.


```{=html}
<div id="htmlwidget-845ca72f42f8c37dbc3e" style="width:100%;height:150px;" class="grViz html-widget"></div>
<script type="application/json" data-for="htmlwidget-845ca72f42f8c37dbc3e">{"x":{"diagram":"digraph {\n\ngraph [layout = \"neato\",\n       outputorder = \"edgesfirst\",\n       bgcolor = \"white\"]\n\nnode [fontname = \"Helvetica\",\n      fontsize = \"10\",\n      shape = \"circle\",\n      fixedsize = \"true\",\n      width = \"0.5\",\n      style = \"filled\",\n      fillcolor = \"aliceblue\",\n      color = \"gray70\",\n      fontcolor = \"gray50\"]\n\nedge [fontname = \"Helvetica\",\n     fontsize = \"8\",\n     len = \"1.5\",\n     color = \"gray80\",\n     arrowsize = \"0.5\"]\n\n  \"1\" [label = \"📖 Book purpose\", URL = \"#purpose\", tooltip = \"Purpose for the book.\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", fillcolor = \"DarkSeaGreen4\", pos = \"0,2!\"] \n  \"2\" [label = \"📖 R vs Excel/VBA\", URL = \"#r-vs-vba\", tooltip = \"R vs Excel/VBA.\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", fillcolor = \"DarkSeaGreen4\", pos = \"3,2!\"] \n  \"3\" [label = \"📖 How a computer works\", URL = \"#computer\", tooltip = \"How a computer works.\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", fillcolor = \"DarkSeaGreen4\", pos = \"6,2!\"] \n  \"4\" [label = \"📖 Book organization\", URL = \"#organization\", tooltip = \"How this book is organized.\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", fillcolor = \"DarkSeaGreen4\", pos = \"9,2!\"] \n  \"5\" [label = \"📖 What is Business Analytics\", URL = \"sec-ba.html\", tooltip = \"A detailed description of Business Analytics.\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", fillcolor = \"PeachPuff3\", pos = \"0,1!\"] \n\"1\"->\"2\" [color = \"black\", arrowhead = \"vee\"] \n\"1\"->\"5\" [color = \"black\", arrowhead = \"vee\"] \n\"2\"->\"3\" [color = \"black\", arrowhead = \"vee\"] \n\"3\"->\"4\" [color = \"black\", arrowhead = \"vee\"] \n}","config":{"engine":"dot","options":null}},"evals":[],"jsHooks":[]}</script>
```

A detailed description of Business Analytics have been pointed out as an extra supplement in the learning path diagram. You may have a look at it if you like.

## Learning outcomes {#lo-intro}

By the end of this module, you are expected to:

* Memorize the purpose of the course.
* Describe what the term Business Analytics mean.
* Identify pros and cons of using Excel, VBA and R.
* Describe how a computer works.
* Describe what an algorithm is.
* Know how the course is organized.

The learning outcomes relate to the [overall learning goals](#lg-course) number 1, 3 and 5 of the course.

<!-- SOLO increasing: identify · memorise · name · do simple procedure · collect data · -->
<!-- enumerate · describe · interpret · formulate · list · paraphrase · combine · do -->
<!-- algorithms · compare · contrast · explain causes · analyse · relate · derive · -->
<!-- evaluate · apply · argue · theorise · generalise · hypothesise · solve · reflect -->

## Purpose for the course {#purpose}

Since the amount of available data has increased extensively in many companies, there is a need for analysts with the ability to do tasks within Analytics. For instance, extract relevant data and perform valid quantitative analysis. Clearly, it is also important that the analyst can communicate the results of the analysis to their surroundings. This requires for the analyst to be particularly qualified in handling IT based tools beyond e.g. basic Excel. 

Business Analytics (BA) (or just Analytics) refers to the scientific process of transforming data into insight for making better decisions in business. BA can both be seen as the complete decision making process for solving a business problem and the creation of business value by integration of concepts, methods and data. As a process, it can be characterized by descriptive, predictive, and prescriptive model building using data sources. For a full definition see the [appendix](#sec:ba).

Within a Business Analytics (BA) framework the course focuses on giving you an introduction to programming, handeling data and doing descriptive analytics. Descriptive analytics categorizes, characterizes, consolidates, and classifies data. Examples are standard reporting and dashboards (key performance indicators (KPIs), what happened or is happening now?) and ad-hoc reporting (how many/often?). Descriptive analytics often serves as a first step in the successful application of predictive or prescriptive analytics. Predictive and prescriptive analytics are covered in other courses of the [programme][osca-programme].

Analytics may be seen as a data driven process:

<div class="figure" style="text-align: center">
<img src="img/process.png" alt="Analytics as a data driven process." width="658" />
<p class="caption">(\#fig:process)Analytics as a data driven process.</p>
</div>

For doing data driven analytics you first must __import__ your data. That is, take data from a database, file, web API etc. and transform it into a data frame/table. In general raw data may be messy and need to be structured in a __tidy__ way. Tidying your data means storing it in a structured form suitable for analysis. In brief, when your data is __tidy__, each column is a variable, and each row is an observation. Tidy data is important because the consistent structure lets you focus your struggle on questions about the data. 
Once you have tidy data, a common first step is to __transform__ it. Transformation includes narrowing in on observations of interest (e.g. only observations from a specific year or warehouse), creating new variables based on existing variables (e.g. the cost of using the machine that day given idle time). Together, tidying and transforming are called __wrangling__, because 
it can be a hard process to get your data in the right form.

The next step is to do a simple __exploration__ of you data such as calculating a set of summary statistics (like counts, means or KPIs). A good way to get an overview over your data is by __visualization__. A good visualisation will show you things that you did not expect, raise new questions about the data or confirm your hypothesis. A good visualization might also hint that you're asking the wrong question, or you need to collect different data. Exploration and visualization are descriptive analytics and used to answer questions such as: What happened? How many, how often, where? Where exactly is the problem? What actions are needed?
__Models__ are complementary tools to visualization. Once you have made your questions sufficiently precise, you can use a model to answer them. A model is a description of a system using mathematical concepts and a simplification of the real system. That is, the results of a model are based on a set of assumptions. Models for statistical analysis, forecasting, system behavior are predictive analytics and answer questions like: Why is this happening? What if these trends continue? What will happen next? Models for prescriptive analytics use optimization and other decision modeling techniques to suggest decision options with the goal of improving business performance and answer questions like: What is the best that can happen?

Exploration, visualization and modeling may be seen as different steps which can be used for __analyzing__ the data and answer the overall questions. This course will focus on the two first steps. 

Given an analysis, __communication__ is an absolutely critical part. It does not matter how well your models and visualization have led you to understand the data unless you can also communicate your results to decision makers. 

Note that analytics is not a one-way process, it is common that you several times have to tidy and transform your data, explore and visualize based on the results of a model, rerun the model based on feedback from the decision makers etc. Common connections are visualized using directed arrows in Figure \@ref(fig:process). 

Surrounding the process is __programming__. Programming is the Swiss army knife you use during parts of the process. An introduction to programming is given using both VBA in Excel and the programming language and free software environment [R]. Programming focus on writing algorithms. An __algorithm__ is a finite sequence of well-defined instructions to solve a specific problem or to perform a computation. That is, we use a programming language to program an algorithm that solves a specific task, e.g. find the best route, sort words, make a plot, etc.

## R vs Excel/VBA {#r-vs-vba}

This course gives you an introduction to programming using both VBA and R. The two programming languages are different and here are some comparisons:

__Excel__ 

Pros:

  * Initial learning curve is quite minimal.
  * Analysis can be done via point-and-click. 
  * Useful for fast analysis (you can change a cell and see effects on other cells, plots etc.)
  * It is not exceedingly hard to make basic graphs and charts. 
  * Data can be stored inside the sheets.

Cons:

  * The mixture of data entries, analysis, and visualization makes it easy to confuse cells that contain raw data from those that are the product of analysis.
  * The analysis directly manipulates the only copy of the raw data.
  * Using mouse clicks means that a mistaken click or drag action can lead to errors or the overwriting of data.
  * Do not handle non-tabular data well.

__VBA__

VBA is a [compiled language](https://en.wikipedia.org/wiki/Compiled_language) implemented using compilers (translators that generate machine code from source code). That is, code need to be compiled first before running it.

Pros: 

  * Can be used inside MS Office applications e.g. Excel.
  * Already contained in Excel, i.e. if you have Excel installed you can start coding.
  * The VBA code is stored within the spreadsheet, allowing any user with access to the spreadsheet to easily run the code.
  * VBA is easy to learn. Especially if you are already experienced in Excel.
  * Good for automating tasks in Excel.
  * Still used in many companies.

Cons:

  * A programming language, meaning the initial learning curve is steeper.
  * It will take you some time to become familiar with the interface and master the various functions. 
  * Since a compiled language, compiling code may take time.
  * Powerful inside Excel but other programming languages are better to learn for general tasks.
  * An old programming language (Microsoft stopped investing in VBA in 2008).

__R__

R is an [interpreted language](https://en.wikipedia.org/wiki/Interpreter_(computing)) with step-by-step execution of source code (no pre-runtime translation takes place) from the command line or using a script file.

Pros: 

  * There is a clear division between data entry and analysis. You import the data, create an object that is a copy of the raw data and do manipulations on this copy. That is, the original data are never altered in any way and there is no way to mess up the raw data. 
  * Manipulating a copy of the data enables you to experiment. A line of code that fails to produce the expected result can be tweaked and rerun.
  * All manipulations can be done in code.
  * The process of analysis are easily reproduced by the code. That is, the use of code for data analysis enables the creation of more reproducible research.    
  * With code all analysis is documented instead of being hidden behind mouse clicks. 
  * Saving analysis in code has the immediate benefit that it can be easily rerun anytime that new data is added or the code can also be applied to a completely new data set. 
  * Free and with a large community that promotes sharing of libraries for data analysis.
  * Can produce complex and advanced data visualizations.

Cons:

  * R is a  programming language, meaning the initial learning curve is steeper. 
  * It will take you some time to become familiar with the interface and master the various functions. 


## How a computer works {#computer}

As a prerequisite for this course you need some basic knowledge about what a computer is. Have a look at these [slides](https://www.cs.princeton.edu/courses/archive/fall11/cos109/02inside.pdf) or this [video](https://youtu.be/p3q5zWCw8J4).


## How the notes are organized {#organization}

Module \@ref(mod-intro) (this module) gives a short introduction to the course. The course notes consists of different parts each containing teaching modules about specific topics:

   * [Part I](#mod-vba-intro) consider tools for analytics using VBA in Excel (mainly programming). Module \@ref(mod-vba-intro) gives you an introduction to VBA so you can get started programming. In Module \@ref(mod-vba-loops-cond) loop and conditional statements are introduced and Module \@ref(mod-vba-procedures) focus on how to make procedures. Next, we consider advanced data types and usage in Module \@ref(mod-vba-datatypes). Finally, Module \@ref(#mod-vba-random-numbers) considers generation of random numbers in VBA and how they can be used for simulation. 

   * [Part II](#mod-r-install) consider tools for analytics using R. 
   
   <!-- focuses on helping you install the needed programs on your computer (Module \@ref(mod-r-install)) and gives you a short introduction to R (Module \@ref(mod-r-workflow)). -->
   <!-- * [Part VI](#mod-r-loops-cond) gives you an overview over programming in R including loops and conditionals (Module \@ref(mod-r-loops-cond)) and functions (Module \@ref(mod-r-functions)). -->

   <!-- * [Part VII](#mod-r-tidyverse-intro) the focus is on import/export, tidy and transformation of data. Module \@ref(mod-r-tidyverse-intro) first gives you an introduction to the [tidyverse][tidyverse-main-page] packages and introduces you to literal programming using R Markdown. Next, Module \@ref(mod-r-io) shows you how to export and import data. Finally, Module \@ref(mod-r-transform) focuses on transformation of data. -->
   <!-- * [Part VIII](#mod-r-plot) considers visualization of data in R (Module \@ref(mod-r-plot)). -->
   <!-- * [Part IX](#mod-project) presents the mandatory R project. -->
   <!-- * [Part X](#mod-r-maps) contains extra modules useful when coding in R.  -->

The appendix contains different modules that may be helpful for you including hints on [how to work in groups](#groups), [how to get help](#help) if you are stuck and [how to annotate](#annotate) the course notes.
   


## Acknowledgements {#ack} 

Some of the materials in these notes are taken from various places

* The bookdown skeleton and some notes are based on the [Stat545][stat-545] course.
* Some parts in Module \@ref(mod-intro) are inspired by [Chapter 1](https://r4ds.had.co.nz/introduction.html) in @r4ds.
* The VBA modules are inspired by the book @vba-book. This also holds for some of the exercises. 
* Module \@ref(mod-r-install) is inspired by [Chapter 1](https://stat545.com/block000_r-rstudio-install.html) in @stat545.
* Module \@ref(mod-r-workflow) is using some text and images from [Chapter 1](https://moderndive.netlify.app/1-getting-started.html) in @moderndrive and [Chapter 2](https://stat545.com/block002_hello-r-workspace-wd-project.html) in @stat545. A few exercises are inspired by [Chapter 2](https://rafalab.github.io/dsbook/r-basics.html) in @dsbook.
* Notes about git and GitHub in the appendix are based on @hgit.
* Exercise \@ref(ex-gapminder1) is a revision of Chapters 6-7 in @stat545.
* Exercise \@ref(ex-babynames1) is a revision of [Session 3](https://github.com/rstudio-education/welcome-to-the-tidyverse/blob/master/03-Transform/03-Transform-Exercises.Rmd) in the [Welcome to the tidyverse][course-welcome-to-the-tidyverse] course.
* Exercise \@ref(ex-gapminder2) is a revision of [Chapter 9](https://rafalab.github.io/dsbook/gapminder.html) in @dsbook.
* Exercise \@ref(ex-covid19) is inspired by the COVID19 application [exercise](https://raw.githubusercontent.com/rstudio-education/datascience-box/master/course-materials/application-exercises/ae-01b-covid/covid.Rmd) at the [data science in a box](https://github.com/rstudio-education/datascience-box) course.
* Exercise \@ref(ex-lego) is inspired by the Lego homework [exercise](https://github.com/rstudio-education/datascience-box/blob/master/course-materials/hw-instructions/hw-04/hw-04-legos-instructors.Rmd) at the [data science in a box](https://github.com/rstudio-education/datascience-box) course.
* Exercise \@ref(ex-fish) is inspired by the Fisheries application [exercise](https://github.com/rstudio-education/datascience-box/blob/master/course-materials/application-exercises/ae-05-fisheries-datajoins/fisheries.Rmd) at the [data science in a box](https://github.com/rstudio-education/datascience-box) course.




I would like to thank all for their inspiration. Also thanks to Solveig for proofreading the draft. 

This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/).


## Exercises {#ex-intro}

### Exercise - How to annotate {#ex-annotate}

The online course notes can be annotated using [hypothes.is]. You can create both private and public annotations. Collaborative annotation helps people connect to each other and what they’re reading, even when they’re keeping their distance. You may also use public notes to help indicate spell errors, unclear content etc. in the notes. 

<!-- <img src="img/annotate.png" align="right" alt="Hypothes.is icons" title="Hypothes.is icons" style = "float: right; margin: 0 0 0 15px;"> -->

   1) Sign-up at [hypothes.is]. If you are using Chrome you may also install the [Chrome extension](https://chrome.google.com/webstore/detail/hypothesis-web-pdf-annota/bjfhmglciegochdpefhhlphglcehbmek).
   2) Go back to this page and login in the upper right corner (there should be some icons e.g. `<`).
   3) Select some text and try to annotate it using both a private and public annotation (you may delete it again afterwards). 
   4) Go to the [slides for this module](https://bss-osca.github.io/tfa/slides/01_intro-slides.html#9) and try to annotate the page with a private comment. 
   

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
