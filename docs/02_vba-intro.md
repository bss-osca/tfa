---
output: html_document
editor_options: 
  chunk_output_type: console
---






# (PART) VBA {-}


# An introduction to VBA {#mod-vba-intro}

This module gives a short introduction to VBA, so you can get started programming and run your code.


```{=html}
<div>
A template with VBA code for this module is given in the file
<a href="https://github.com/bss-osca/tfa/blob/master/vba/02-vba-intro-template.xlsm" target="_blank">02-vba-intro-template.xlsm</a>
(open it and use it while reading the notes). Have a look inside the module
<i>TM2_ex</i>
in the VBA editor for examples used in the notes and during lectures. Have a look at module
<i>TM2_exercises</i>
for exercises. The template file for next teaching module will contain guiding answers for the exercises to this teaching module.
</div>
```

#### Learning path diagram {-}

Click/hover the nodes to follow links and see details.


```{=html}
<div id="htmlwidget-5b891b0e6cc0fb02f238" style="width:100%;height:300px;" class="grViz html-widget"></div>
<script type="application/json" data-for="htmlwidget-5b891b0e6cc0fb02f238">{"x":{"diagram":"digraph {\n\ngraph [layout = \"neato\",\n       outputorder = \"edgesfirst\",\n       bgcolor = \"white\"]\n\nnode [fontname = \"Helvetica\",\n      fontsize = \"10\",\n      shape = \"circle\",\n      fixedsize = \"true\",\n      width = \"0.5\",\n      style = \"filled\",\n      fillcolor = \"aliceblue\",\n      color = \"gray70\",\n      fontcolor = \"gray50\"]\n\nedge [fontname = \"Helvetica\",\n     fontsize = \"8\",\n     len = \"1.5\",\n     color = \"gray80\",\n     arrowsize = \"0.5\"]\n\n  \"1\" [label = \"📖 What is VBA\", URL = \"#vba-what\", tooltip = \"\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", fillcolor = \"DarkSeaGreen4\", pos = \"0,6!\"] \n  \"2\" [label = \"💡 Setup Excel for VBA\", URL = \"#vba-setup\", tooltip = \"\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"egg\", margin = \"0.2\", fillcolor = \"DarkSeaGreen4\", pos = \"2.5,6!\"] \n  \"3\" [label = \"💡 Your first program\", URL = \"#vba-hello\", tooltip = \"\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"egg\", margin = \"0.2\", fillcolor = \"DarkSeaGreen4\", pos = \"6,6!\"] \n  \"4\" [label = \"💡 The macro recorder\", URL = \"#vba-macro\", tooltip = \"\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"egg\", margin = \"0.2\", fillcolor = \"DarkSeaGreen4\", pos = \"9.5,6!\"] \n  \"5\" [label = \"💡 VBA a short overview\", URL = \"#vba-overview\", tooltip = \"\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"egg\", margin = \"0.2\", fillcolor = \"DarkSeaGreen4\", pos = \"13,6!\"] \n  \"6\" [label = \"📖 Good coding pratice\", URL = \"#vba-coding-practice\", tooltip = \"\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", fillcolor = \"DarkSeaGreen4\", pos = \"16,6!\"] \n  \"7\" [label = \"💻 Exercises\", URL = \"#ex-vba-intro\", tooltip = \"\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"egg\", margin = \"0.2\", fillcolor = \"DarkSeaGreen4\", pos = \"18.5,6!\"] \n  \"8\" [label = \"🎬 Developer Tab\", URL = \"https://youtu.be/awEOUaw9q58\", tooltip = \"A short intro to the developer tab.\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", fillcolor = \"PeachPuff3\", pos = \"2.5,5!\"] \n  \"9\" [label = \"🎬 The VBA Editor\", URL = \"https://youtu.be/utfS_8sWfF8\", tooltip = \"A short intro to the VBA editor.\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", fillcolor = \"PeachPuff3\", pos = \"2.5,4!\"] \n  \"10\" [label = \"🎬 The Project Explorer\", URL = \"https://youtu.be/fp6PTbU7bXo\", tooltip = \"A short intro to the project explorer.\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", fillcolor = \"PeachPuff3\", pos = \"2.5,3!\"] \n  \"11\" [label = \"🎬 The Properties Window\", URL = \"https://youtu.be/ks2QYKAd9Xw\", tooltip = \"A short intro to the properties window.\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", fillcolor = \"PeachPuff3\", pos = \"2.5,2!\"] \n  \"12\" [label = \"🎬 Your First Macro\", URL = \"https://youtu.be/EQ6tDWBc8G4\", tooltip = \"How to write a sub procedure (macro).\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", fillcolor = \"PeachPuff3\", pos = \"6,5!\"] \n  \"13\" [label = \"🎬 The macro recorder\", URL = \"https://youtu.be/J42AlhUGHH8\", tooltip = \"An introduction to the macro recorder.\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", fillcolor = \"PeachPuff3\", pos = \"9.5,5!\"] \n\"1\"->\"2\" [color = \"black\", arrowhead = \"vee\"] \n\"2\"->\"3\" [color = \"black\", arrowhead = \"vee\"] \n\"2\"->\"8\" [color = \"black\", arrowhead = \"vee\"] \n\"3\"->\"4\" [color = \"black\", arrowhead = \"vee\"] \n\"3\"->\"12\" [color = \"black\", arrowhead = \"vee\"] \n\"4\"->\"5\" [color = \"black\", arrowhead = \"vee\"] \n\"4\"->\"13\" [color = \"black\", arrowhead = \"vee\"] \n\"5\"->\"6\" [color = \"black\", arrowhead = \"vee\"] \n\"6\"->\"7\" [color = \"black\", arrowhead = \"vee\"] \n\"8\"->\"9\" [color = \"black\", arrowhead = \"vee\"] \n\"9\"->\"10\" [color = \"black\", arrowhead = \"vee\"] \n\"10\"->\"11\" [color = \"black\", arrowhead = \"vee\"] \n}","config":{"engine":"dot","options":null}},"evals":[],"jsHooks":[]}</script>
```

If you like a different learning style there is a lot for videos about VBA online such as course [14-Hour VBA Course][vba-yt-course2]. The videos have been pointed out as extra online supplements in the learning path diagram. However, they are not necessary for the course. Since Excel change as new versions arrive and it work on different operating systems, the look in the screenshots and videos might be a bit different from your version. However, you still should be able to understand it. 

## Learning outcomes {#lo-vba-intro}

By the end of this module, you are expected to:

