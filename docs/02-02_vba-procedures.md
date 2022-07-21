---
output: html_document
editor_options: 
  chunk_output_type: console
---


# Procedures {#mod-vba-procedures}

This module gives a short introduction to procedures. In general syllabus will point to chapters in @vba-book; however, there is a lot for videos about VBA online such as course [14-Hour VBA Course][vba-yt-course2]. You may have a look at these videos instead if you prefer a different learning style. In the learning path diagram, links to alternative online content will be pointed out. Note this is alternatives to the standard learning path that you may use instead. The learning path may also have extra content that is not a part of syllabus you can have a look at.

__Learning path diagram__

Click/hover the nodes to follow links and see details.


```{=html}
<div id="htmlwidget-9755cb91c02089795994" style="width:100%;height:400px;" class="grViz html-widget"></div>
<script type="application/json" data-for="htmlwidget-9755cb91c02089795994">{"x":{"diagram":"digraph {\n\ngraph [layout = \"neato\",\n       outputorder = \"edgesfirst\",\n       bgcolor = \"white\"]\n\nnode [fontname = \"Helvetica\",\n      fontsize = \"10\",\n      shape = \"circle\",\n      fixedsize = \"true\",\n      width = \"0.5\",\n      style = \"filled\",\n      fillcolor = \"aliceblue\",\n      color = \"gray70\",\n      fontcolor = \"gray50\"]\n\nedge [fontname = \"Helvetica\",\n     fontsize = \"8\",\n     len = \"1.5\",\n     color = \"gray80\",\n     arrowsize = \"0.5\"]\n\n  \"1\" [label = \"📖 Procedures\", URL = \"#vba-procedures\", tooltip = \"Procedures\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", width = \"0.5\", fillcolor = \"DarkSeaGreen4\", pos = \"2,1!\"] \n  \"2\" [label = \"📖 How do I debug my code?\", URL = \"#vba-debug\", tooltip = \"How do I debug my code?\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", width = \"0.5\", fillcolor = \"DarkSeaGreen4\", pos = \"5,1!\"] \n  \"3\" [label = \"💻 Exercises\", URL = \"#ex-vba-procedures\", tooltip = \"Exercises\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"egg\", margin = \"0.2\", width = \"0.5\", fillcolor = \"DarkSeaGreen4\", pos = \"8,1!\"] \n  \"4\" [label = \"🎬 Subs and parameters\", URL = \"https://youtu.be/aoueDZDh0D4\", tooltip = \"Subs and parameters\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", width = \"0.5\", fillcolor = \"PeachPuff3\", pos = \"2,2!\"] \n  \"5\" [label = \"🎬 Functions\", URL = \"https://youtu.be/1rK_WVYn2oQ\", tooltip = \"Functions\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", width = \"0.5\", fillcolor = \"PeachPuff3\", pos = \"2,3!\"] \n  \"6\" [label = \"🎬 Debug toolbar\", URL = \"https://youtu.be/AONXBZdx20Y\", tooltip = \"Debug toolbar\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", width = \"0.5\", fillcolor = \"PeachPuff3\", pos = \"4,2!\"] \n  \"7\" [label = \"🎬 Locals window\", URL = \"https://youtu.be/BC8py7Ce2rg\", tooltip = \"Locals window\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", width = \"0.5\", fillcolor = \"PeachPuff3\", pos = \"4,3!\"] \n  \"8\" [label = \"🎬 Breakpoints\", URL = \"https://youtu.be/k_1zrFdlZCU\", tooltip = \"Breakpoints\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", width = \"0.5\", fillcolor = \"PeachPuff3\", pos = \"4,4!\"] \n  \"9\" [label = \"📖 Chapter 9 in\\nWøhlk (2010)\", URL = \"\", tooltip = \"Chapter 9 in Wøhlk (2010)\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", width = \"0.5\", fillcolor = \"PeachPuff3\", pos = \"6,2!\"] \n  \"10\" [label = \"\", URL = \"\", tooltip = \" \", style = \"filled\", fixedsize = \"true\", fontsize = \"9\", fontcolor = \"white\", penwidth = \"0.5\", fontname = \"Helvetica\", shape = \"rect\", height = \"1\", width = \"6\", fillcolor = \"#F0F8FF\", pos = \"4,-0.14!\"] \n  \"11\" [label = \"Color:\", URL = \"\", tooltip = \" \", style = \"filled\", fixedsize = \"true\", fontsize = \"9\", fontcolor = \"black\", penwidth = \"0\", fontname = \"Helvetica\", shape = \"none\", height = \"0\", width = \"0.8\", fillcolor = \"#FFFFFE\", pos = \"1.37,0.2!\"] \n  \"12\" [label = \"mandatory\", URL = \"\", tooltip = \"Mandatory syllabus.\", style = \"filled\", fixedsize = \"true\", fontsize = \"9\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica\", shape = \"rect\", width = \"0.8\", fillcolor = \"DarkSeaGreen4\", pos = \"1.6,-0.2!\"] \n  \"13\" [label = \"alternative\", URL = \"\", tooltip = \"Alternative syllabus if you prefer another learning style.\", style = \"filled\", fixedsize = \"true\", fontsize = \"9\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica\", shape = \"rect\", width = \"0.8\", fillcolor = \"DarkOrange4\", pos = \"2.6,-0.2!\"] \n  \"14\" [label = \"extra\", URL = \"\", tooltip = \"Extra learning if you are interested (not part of syllabus).\", style = \"filled\", fixedsize = \"true\", fontsize = \"9\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica\", shape = \"rect\", width = \"0.8\", fillcolor = \"PeachPuff3\", pos = \"3.6,-0.2!\"] \n  \"15\" [label = \"Shape:\", URL = \"\", tooltip = \" \", style = \"filled\", fixedsize = \"true\", fontsize = \"9\", fontcolor = \"black\", penwidth = \"0\", fontname = \"Helvetica\", shape = \"none\", height = \"0\", width = \"1\", fillcolor = \"#FFFFFE\", pos = \"4.8,0.2!\"] \n  \"16\" [label = \"non-interactive\", URL = \"\", tooltip = \"Non-interactive learning content (e.g. reading).\", style = \"filled\", fixedsize = \"true\", fontsize = \"9\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica\", shape = \"rect\", width = \"1\", fillcolor = \"Grey40\", pos = \"5.1,-0.2!\"] \n  \"17\" [label = \"interactive\", URL = \"\", tooltip = \"Interactive learning content (tutorial, exercises etc.).\", style = \"filled\", fixedsize = \"true\", fontsize = \"9\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica\", shape = \"egg\", width = \"1\", fillcolor = \"Grey40\", pos = \"6.35,-0.2!\"] \n\"1\"->\"2\" [color = \"black\", arrowhead = \"vee\"] \n\"1\"->\"4\" [color = \"black\", arrowhead = \"vee\"] \n\"2\"->\"3\" [color = \"black\", arrowhead = \"vee\"] \n\"2\"->\"9\" [color = \"black\", arrowhead = \"vee\"] \n\"2\"->\"6\" [color = \"black\", arrowhead = \"vee\"] \n\"4\"->\"5\" [color = \"black\", arrowhead = \"vee\"] \n\"6\"->\"7\" [color = \"black\", arrowhead = \"vee\"] \n\"7\"->\"8\" [color = \"black\", arrowhead = \"vee\"] \n}","config":{"engine":"dot","options":null}},"evals":[],"jsHooks":[]}</script>
```