* Describe what VBA is.
* Setup Excel for VBA.
* Know how the macro recorder works.
* Make your first program.
* Have an overview over what VBA can do.
* Describe what a variable is.
* Name different data types and how they effect memory size.
* Declare a variable as a data type.
* Make a simple procedure.
* Do simple loops and conditional statements.
* Recorded you first macro using the macro recorder

The learning outcomes relate to the [overall learning goals](#lg-course) number 2 and 4 of the course.

<!-- SOLO increasing: identify · memorise · name · do simple procedure · collect data · -->
<!-- enumerate · describe · interpret · formulate · list · paraphrase · combine · do -->
<!-- algorithms · compare · contrast · explain causes · analyse · relate · derive · -->
<!-- evaluate · apply · argue · theorise · generalise · hypothesise · solve · reflect -->

## What is VBA {#vba-what}

Visual Basic for Applications (VBA) is an implementation of the BASIC programming language intended to control and automate Microsoft Office applications, developed by Microsoft. For instance, you can automatically create sheets, delete objects, create user-defined functions or read/write data to a sheet. It is not a standalone program, it can only run in the host application. In this course we will focus on running VBA from Excel. VBA is widely used in the industry (specially linked to Excel) and easy to learn. Microsoft stopped investing in VBA in 2008. It only update it for small changes. However, VBA is still a vital part of desktop Office applications, and will continue to be so in the future. 

VBA is a [compiled language](https://en.wikipedia.org/wiki/Compiled_language#:~:text=A%20compiled%20language%20is%20a,%2Druntime%20translation%20takes%20place) implemented using compilers (translators that generate machine code from source code). That is, code need to be compiled first before running it. You can only run VBA using the desktop version of Excel. That is, you can't create, run, or edit VBA in Excel for the web. 

With VBA you can extend Excel and automate tasks by coding different algorithms that for instance can be run by pressing a button. Since VBA is a programming language, the initial learning curve is steeper compared to Excel. However, you will get started fast because you already know Excel.


## Setup Excel for VBA {#vba-setup}

For running VBA code the **Developer** tab needs to be visible in Excel. This can be done by check marking the **Developer** tab under the 'Ribbon and Toolbar' options in Excel. You add it by choosing **Excel -> Preferences -> Ribbon and toolbar** (<svg viewBox="0 0 384 512" style="height:1em;position:relative;display:inline-block;top:.1em;" xmlns="http://www.w3.org/2000/svg">  <path d="M318.7 268.7c-.2-36.7 16.4-64.4 50-84.8-18.8-26.9-47.2-41.7-84.7-44.6-35.5-2.8-74.3 20.7-88.5 20.7-15 0-49.4-19.7-76.4-19.7C63.3 141.2 4 184.8 4 273.5q0 39.3 14.4 81.2c12.8 36.7 59 126.7 107.2 125.2 25.2-.6 43-17.9 75.8-17.9 31.8 0 48.3 17.9 76.4 17.9 48.6-.7 90.4-82.5 102.6-119.3-65.2-30.7-61.7-90-61.7-91.9zm-56.6-164.2c27.3-32.4 24.8-61.9 24-72.5-24.1 1.4-52 16.4-67.9 34.9-17.5 19.8-27.8 44.3-25.6 71.9 26.1 2 49.9-11.4 69.5-34.3z"></path></svg>) or right click a tab and choose **Customize ribbon ...** (<svg viewBox="0 0 448 512" style="height:1em;position:relative;display:inline-block;top:.1em;" xmlns="http://www.w3.org/2000/svg">  <path d="M0 93.7l183.6-25.3v177.4H0V93.7zm0 324.6l183.6 25.3V268.4H0v149.9zm203.8 28L448 480V268.4H203.8v177.9zm0-380.6v180.1H448V32L203.8 65.7z"></path></svg>). 

<div class="figure" style="text-align: center">
<img src="img/vba-editor.png" alt="The VBA editor." width="100%" />
<p class="caption">(\#fig:vba-editor)The VBA editor.</p>
</div>

In the **Developer** tab you open the VBA editor by pressing the **Visual basic** button (<svg viewBox="0 0 448 512" style="height:1em;position:relative;display:inline-block;top:.1em;" xmlns="http://www.w3.org/2000/svg">  <path d="M0 93.7l183.6-25.3v177.4H0V93.7zm0 324.6l183.6 25.3V268.4H0v149.9zm203.8 28L448 480V268.4H203.8v177.9zm0-380.6v180.1H448V32L203.8 65.7z"></path></svg> Alt + F11, <svg viewBox="0 0 384 512" style="height:1em;position:relative;display:inline-block;top:.1em;" xmlns="http://www.w3.org/2000/svg">  <path d="M318.7 268.7c-.2-36.7 16.4-64.4 50-84.8-18.8-26.9-47.2-41.7-84.7-44.6-35.5-2.8-74.3 20.7-88.5 20.7-15 0-49.4-19.7-76.4-19.7C63.3 141.2 4 184.8 4 273.5q0 39.3 14.4 81.2c12.8 36.7 59 126.7 107.2 125.2 25.2-.6 43-17.9 75.8-17.9 31.8 0 48.3 17.9 76.4 17.9 48.6-.7 90.4-82.5 102.6-119.3-65.2-30.7-61.7-90-61.7-91.9zm-56.6-164.2c27.3-32.4 24.8-61.9 24-72.5-24.1 1.4-52 16.4-67.9 34.9-17.5 19.8-27.8 44.3-25.6 71.9 26.1 2 49.9-11.4 69.5-34.3z"></path></svg> ⌥ + F11). The VBA editor is where you write your VBA code. A screenshot of the VBA editor can be seen in Figure \@ref(fig:vba-editor). You can setup the editor so it consists of a set of different sub-windows. Here we will highlight the ones you will use the most:

   * *Code*: The code window is where you can see the code of your modules. 
   * *Process Explorer*: Gives you an overview over all your open workbooks (a Excel file) and the VBA modules (a place to write VBA code) inside each workbook. 
   * *Properties*: Each element in the Process Explorer can be seen as an object and each object has a set of properties. For instance a module have a property called `Name` containing the name of the module. You can edit the name by modifying the field in the Properties window. Similar a worksheet has a set of properties (try selecting one of the sheets in the Process Explorer).
   * *Locals*: This is a window which can be used for debugging. During debugging you can run your code line by line by inserting breakpoints. You can then observe the values of your variables in the Locals window.
   
   <!-- * *Immediate*: This is a window which can be used for debugging (checking your code during development). Here you can output checks and run pieces of code. -->
   
If you do not see the sub-windows in the editor. Then you can open them using the icons in the toolbar (hoover over the icons to find them). Finally, let us set the preferences for the VBA editor. Open the preferences/options **Excel -> Preferences -> Editor** (<svg viewBox="0 0 384 512" style="height:1em;position:relative;display:inline-block;top:.1em;" xmlns="http://www.w3.org/2000/svg">  <path d="M318.7 268.7c-.2-36.7 16.4-64.4 50-84.8-18.8-26.9-47.2-41.7-84.7-44.6-35.5-2.8-74.3 20.7-88.5 20.7-15 0-49.4-19.7-76.4-19.7C63.3 141.2 4 184.8 4 273.5q0 39.3 14.4 81.2c12.8 36.7 59 126.7 107.2 125.2 25.2-.6 43-17.9 75.8-17.9 31.8 0 48.3 17.9 76.4 17.9 48.6-.7 90.4-82.5 102.6-119.3-65.2-30.7-61.7-90-61.7-91.9zm-56.6-164.2c27.3-32.4 24.8-61.9 24-72.5-24.1 1.4-52 16.4-67.9 34.9-17.5 19.8-27.8 44.3-25.6 71.9 26.1 2 49.9-11.4 69.5-34.3z"></path></svg>) or **Tools -> Options -> Editor** (<svg viewBox="0 0 448 512" style="height:1em;position:relative;display:inline-block;top:.1em;" xmlns="http://www.w3.org/2000/svg">  <path d="M0 93.7l183.6-25.3v177.4H0V93.7zm0 324.6l183.6 25.3V268.4H0v149.9zm203.8 28L448 480V268.4H203.8v177.9zm0-380.6v180.1H448V32L203.8 65.7z"></path></svg>). Uncheck mark 'Auto Syntax Check' and check mark 'Require Variable Declaration'. 

  
## Your first program {#vba-hello}

Let us try to make your first piece of code. Download the template file `<a href="https://github.com/bss-osca/tfa/blob/master/vba/02-vba-intro-template.xlsm" target="_blank">02-vba-intro-template.xlsm</a>`{=html}, open the file and open the VBA editor under the **Developer** tab. 

   1) Add a new module by clicking the *Insert Module* icon (upper left corner - note you can hoover over the icons to see what they do).
   2) Rename the module (named *Module1*) to *TM2_hello* (note you have to use underscores).
   3) Open the module by double clicking on the module in the Process Explorer 
   4) Add the code 
   
      ```
      ' Your first program/macro
      Sub TM2_SayHello()
          MsgBox ("Say hello world :-)")
      End Sub
      ```
      
      The code is a procedure (sub) and since it does not have any input arguments it is called a *macro* and can be run directly. Note if a line starts with a `'` then the line is considered as a comment and not used by the program.
   5) Run the macro by pressing the *Play* icon or using the shortcut F5. What happend?
   6) Go to the worksheet *TM2* in Excel. 
      * In the **Developer** tab press the *Button* icon and click on cell G3. 
      * In the popup window select macro name *TM2_SayHello* and click OK.
      * Rename the button by clicking the text and call it 'Say Hello'. Click besides the button to finish.
      * Run the button by clicking it.
      * Try right clicking the button and move/resize it.
   7) Save the workbook (Excel file). Note the Excel file has extension `.xlsm` and not `.xlsx` because it contains VBA code. 

You have now finished your first program by saying hello to the world using a message box.


## The macro recorder {#vba-macro}

It is possible to use the Macro recorder to turn your actions in Excel into VBA code. This can be particularly useful if you have forgotten the code for a specific color, the name of a function or need to plot a graph. Unfortunately, you cannot record if-statements or loops, so the recorder is not an easy way out of learning to code. But it is a handy tool for getting pieces of code. 

Let us try to record a macro that make a scatter plot of cells D8:E12 and change the title:

   1) Click the **Record Macro** icon under under the **Developer** tab.
   2) Name the macro *TM2_Plot* and click OK (the recorder is now running).
   3) Go to the worksheet *TM2* and select cells D8:E12.
   4) Add a scatter plot of the points.
   5) Rename the title to 'A line'.
   6) Click the **Stop Recording** icon under under the **Developer** tab.

You have now finished recording your macro. Let us have a look at the code by going to the `TM2_Plot` sub in the VBA editor. You should have something similar to:

```
Sub TM2_Plot()
'
' TM2_Plot Macro
'
    Worksheets("TM2").Activate
    Range("D8:E12").Select
    ActiveSheet.Shapes.AddChart2(240, xlXYScatterSmooth).Select
    ActiveChart.SetSourceData Source:=Range("'TM2'!$D$8:$E$12")
    ActiveChart.ChartTitle.Select
    ActiveChart.ChartTitle.Select
    ActiveChart.ChartTitle.Text = "A line"
    Selection.Format.TextFrame2.TextRange.Characters.Text = "A line"
    With Selection.Format.TextFrame2.TextRange.Characters(1, 6).ParagraphFormat
        .TextDirection = msoTextDirectionLeftToRight
        .Alignment = msoAlignCenter
    End With
    With Selection.Format.TextFrame2.TextRange.Characters(1, 1).Font
        .BaselineOffset = 0
        .Bold = msoFalse
        .NameComplexScript = "+mn-cs"
        .NameFarEast = "+mn-ea"
        .Fill.Visible = msoTrue
        .Fill.ForeColor.RGB = RGB(89, 89, 89)
        .Fill.Transparency = 0
        .Fill.Solid
        .Size = 14
        .Italic = msoFalse
        .Kerning = 12
        .Name = "+mn-lt"
        .UnderlineStyle = msoNoUnderline
        .Spacing = 0
        .Strike = msoNoStrike
    End With
    With Selection.Format.TextFrame2.TextRange.Characters(2, 5).Font
        .BaselineOffset = 0
        .Bold = msoFalse
        .NameComplexScript = "+mn-cs"
        .NameFarEast = "+mn-ea"
        .Fill.Visible = msoTrue
        .Fill.ForeColor.RGB = RGB(89, 89, 89)
        .Fill.Transparency = 0
        .Fill.Solid
        .Size = 14
        .Italic = msoFalse
        .Kerning = 12
        .Name = "+mn-lt"
        .UnderlineStyle = msoNoUnderline
        .Spacing = 0
        .Strike = msoNoStrike
    End With
    ActiveChart.ChartArea.Select
End Sub
```