## Learning outcomes {#lo-vba-procedures}

By the end of this module, you are expected to be able to:

* Describe what a procedure is.
* Explain what kind of procedures there are in VBA and what they can be used for.
* Declare and call a procedure.
* Explain what the difference is by using input arguments _by reference_ or _by value_ in a procedure. 
* Set the scope of a procedure using private or public procedures.
* Set default input arguments.
* Call built-in functions for VBA and Excel.

The learning outcomes relate to the [overall learning goals](#lg-course) number 1, 2, 4, 8 and 9 of the course.

<!-- SOLO increasing: identify · memorise · name · do simple procedure · collect data · -->
<!-- enumerate · describe · interpret · formulate · list · paraphrase · combine · do -->
<!-- algorithms · compare · contrast · explain causes · analyse · relate · derive · -->
<!-- evaluate · apply · argue · theorise · generalise · hypothesise · solve · reflect -->


## Procedures {#vba-procedures}

A procedure is a piece of code stored in a module which contains a series of computational steps that will be carried out when the procedure is called. VBA has two kinds of procedures: subs and functions.
  
Read Chapter 5 in @vba-book. You may also have a look at the extra videos as listed in the learning path diagram.


## How do I debug my code? {#vba-debug}

You debug you code to find errors and correct bugs in your program. VBA has a built-in debugger that you may use to step though you code and check if the values in memory are correct. You start and use the debugger using the debugger buttons in the VBA editor, e.g. set the cursor in the top of a sub and press the **Step Into** button (<svg viewBox="0 0 448 512" style="height:1em;position:relative;display:inline-block;top:.1em;" xmlns="http://www.w3.org/2000/svg">  <path d="M0 93.7l183.6-25.3v177.4H0V93.7zm0 324.6l183.6 25.3V268.4H0v149.9zm203.8 28L448 480V268.4H203.8v177.9zm0-380.6v180.1H448V32L203.8 65.7z"></path></svg> F8, <svg viewBox="0 0 384 512" style="height:1em;position:relative;display:inline-block;top:.1em;" xmlns="http://www.w3.org/2000/svg">  <path d="M318.7 268.7c-.2-36.7 16.4-64.4 50-84.8-18.8-26.9-47.2-41.7-84.7-44.6-35.5-2.8-74.3 20.7-88.5 20.7-15 0-49.4-19.7-76.4-19.7C63.3 141.2 4 184.8 4 273.5q0 39.3 14.4 81.2c12.8 36.7 59 126.7 107.2 125.2 25.2-.6 43-17.9 75.8-17.9 31.8 0 48.3 17.9 76.4 17.9 48.6-.7 90.4-82.5 102.6-119.3-65.2-30.7-61.7-90-61.7-91.9zm-56.6-164.2c27.3-32.4 24.8-61.9 24-72.5-24.1 1.4-52 16.4-67.9 34.9-17.5 19.8-27.8 44.3-25.6 71.9 26.1 2 49.9-11.4 69.5-34.3z"></path></svg> ⇧⌘I). You can now repeatedly press the button to step though the code. 

In the **Locals** window you can see the values of the variables as you run you code. In the **Immediate** window you can add output using the [`Debug.Print`](https://www.automateexcel.com/vba/debug-print-immediate-window/) and test code.  

Finally, if you want to run the program until a specific line or code then insert a break-point by clicking the margin of that line in the VBA editor. Next, run you sub and the debugger will stop at that line. 

For more details you may have a look at Chapter 9 in @vba-book or the videos as listed in the learning path diagram.



## Recap

- A procedure is a piece of code stored in a module. 
- A procedure contains a series of computational steps that will be carried out when the procedure is called. 
- VBA has two kinds of procedures:
  
  Subs:
  - Can make changes to the worksheet.
  - Can modify its surroundings.
  - Can be executed by a button (if no arguments).
  - Cannot return anything.
  
  
  Functions:
  - Can return something.
  - Can be used in Excel.
  - Cannot be used as a macro.


- You declare a procedure using
  ```
  Sub MySub(arg1 As {datatype}, arg2 As {datatype})
    ' Some code
  End Sub
  
  Function MyFunction(arg1 As {datatype}, arg2 As {datatype}) As {return datatype}
    ' Some code
    MyFunciton = value  ' assign a return value to the function
  End Sub
  ```
- You can use `Exit Sub`/`Exit Function` to exit the sub/function early in the code.
- Procedures can be either public or private:
  - Public (default): Can be used from other modules, from other files and from Excel.
    ```
    Public Sub MySub()
    ...
    End Sub
    ```
  - Private: Can only be used from within its own module.
    ```
    Private Sub MySub()
    ...
    End Sub
    ```
- Use the `Call` keyword to call a sub:
  ```
  Call MySub(arg1, arg2)
  ```
- Call a function by assigning its return value to a variable
  ```
  result = MyFunction(arg1, arg2)
  ```
- There are two ways of passing arguments to procedures:
  ```
  Sub MySub(ByRef arg1 As {datatype}, ByVal arg2 As {datatype})
    ' Some code
  End Sub
  ```
  - Argument `arg1` is passed **by reference** (default). That is, no new memory is allocated when the procedure is called and hence the procedure can have changed the value of `arg1` when the procedure stops. 
  - Since the default is `ByRef`, the result is the same if we omitted the keyword `ByRef`. 
  - Argument `arg2` is passed **by value**. That is, a copy of the variable is created in memory with local scope. Hence the procedure cannot change the value of `arg2` when the procedure stops (the local variables is deleted). 

  - Using `ByRef` is faster and saves memory since we do not have to allocate new memory. 
  - We may use `ByRef` to return updated values of the input arguments e.g calling a sub `ReadArrays` that takes an unallocated array as input and afterwards the arrays has been allocated and values from a sheet stored in the array. 
- Use the `Optional` keyword to indicate default input arguments:
  ```
  Sub MySub(arg1 As {datatype}, Optional arg2 As {datatype} = defaultValue)  
  ```
  You can now call the procedure using:
  ```
  Call MySub(arg1)  ' assume that arg2 = defaultValue
  ```
  Every parameter following an optional parameter in the procedure definition must also be optional.
- VBA has a set of [built-in functions](https://bettersolutions.com/vba/functions/complete-list.htm) such as `Abs`, `Log` and `Date`. You call them by just writing their name:
  ```
  dtm as Date
  dtm = Date()
  ```
- You can also use the [worksheet functions](https://docs.microsoft.com/en-us/office/vba/excel/concepts/events-worksheetfunctions-shapes/list-of-worksheet-functions-available-to-visual-basic) in Excel. You call them using the `WorksheetFunction` object:
  ```
  sum = WorksheetFunction.Sum(Range("A1:D5"))
  ```
  
You may also have a look at the [slides for this module](https://bss-osca.github.io/tfa/slides/02-02_vba-procedures-slides.html).


## Exercises {#ex-vba-procedures}

Below you will find a set of exercises. Always have a look at the exercises before you meet in your study group and try to solve them yourself. Are you stuck, see the [help page](#help). Some of the solutions to each exercise can be seen by pressing the button at each question. Beware, you will not learn by giving up too early. Put some effort into finding a solution!

### Exercise - Subs {#ex-vba-subs}

The [file](https://github.com/bss-osca/tfa/blob/master/vba/vba-subs-template.xlsm) may be used as a starting point for this exercise. 

   (1) Create a sub `GetMsg` that takes a string and a Boolean as input and create a message box with the string content if the Boolean is true. Test the procedure using the `TestGetMsg` sub.
   (2) Modify the procedure so the Boolean have a default value equal to true.
   (3) Create a sub `PrintNameAge` that takes two arguments as input (name and age) and create a message box with the persons name and age.
   (4) Write a sub `TestPrintNameAge` that uses two input boxes to ask for name and age and then call sub `PrintNameAge`.

### Exercise - Functions {#ex-vba-functions}

The [file](https://github.com/bss-osca/tfa/blob/master/vba/vba-functions-template.xlsm) may be used as a starting point for this exercise. 

   (1) Write a function `Discount` which takes a two input arguments (doubles): the discount percentage and the amount and returns the discounted value. Have a look at the unfinished sub `Discount` for hints. Note the comments describing the function using the [coding convention](#coding-convention).
   (2) Write a function `Larger` which takes two integer arguments and returns true if the first is larger than the last; otherwise false.
   (3) Write a function `NumbDays` that takes a date as argument and return the number of days from today. Hint: Have a look at the `DateDiff` function. 
   
Test all the functions in the _Testing_ sheet.

   (4) Write a sub that uses an input box to ask for an amount a then returns the discounted amount when the discount is 20%. The sub should use the function in Question 1. Create a button running the sub. 

### Exercise - Worksheet functions {#ex-vba-worksheet-functions}

The [file](https://github.com/bss-osca/tfa/blob/master/vba/vba-worksheet-functions-template.xlsm) contains a procedure to generate a set of numbers.

Create a procedure `Summary` that uses worksheet functions to:

- Find the maximum number and write it to cell D1. 
- Find the minimum number and write it to cell D2. 
- Find the sum of the numbers and write it to cell D3. 
- Count the number of positives and write it to cell D4.
- Find the row number with maximum value and write it to cell D5. 

Google is a good place to start if you want to find a specific Excel function, e.g. try to search 'excel row with max value'.

### Exercise - `ByRef` {#ex-vba-byref}

The [file](https://github.com/bss-osca/tfa/blob/master/vba/vba-byref-template.xlsm) should be used as a starting point for this exercise. 

  (1) Create a procedure `AryToVal` satisfying:
      - Arguments are `ByRef ary As Variant, value As Variant`.
      - All entries in the array are set to `value`. 
      - The procedure work both if the dimension of the array is 1 or 2. You may use `AryDim` to find the dimension.
      
      Test the procedure using the `Main` procedure.
  (2) Create a procedure `AryToValByVal` equal to `AryToVal` except that arguments are `ByVal ary As Variant, value As Variant`. Test the procedure using the `Main` procedure. What is the difference?
  (3) Create a procedure `AryToSeq` satisfying:
      - Arguments are `ByRef ary As Variant, lngFrom As Long, lngTo As Long, Optional lngIdx As Long = 1`.
      - Entries in the array is set to values `lngFrom` to `lngTo`.
      - Use `ReDim` to resize the array.
     
      Test the procedure using the `Main` procedure.
  (4) Create a procedure `AryRead` satisfying:
      - Arguments are `ByRef ary As Variant, ByRef rng As Range, Optional intStartIdx1 As Integer = 1, Optional intStartIdx2 As Integer = 1`
      - Entries in the range `rng` are stored in the array `ary`. 
      - Use `ReDim` to resize the array.
     
      Test the procedure using the `Main` procedure.



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