In general a recorded macro contains a lot of unnecessary code which can be removed. For instance, here we just want to make a scatter plot of cells D8:E12 and change the title. That is, the code can be reduced to:

```
' Add a scatter plot
Sub TM2_Plot()
    Worksheets("TM2").Activate
    Range("D8:E12").Select
    ActiveSheet.Shapes.AddChart2(240, xlXYScatterSmooth).Select
    ActiveChart.SetSourceData Source:=Range("'TM2'!$D$8:$E$12")
    ActiveChart.ChartTitle.Text = "A line"
End Sub
```

Which code to remove can sometimes be hard to realize. However, you may try to remove small parts of code, run the macro and check if the results still are as wanted.

Finally, try to add a button 'Make plot' that run the macro. Go to the worksheet *TM2* and do steps:

   * In the **Developer** tab press the *Button* icon and click on cell G8. 
   * In the popup window select macro name *TM2_Plot* and click OK.
   * Rename the button by clicking the text and call it 'Make plot'. Click besides the button to finish.
   * Run the button by clicking it.


## VBA - A short overview {#vba-overview}

Let us have a short overview over some VBA features so you can get started coding. Basic building blocks in programming are:

- _Variables_ store stuff in memory.
- _Procedures_ (functions and subs) execute a set of instructions.
- _Input and output_ are needed to read data and output the result.
- _Conditional statements_ are used to execute different instructions depending on a true/false value.
- _Loops_ are used to execute code repeatedly. 


### Variables

Variables are used to store information that is saved in memory. You may visualize a variable as a box in memory (see Figure \@ref(fig:vba-memory)). The variable name can be seen as the label on the box. 

<div class="figure" style="text-align: center">
<img src="./img/storage.jpg" alt="Visualization of computer memory" width="700px" />
<p class="caption">(\#fig:vba-memory)Visualization of computer memory</p>
</div>

The box can contain for instance a number, a date or a boolean. That is, any data type defined by VBA. Some of the basic data types used by VBA are:

<table class="table table-striped table-hover table-condensed table-responsive" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:unnamed-chunk-5)Basic data types.</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Name </th>
   <th style="text-align:left;"> Type </th>
   <th style="text-align:left;"> Details </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Byte </td>
   <td style="text-align:left;"> Numerical </td>
   <td style="text-align:left;"> Whole number between 0 and 255. </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Integer </td>
   <td style="text-align:left;"> Numerical </td>
   <td style="text-align:left;"> Whole number between -32768 and 32767. </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Long </td>
   <td style="text-align:left;"> Numerical </td>
   <td style="text-align:left;"> Whole number between - 2147483648 and 2147483647. </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Double </td>
   <td style="text-align:left;"> Numerical </td>
   <td style="text-align:left;"> Floating decimal number between -1.79769313486232E308 and 1.79769313486232E308. </td>
  </tr>
  <tr>
   <td style="text-align:left;"> String </td>
   <td style="text-align:left;"> Text </td>
   <td style="text-align:left;"> Text. </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Date </td>
   <td style="text-align:left;"> Date </td>
   <td style="text-align:left;"> Date and time. </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Boolean </td>
   <td style="text-align:left;"> Boolean </td>
   <td style="text-align:left;"> True or False. </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Variant </td>
   <td style="text-align:left;"> Any type </td>
   <td style="text-align:left;"> Any kind of data (default type if the variable is not declared). </td>
  </tr>
</tbody>
</table>

All basic data types can be seen in the [VBA documentation](https://docs.microsoft.com/en-us/office/vba/language/reference/user-interface-help/data-type-summary).  Note that some data types are numericals, i.e. they represent a number (either an integer or a decimal number), other data types represent a set of characters (a string), a boolean or a date. 

More advanced data types such as a group of numbers (a numeric array), a range of cells in a worksheet (an object) or a set of numbers (a collection) will be considered in Module \@ref(mod-vba-datatypes).

Your memory contains a limited amount of storage and it is therefore important to use it wisely. The computer memory can be seen as a group of bits (zero and ones) and we can measure the memory size by counting the number of bits or bytes (8 bits = 1 byte). Different data types take up different amounts of memory. For example, the memory requirements for some of the basic data types are:

<table class="table table-striped table-hover table-condensed table-responsive" style="margin-left: auto; margin-right: auto;border-bottom: 0;">
<caption>(\#tab:unnamed-chunk-6)Memory requirements for some data types.</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Data type </th>
   <th style="text-align:left;"> Storage size </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Byte </td>
   <td style="text-align:left;"> 1 byte </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Boolean </td>
   <td style="text-align:left;"> 2 bytes </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Integer </td>
   <td style="text-align:left;"> 2 bytes </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Long  (long integer) </td>
   <td style="text-align:left;"> 4 bytes </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Double  (double-precision floating-point) </td>
   <td style="text-align:left;"> 8 bytes </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Date </td>
   <td style="text-align:left;"> 8 bytes </td>
  </tr>
  <tr>
   <td style="text-align:left;"> String </td>
   <td style="text-align:left;"> 10 bytes + string length * 2 bytes </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Variant  (a number) </td>
   <td style="text-align:left;"> 16 bytes </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Variant  (a string) </td>
   <td style="text-align:left;"> 22 bytes + string length * 2 bytes </td>
  </tr>
</tbody>
<tfoot><tr><td style="padding: 0; " colspan="100%">
<sup></sup> 8 Bits = 1 Byte, 1024 Bytes = 1 Kilobyte, 1024 Kilobytes = 1 Megabyte, 1024 Megabytes = 1 Gigabyte and 1024 Gigabytes = 1 Terabyte.</td></tr></tfoot>
</table>

<!-- Arrays require 20 bytes of memory plus 4 bytes for each array dimension plus the number of bytes occupied by the data itself. A Variant containing an array requires 12 bytes more than the array alone. -->

Always declare your variables explicit in VBA. If you can add `Option Explicit` in the top of your module, undefined variables will raise an error. You can add it by default by modifying the preferences for the VBA editor (see Section \@ref(vba-setup)). Declaring variables is good coding practice since it reduces the memory requirements and avoid type errors such as

```
Option Explicit

Dim intCtr as integer

intCtr = 10
intCtr = intCtg + 10
```

This will raise an error because `intCtg` is not defined (you have made a typo and meant `intCtr`). Without `Option Explicit` the code will run and assume that `intCtg` is another variable (initialized to zero). 

As can be seen a double takes 4 times the memory compared to an integer. That is, you can save memory by considering what data type you need. Consider an example where you have 10000 customer locations on a map and you want to store the distance between customer $i$ and $j$. That is, you have to store $10000 \cdot 10000 = 100.000.000$ numbers. The memory 
requirements given different data types are:

Data type | Memory requirements
-------- | -------------------------------------------------------
Variant  | $(10000\cdot 10000\cdot 16)/1024/1024 \approx 1526$ MB 
Double   | $(10000\cdot 10000\cdot 8)/1024/1024 \approx 763$ MB                                     
Integer  | $(10000\cdot 10000\cdot 2)/1024/1024 \approx 191$ MB  

If you do not think about memory usage a Variant data type would have been used taking up the double the size compared to using a Double (a decimal number). Moreover, if it is enough to measure the distance using an Integer between 0 and 32767, then we can reduce the memory requirements to only 191 MB. Often the free memory in your computer is around 5 GB, i.e. think about which data type you need! 

You declare variables using the `Dim` keyword:

```
'' Declare some variables
Sub TM03_DeclareVariables()
    ' Always declare variables in the top of a procedure (memory is allocated)
    Dim intPersons As Integer
    Dim dblAmount As Double
    Dim strText As String
    
    ' Here we assign values to the variables (modify the memory)
    intPersons = 10
    dblAmount = 27.4
    strText = "Number of persons are "
    
    MsgBox (strText & intPersons & " which own " & dblAmount & "$")
End Sub
```

Three variables are declared on the first three lines in the sub (good coding practice). Variables can be of different data types (here an integer, a double and a string). We allocate values to the variables on the next lines and finally output the result in a message box. Note VBA code is case-insensitive, i.e. `strText` and `strtext` is the same variable. It is good coding practice to be consistent and often the VBA editor will help you by changing `strtext` to `strText` automatically.


### Procedures 

In VBA we deal with two kinds of procedures: A `Sub` which can work as a “macro” in Excel, i.e. we can call it using e.g. a button and a `Function` which can work like Excel functions, i.e. return a value. We already have declared some subs. Let us try to make a function:

```
'' A function joining two strings
Function TM2_StringJoin(strF As String, strL As String) As String
    Dim strJ As String
    strJ = strF & " " & strL
    TM2_StringJoin = strJ
End Function
```

First observe that the function have two string input arguments `strF` and `strL`. These two strings are joined into one string (saved in the variable `strJ`) by using the string concatenate symbol `&`. Finally, the value is returned by assigning the value to same variable as the function name `TM2_StringJoin`. The function can be called from Excel like any other function by using the function name (have a look at cell D5 in the worksheet *TM2*). 

You may also use all the built-in Excel functions in VBA:

```
'' Call an Excel function
Sub TM2_ExcelFunction()
    MsgBox ("The sum of cells D9:D12 are " & WorksheetFunction.Sum(Worksheets("TM2").Range("D9:D12")))
End Sub
```

Note all Excel functions are accessed using the `WorksheetFunction` object. That is, we write `WorksheetFunction.<function name>`. VBA also has a set of [built-in functions](https://www.techonthenet.com/excel/formulas/index_vba.php) which can be used. For instance the `Date` and `InStr` function:

```
'' Call VBA functions (run it using F5)
Sub TM2_VBAFunction()
    MsgBox ("The current date is " & Date)
    MsgBox ("Jen is found at char number: " & InStr("Hi Jen how are you", "Jen"))
End Sub
```

We will have a closer look on procedures in Module \@ref(mod-vba-procedures).


### Input and output

Input and output are needed to read data and output the result. Examples on input/output are dialog boxes which can be created using `MsgBox` or `InputBox`:

```
Sub TM2_Dialog()
    Dim strName As String

    strName = InputBox("Type your name:")
    MsgBox "Your name is " & strName
End Sub
```

First, a string is declared. Next, a value is read to the string using an input box. Finally, the result is output using a message box.

You can also write/read values from a sheet using `Range` or `Cells`. Note it is always a good idea to know which sheet you are considering by using the `Worksheets` function:

```
'' Read and write to sheet
Sub TM2_ReadWriteSheet()
    Dim str1 As String
    Dim int1 As Integer
    
    Worksheets("TM2").Activate  ' We activate a sheet so know use this sheet
    ' Input values from sheet
    str1 = Range("D4")  ' read cell D4
    int1 = Cells(9, 4)  ' read row 9 and col 4 (cell D9)
    ' Output values
    Range("B7") = str1 & "(" & int1 & ")"
    Cells(8, 2) = str1
End Sub
```

After declaring variables, the worksheet TM2 is activated and we input/output values using the `Range` and `Cells` functions. We will have a closer look on the range object in Module \@ref(mod-vba-datatypes).


### Conditional statements

Conditional statements execute different instructions depending on a true/false value.

```
'' Conditional statements example
Sub TM2_CondStatement()
    Dim strName As String
    Dim intAnswer As Integer
    
    Worksheets("TM2").Activate
    strName = InputBox("Type your name:")
    intAnswer = MsgBox("Do you want to display your name in a message box?", vbYesNo)  ' you can use vbYes and vbNo in your code
    If intAnswer = vbYes Then
        ' Make the message box:
        MsgBox ("Your name is " & strName)
    Else
        ' Write to the sheet:
        Range("B10") = strName
        MsgBox ("Your name is in cell B10")
    End If
End Sub
```

After declaring variables and activating the worksheet, a dialog box is used for reading your name. Next, based on your answer we use an `If`/`Else` statement to do two different tasks. We will have a closer look on conditional statements in Module \@ref(mod-vba-loops-cond).


### Loops

Loops can be used to execute code repeatedly:

```
'' Loops example
Sub TM2_Loops()
    Dim k As Integer
    
    Worksheets("TM2").Activate
    For k = 2 To 5
        Cells(k, 10) = "Row " & k
    Next
End Sub
```

Here a `For` loop is used to write out values to cells J2:J5. We will have a closer look on loops in Module ??.


<!-- ## An example -->

## Good coding pratice {#vba-coding-practice}

It is always a good idea to maintain a consistent coding practice. The main reason for using a consistent set of coding conventions is to standardize the structure and coding style of an application so that you and others can easily read and understand the code. Good coding conventions result in precise, readable, and unambiguous source code that is consistent with other language conventions and as intuitive as possible. 

As you already have seen the code in this teaching module has been structured in VBA modules (we use the prefix TM2_ for all modules related to this teaching module). Each procedure starts with a capital letter and we use code indention to read the code easier. 

Different ways of naming variables exists (naming convention). Some use [snake case][wiki-snake-case] others use [camel case][wiki-camel-case]. The [Leszynski naming convention](https://en.wikipedia.org/wiki/Leszynski_naming_convention) define variables with a consistent prefix that makes it easy to identify its data type. Some common prefixes used for the Leszynski naming convention are:

<table class="table table-striped table-hover table-condensed table-responsive" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:unnamed-chunk-7)Prefixes for some variables.</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Type </th>
   <th style="text-align:left;"> Prefix </th>
   <th style="text-align:left;"> Example </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Boolean </td>
   <td style="text-align:left;"> bln </td>
   <td style="text-align:left;"> blnFound </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Currency </td>
   <td style="text-align:left;"> cur </td>
   <td style="text-align:left;"> curRevenue </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Date (Time) </td>
   <td style="text-align:left;"> dtm&lt; </td>
   <td style="text-align:left;"> dtmStart </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Double </td>
   <td style="text-align:left;"> dbl </td>
   <td style="text-align:left;"> dblTolerance </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Integer </td>
   <td style="text-align:left;"> int </td>
   <td style="text-align:left;"> intQuantity </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Long </td>
   <td style="text-align:left;"> lng </td>
   <td style="text-align:left;"> lngDistance </td>
  </tr>
  <tr>
   <td style="text-align:left;"> String </td>
   <td style="text-align:left;"> str </td>
   <td style="text-align:left;"> strFName </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Variant </td>
   <td style="text-align:left;"> vnt </td>
   <td style="text-align:left;"> vntCheckSum </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Array </td>
   <td style="text-align:left;"> ary </td>
   <td style="text-align:left;"> aryNumbers (optional) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Worksheet </td>
   <td style="text-align:left;"> wst </td>
   <td style="text-align:left;"> wstDistances </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Workbook </td>
   <td style="text-align:left;"> wbk </td>
   <td style="text-align:left;"> wbkData </td>
  </tr>
</tbody>
</table>


Many [other prefixes](https://msdn.microsoft.com/en-us/library/aa263493(v=vs.60).aspx) can be used also. It is common to use Leszynski convention within the VBA community. A few examples:

```
this_is_snake_case   # note you do not use capital letters here (not used)
thisIsCamelCase      # you start each word with a capital letter 
intAmount            # Lezynski convention naming an integer (int) variable
strFullName          # Lezynski naming a string (str) variable
```

We adapt the Leszynski naming convention together with camel case. One exception is that we add the suffix `TM2_` when we name procedures so that we can easy find procedures related to a given teaching module. When defining variables and functions, it is in general good practice to use nouns for variables and verbs for functions.

It is always good practice to comment your code. Such that others can get a fast overview and understand your code easier. We will use [roxygen documentation](https://roxygen2.r-lib.org/) comments which are widely known. For example in the top of a module file you may write:

```
'' Module description.
'  Can be more than one line.
' @author Lars Relund <junk@relund.dk>
```

Before each `sub`, `function` etc. write something like:

```
'' Sub description
' 
' @pre Precondition 
' @post Postcondition
'
' @param strA	Explanation of input parameter strA
' @param intB Explanation of input parameter intB
' @return Return value (if a function)
' @remarks Further remarks 
Function MyFunc(strA As String, intB As Integer) As Integer {
   ...
}
```

For further details about coding/naming convention see Section \@ref(coding-convention).


## Recap {#rc-vba-intro}

This module gives a short introduction to VBA: 

- A programming language intended to control and automate Microsoft Office applications (we use Excel).
- VBA (Visual Basic for Applications) is an implementation of BASIC developed by Microsoft. 
- A [compiled language](https://en.wikipedia.org/wiki/Compiled_language#:~:text=A%20compiled%20language%20is%20a,%2Druntime%20translation%20takes%20place). That is, code need to be compiled first before running it. 
- You can only run VBA using the desktop version of Excel (not the web version).
- With VBA you can extend Excel and automate tasks by coding different algorithms that for instance can be run by pressing a button. 

For running VBA code the **Developer** tab needs to be visible in Excel. This can be done by check marking the **Developer** tab under the 'Ribbon and Toolbar' options in Excel. You add it by choosing **Excel -> Preferences -> Ribbon and toolbar** (<svg viewBox="0 0 384 512" style="height:1em;position:relative;display:inline-block;top:.1em;" xmlns="http://www.w3.org/2000/svg">  <path d="M318.7 268.7c-.2-36.7 16.4-64.4 50-84.8-18.8-26.9-47.2-41.7-84.7-44.6-35.5-2.8-74.3 20.7-88.5 20.7-15 0-49.4-19.7-76.4-19.7C63.3 141.2 4 184.8 4 273.5q0 39.3 14.4 81.2c12.8 36.7 59 126.7 107.2 125.2 25.2-.6 43-17.9 75.8-17.9 31.8 0 48.3 17.9 76.4 17.9 48.6-.7 90.4-82.5 102.6-119.3-65.2-30.7-61.7-90-61.7-91.9zm-56.6-164.2c27.3-32.4 24.8-61.9 24-72.5-24.1 1.4-52 16.4-67.9 34.9-17.5 19.8-27.8 44.3-25.6 71.9 26.1 2 49.9-11.4 69.5-34.3z"></path></svg>) or right click a tab and choose **Customize ribbon ...** (<svg viewBox="0 0 448 512" style="height:1em;position:relative;display:inline-block;top:.1em;" xmlns="http://www.w3.org/2000/svg">  <path d="M0 93.7l183.6-25.3v177.4H0V93.7zm0 324.6l183.6 25.3V268.4H0v149.9zm203.8 28L448 480V268.4H203.8v177.9zm0-380.6v180.1H448V32L203.8 65.7z"></path></svg>).

In the **Developer** tab you open the VBA editor by pressing the **Visual basic** button (<svg viewBox="0 0 448 512" style="height:1em;position:relative;display:inline-block;top:.1em;" xmlns="http://www.w3.org/2000/svg">  <path d="M0 93.7l183.6-25.3v177.4H0V93.7zm0 324.6l183.6 25.3V268.4H0v149.9zm203.8 28L448 480V268.4H203.8v177.9zm0-380.6v180.1H448V32L203.8 65.7z"></path></svg> Alt + F11, <svg viewBox="0 0 384 512" style="height:1em;position:relative;display:inline-block;top:.1em;" xmlns="http://www.w3.org/2000/svg">  <path d="M318.7 268.7c-.2-36.7 16.4-64.4 50-84.8-18.8-26.9-47.2-41.7-84.7-44.6-35.5-2.8-74.3 20.7-88.5 20.7-15 0-49.4-19.7-76.4-19.7C63.3 141.2 4 184.8 4 273.5q0 39.3 14.4 81.2c12.8 36.7 59 126.7 107.2 125.2 25.2-.6 43-17.9 75.8-17.9 31.8 0 48.3 17.9 76.4 17.9 48.6-.7 90.4-82.5 102.6-119.3-65.2-30.7-61.7-90-61.7-91.9zm-56.6-164.2c27.3-32.4 24.8-61.9 24-72.5-24.1 1.4-52 16.4-67.9 34.9-17.5 19.8-27.8 44.3-25.6 71.9 26.1 2 49.9-11.4 69.5-34.3z"></path></svg> ⌥ + F11).

A few useful shortcuts:

- Toggle VBA editor and Excel (<svg viewBox="0 0 448 512" style="height:1em;position:relative;display:inline-block;top:.1em;" xmlns="http://www.w3.org/2000/svg">  <path d="M0 93.7l183.6-25.3v177.4H0V93.7zm0 324.6l183.6 25.3V268.4H0v149.9zm203.8 28L448 480V268.4H203.8v177.9zm0-380.6v180.1H448V32L203.8 65.7z"></path></svg> Alt + F11, <svg viewBox="0 0 384 512" style="height:1em;position:relative;display:inline-block;top:.1em;" xmlns="http://www.w3.org/2000/svg">  <path d="M318.7 268.7c-.2-36.7 16.4-64.4 50-84.8-18.8-26.9-47.2-41.7-84.7-44.6-35.5-2.8-74.3 20.7-88.5 20.7-15 0-49.4-19.7-76.4-19.7C63.3 141.2 4 184.8 4 273.5q0 39.3 14.4 81.2c12.8 36.7 59 126.7 107.2 125.2 25.2-.6 43-17.9 75.8-17.9 31.8 0 48.3 17.9 76.4 17.9 48.6-.7 90.4-82.5 102.6-119.3-65.2-30.7-61.7-90-61.7-91.9zm-56.6-164.2c27.3-32.4 24.8-61.9 24-72.5-24.1 1.4-52 16.4-67.9 34.9-17.5 19.8-27.8 44.3-25.6 71.9 26.1 2 49.9-11.4 69.5-34.3z"></path></svg> ⌘⇧´).
- Run current procedure or continues execution after pausing (F5).
<!-- - Terminate a procedure and reset all variables to their default values (Shift + F5). -->
- Auto complete code (Ctrl + Space). On a mac you may have to disable the default shortcut (Ctrl + Space) for switching input sources. You can go to the System Preferences -> Keyboard -> Shortcuts -> Input Sources and disable it.
- Use the debugger and go to next line of code (<svg viewBox="0 0 448 512" style="height:1em;position:relative;display:inline-block;top:.1em;" xmlns="http://www.w3.org/2000/svg">  <path d="M0 93.7l183.6-25.3v177.4H0V93.7zm0 324.6l183.6 25.3V268.4H0v149.9zm203.8 28L448 480V268.4H203.8v177.9zm0-380.6v180.1H448V32L203.8 65.7z"></path></svg> F8, <svg viewBox="0 0 384 512" style="height:1em;position:relative;display:inline-block;top:.1em;" xmlns="http://www.w3.org/2000/svg">  <path d="M318.7 268.7c-.2-36.7 16.4-64.4 50-84.8-18.8-26.9-47.2-41.7-84.7-44.6-35.5-2.8-74.3 20.7-88.5 20.7-15 0-49.4-19.7-76.4-19.7C63.3 141.2 4 184.8 4 273.5q0 39.3 14.4 81.2c12.8 36.7 59 126.7 107.2 125.2 25.2-.6 43-17.9 75.8-17.9 31.8 0 48.3 17.9 76.4 17.9 48.6-.7 90.4-82.5 102.6-119.3-65.2-30.7-61.7-90-61.7-91.9zm-56.6-164.2c27.3-32.4 24.8-61.9 24-72.5-24.1 1.4-52 16.4-67.9 34.9-17.5 19.8-27.8 44.3-25.6 71.9 26.1 2 49.9-11.4 69.5-34.3z"></path></svg> ⇧⌘I).
<!-- - Open the Object Browser (F2). -->
- Switch between subs/functions (<svg viewBox="0 0 448 512" style="height:1em;position:relative;display:inline-block;top:.1em;" xmlns="http://www.w3.org/2000/svg">  <path d="M0 93.7l183.6-25.3v177.4H0V93.7zm0 324.6l183.6 25.3V268.4H0v149.9zm203.8 28L448 480V268.4H203.8v177.9zm0-380.6v180.1H448V32L203.8 65.7z"></path></svg>  Ctrl + Up/Down, <svg viewBox="0 0 384 512" style="height:1em;position:relative;display:inline-block;top:.1em;" xmlns="http://www.w3.org/2000/svg">  <path d="M318.7 268.7c-.2-36.7 16.4-64.4 50-84.8-18.8-26.9-47.2-41.7-84.7-44.6-35.5-2.8-74.3 20.7-88.5 20.7-15 0-49.4-19.7-76.4-19.7C63.3 141.2 4 184.8 4 273.5q0 39.3 14.4 81.2c12.8 36.7 59 126.7 107.2 125.2 25.2-.6 43-17.9 75.8-17.9 31.8 0 48.3 17.9 76.4 17.9 48.6-.7 90.4-82.5 102.6-119.3-65.2-30.7-61.7-90-61.7-91.9zm-56.6-164.2c27.3-32.4 24.8-61.9 24-72.5-24.1 1.4-52 16.4-67.9 34.9-17.5 19.8-27.8 44.3-25.6 71.9 26.1 2 49.9-11.4 69.5-34.3z"></path></svg> ⌘ + Up/Down).
<!-- - Run Debugger to this line (Ctrl + F8). -->

Basic building blocks in programming:

- _Variables_ store stuff in memory.
- _Procedures_ (functions and subs) execute a set of instructions.
- _Conditional statements_ are used to execute different instructions depending on a true/false statement.
- _Loops_ are used to execute code repeatedly. 
- _Input/output_ are needed to read data and output the result.

Variables are used to store information in the program. Think of it as a box that can contain e.g. a number, a string or a date. The variable name is the label on the box.

In VBA we deal with two kinds of procedures: A `Sub` which can work as a “macro” in Excel, i.e. we can call it using e.g. a button and a `Function` which can work like Excel functions, i.e. return a value.

Examples on input/output are dialog boxes which can be created using `MsgBox` or `InputBox`. You can also write/read values from a sheet using `Range` or `Cells`. Note it is always a good idea to know which sheet you are considering by using `Worksheets("<sheet name>").Activate`.

Conditional statements (decisions) execute different instructions depending on a true/false. 

Loops can be used to execute code repeatedly.

Excel functions can be called with the `WorksheetFunction` e.g. `WorksheetFunction.Sum(Range("D2:E5"))`

Always remember to save workbooks with VBA code using the file has extension `.xlsm` and not `.xlsx` otherwise the VBA code will be removed from the file! 


```{=html}
<div>
You may also have a look at the
<a href="https://bss-osca.github.io/tfa/slides/02_vba-intro-slides.html" target="_blank">slides for this module</a>
.
</div>
```


## Exercises {#ex-vba-intro}

Below you will find a set of exercises. Always have a look at the exercises before you meet in your study group and try to solve them yourself. Are you stuck, see the [help page](#help). Some of the solutions to each exercise can be seen by pressing the button at each question. Beware, you will not learn by giving up too early. Put some effort into finding a solution!


```{=html}
<div>
A template with VBA code for this module is given in the file
<a href="https://github.com/bss-osca/tfa/blob/master/vba/02-vba-intro-template.xlsm" target="_blank">02-vba-intro-template.xlsm</a>
(open it and use it while reading the notes). Have a look inside the module
<i>TM2_ex</i>
in the VBA editor for examples used in the notes and during lectures. Have a look at module
<i>TM2_exercises</i>
for exercises. The template file for next teaching module will contain guiding answers for the exercises to this teaching module.
</div>
```

### Exercise - Hello {#ex-vba-hello}

Consider the procedure `TM2_SayHello` in Section \@ref(vba-hello) and modify it into procedure `TM2_SayHelloAdv` with features: 
 
   (1) Use an input box to ask for your name.
   (2) Output *Hello <your name>* in cell B11 in worksheet *TM2*.
   (3) Run it using the shortcut F5. 


### Exercise - Record a macro {#ex-vba-macro}
   
Do the following steps:

   (1) Type 'My name is:' in cell B12. 
   (2) Type you name in cell B13 and activate it (click on it).
   (3) Start the macro recorder and call the macro `TM2_ChangeLayout`.
   (4) Change the color to blue and font size to 14.
   (5) Stop the macro recorder.
   (6) Activate cell B12 and run the macro.
   (7) Open the VBA editor and inspect the macro. 
   (8) Cleanup the macro so only stuff about color and size are maintained.
   (9) Add a button to run the macro.
   (10) Select cells D15:E17 and run the macro.
   (11) Modify the macro in the editor so the font size is 10 and test it.


### Exercise - User input {#ex-vba-user-input}

Write a procedure (sub) `TM2_CheckNumber` that:

   (1) Ask for an integer using an input box.
   (2) Make a message box telling if the number is above or at most 10.
   (3) Write the number to cell B14.
   (4) What happens if you do type in a string in the input box?


### Exercise - Max and min number {#ex-vba-max-min}

The worksheet *TM2_Numbers* contains a button to a procedure that generate 40 random numbers.

<!-- Q1 -->

<div class="modal fade bs-example-modal-lg" id="vTawtsw3HA396vF1kuS6" tabindex="-1" role="dialog" aria-labelledby="vTawtsw3HA396vF1kuS6-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="vTawtsw3HA396vF1kuS6-title">Hint</h4></div><div class="modal-body">

```r
Sub TM2_FindMax()
    Dim intM As Integer
    Dim r As Integer
    
    Worksheets("TM2_Numbers").Activate
    intM = 0
    For r = 1 To 40
        If Cells(r, 1) ___ intM Then
            intM = ___
        End If
    Next
    Range("D1") = ___
End Sub
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#vTawtsw3HA396vF1kuS6">Hint</button>

   (1) Create a procedure that use loops and conditional statements to find the maximum number and write it to cell D1. Assign the procedure to button _Find max_.
   (2) Create a procedure that use loops and conditional statements to find the minimum number and write it to cell D2. Assign the procedure to button _Find min_.
   
   
<!-- Q3 -->

<div class="modal fade bs-example-modal-lg" id="IuU9z92Ii9Rz6NWgjbfG" tabindex="-1" role="dialog" aria-labelledby="IuU9z92Ii9Rz6NWgjbfG-title"><div class="modal-dialog modal-lg" role="document"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title" id="IuU9z92Ii9Rz6NWgjbfG-title">Hint</h4></div><div class="modal-body">

```r
Sub TM2_FindRange()
    Dim intM1 As Integer
    Dim intM2 As Integer
    Dim r As Integer
    
    Worksheets("TM2_Numbers").Activate
    intM1 = 1001
    intM2 = 0
    For r = 1 To 40
        ___
    Next
    Range("D3") = "[" & intM1 & "," & intM2 & "]"
End Sub
```


</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div></div></div></div><button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#IuU9z92Ii9Rz6NWgjbfG">Hint</button>
   
   (3) Create a procedure that use loops and conditional statements to find the number range and write it to cell D3. Assign the procedure to button _Find range_. Given two numbers `m1` and `m2`, you can concatenate them to a string using `&` e.g. `"[" & m1 & "," & m2 & "]"`.
   (4) Create a procedure that use loops and conditional statements to count the number of positives and write it to cell D4. Assign the procedure to button _Count positives_.
   
It may often be nice to know the row number of the minimum and maximum values.

   (5) Create a procedure that finds the maximum row number and write it to cell D5. Assign the procedure to button _Find max row_.
   (6) Create a procedure that finds the minimum row number and write it to cell D6. Assign the procedure to button _Find min row_.
   
The procedure `TM2_RunAll` which is already linked to button _Run All_, runs all the procedures. Have a look at the code and try it out.




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

<script src="//unpkg.com/@highlightjs/cdn-assets@11.5.1/highlight.min.js"></script>
<script type="text/javascript" src="https://unpkg.com/highlightjs-vba/dist/vba.min.js"></script>
<!-- <script src="//cdnjs.cloudflare.com/ajax/libs/highlightjs-line-numbers.js/2.8.0/highlightjs-line-numbers.min.js"></script> -->
<script type="text/javascript">
  hljs.initHighlightingOnLoad();
  // hljs.initLineNumbersOnLoad({singleLine: true}); 
</script> 
