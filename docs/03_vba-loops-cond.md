---
output: html_document
editor_options: 
  chunk_output_type: console
---




# Loops and conditional statements {#mod-vba-loops-cond}

This module gives an introduction to loops and conditional statements. Loops are used to repeat code and conditional statements are used to redirect code execution based on the conditions. Both are basic building blocks in programming.


```{=html}
<div>
A template with VBA code for this module is given in the file
<a href="https://github.com/bss-osca/tfa/blob/master/vba/03-vba-loops-cond-template.xlsm" target="_blank">03-vba-loops-cond-template.xlsm</a>
(open it and use it while reading the notes). Have a look inside the module
<i>TM3_ex</i>
in the VBA editor for examples used in the notes and during lectures. Have a look at module
<i>TM3_exercises</i>
for exercises. The template file for next teaching module will contain guiding answers for the exercises to this teaching module.
</div>
```
 
#### Learning path diagram {-}

Click/hover the nodes to follow links and see details.


```{=html}
<div id="htmlwidget-c2c7d19789ebbc2709e0" style="width:100%;height:220px;" class="grViz html-widget"></div>
<script type="application/json" data-for="htmlwidget-c2c7d19789ebbc2709e0">{"x":{"diagram":"digraph {\n\ngraph [layout = \"neato\",\n       outputorder = \"edgesfirst\",\n       bgcolor = \"white\"]\n\nnode [fontname = \"Helvetica\",\n      fontsize = \"10\",\n      shape = \"circle\",\n      fixedsize = \"true\",\n      width = \"0.5\",\n      style = \"filled\",\n      fillcolor = \"aliceblue\",\n      color = \"gray70\",\n      fontcolor = \"gray50\"]\n\nedge [fontname = \"Helvetica\",\n     fontsize = \"8\",\n     len = \"1.5\",\n     color = \"gray80\",\n     arrowsize = \"0.5\"]\n\n  \"1\" [label = \"📖 Relational and\\nlogical operators\", URL = \"#vba-operators\", tooltip = \"\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", fillcolor = \"DarkSeaGreen4\", pos = \"0,3!\"] \n  \"2\" [label = \"💡 Loops\", URL = \"#vba-loops\", tooltip = \"Loops\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"egg\", margin = \"0.2\", fillcolor = \"DarkSeaGreen4\", pos = \"2,3!\"] \n  \"3\" [label = \"💡 Conditional\\nstatements\", URL = \"#vba-cond\", tooltip = \"Conditional\\nstatements\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"egg\", margin = \"0.2\", fillcolor = \"DarkSeaGreen4\", pos = \"4.5,3!\"] \n  \"4\" [label = \"💡 Example\\nFind Jen\", URL = \"#vba-ex-jen\", tooltip = \"Example using loops and conditinal statements\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"egg\", margin = \"0.2\", fillcolor = \"DarkSeaGreen4\", pos = \"7,3!\"] \n  \"5\" [label = \"💡 Example\\nA distance matrix\", URL = \"#vba-ex-dist-mat\", tooltip = \"Example using loops and conditinal statements\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"egg\", margin = \"0.2\", fillcolor = \"DarkSeaGreen4\", pos = \"10,3!\"] \n  \"6\" [label = \"💻 Exercises\", URL = \"#ex-vba-loops-cond\", tooltip = \"Exercises\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"egg\", margin = \"0.2\", fillcolor = \"DarkSeaGreen4\", pos = \"13,3!\"] \n  \"7\" [label = \"🎬 Relational Operators\", URL = \"https://youtu.be/d1nmq2Huz44\", tooltip = \"Relational Operators\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", fillcolor = \"PeachPuff3\", pos = \"0,2!\"] \n  \"8\" [label = \"🎬 Logical Operators\", URL = \"https://youtu.be/IYy9LKyAaCs\", tooltip = \"Logical Operators\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", fillcolor = \"PeachPuff3\", pos = \"0,1!\"] \n  \"9\" [label = \"🎬 Do While loop\", URL = \"https://youtu.be/QZd8SPovofU\", tooltip = \"Do While loop\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", fillcolor = \"PeachPuff3\", pos = \"2,1!\"] \n  \"10\" [label = \"🎬 For Next loop\", URL = \"https://youtu.be/hfdjZlknAI8\", tooltip = \"For Next loop\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", fillcolor = \"PeachPuff3\", pos = \"2,2!\"] \n  \"11\" [label = \"🎬 IF statements\", URL = \"https://youtu.be/bsQbgoSf7Ig\", tooltip = \"IF statements\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", fillcolor = \"PeachPuff3\", pos = \"4.5,2!\"] \n\"1\"->\"2\" [color = \"black\", arrowhead = \"vee\"] \n\"1\"->\"7\" [color = \"black\", arrowhead = \"vee\"] \n\"2\"->\"3\" [color = \"black\", arrowhead = \"vee\"] \n\"2\"->\"10\" [color = \"black\", arrowhead = \"vee\"] \n\"3\"->\"4\" [color = \"black\", arrowhead = \"vee\"] \n\"3\"->\"11\" [color = \"black\", arrowhead = \"vee\"] \n\"4\"->\"5\" [color = \"black\", arrowhead = \"vee\"] \n\"5\"->\"6\" [color = \"black\", arrowhead = \"vee\"] \n\"7\"->\"8\" [color = \"black\", arrowhead = \"vee\"] \n\"10\"->\"9\" [color = \"black\", arrowhead = \"vee\"] \n}","config":{"engine":"dot","options":null}},"evals":[],"jsHooks":[]}</script>
```

If you like a different learning style there is a lot for videos about VBA online such as course [14-Hour VBA Course][vba-yt-course2]. The videos have been pointed out as online supplements in the learning path diagram. However, they are not necessary for the course. Since Excel change as new versions arrive and it work on different operating systems, the look in the screenshots and videos might be a bit different from your version. However, you still should be able to understand it. 

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


## Relational and logical operators {#vba-operators}

Often you will need to compare a variable with another one. For this you need the *relational operators* given in Table \@ref(tab:comp-ope) (also called comparison operators).

<table class="table table-striped table-hover table-condensed table-responsive" style="margin-left: auto; margin-right: auto;border-bottom: 0;">
<caption>(\#tab:comp-ope)Comparison/relational operators.</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Operator </th>
   <th style="text-align:left;"> Description </th>
   <th style="text-align:left;"> Example </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> = </td>
   <td style="text-align:left;"> Equal to. </td>
   <td style="text-align:left;"> A = B ' False </td>
  </tr>
  <tr>
   <td style="text-align:left;"> &lt;&gt; </td>
   <td style="text-align:left;"> Not equal to </td>
   <td style="text-align:left;"> A &lt;&gt; B ' True </td>
  </tr>
  <tr>
   <td style="text-align:left;"> &gt; </td>
   <td style="text-align:left;"> Greater than. </td>
   <td style="text-align:left;"> A &gt; B ' False </td>
  </tr>
  <tr>
   <td style="text-align:left;"> &lt; </td>
   <td style="text-align:left;"> Less than. </td>
   <td style="text-align:left;"> A &lt; B ' True </td>
  </tr>
  <tr>
   <td style="text-align:left;"> &gt;= </td>
   <td style="text-align:left;"> Greater than or equal to. </td>
   <td style="text-align:left;"> A &lt; B ' True </td>
  </tr>
  <tr>
   <td style="text-align:left;"> &lt;= </td>
   <td style="text-align:left;"> Less than or equal to. </td>
   <td style="text-align:left;"> A &lt;= B ' True </td>
  </tr>
</tbody>
<tfoot><tr><td style="padding: 0; " colspan="100%">
<sup></sup> Assume that A = 2 and B=4.</td></tr></tfoot>
</table>

Let us consider an example (try to guess the output before running the procedure):

```
'' Comparison of two variables
Sub TM3_Comparison()
   Dim intA As Integer
   Dim intB As Integer

   intA = 10
   intB = 20
   
   If intA = intB Then
      MsgBox ("A = B is True")
   Else
      MsgBox ("A = B is False")
   End If
   
   If intA <> intB Then
      MsgBox ("A not equal B is True")
   Else
      MsgBox ("A not equal B is False")
   End If

   If intA > intB Then
      MsgBox ("A greter then B is True")
   Else
      MsgBox ("A greter then B is False")
   End If

   If intA <= intB Then
      MsgBox ("A less than or equal to B is True")
   Else
      MsgBox ("A less than or equal to B is False")
   End If
End Sub
```

Given two boolean expressions we use *logical operators* to compare them (see Table \@ref(tab:logi-ope)) 

<table class="table table-striped table-hover table-condensed table-responsive" style="margin-left: auto; margin-right: auto;border-bottom: 0;">
<caption>(\#tab:logi-ope)Logical operators.</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Operator </th>
   <th style="text-align:left;"> Description </th>
   <th style="text-align:left;"> Example </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> AND </td>
   <td style="text-align:left;"> If both the conditions are True, then the expression is true. </td>
   <td style="text-align:left;"> A&lt;&gt;0 AND B&lt;&gt;0 ' False </td>
  </tr>
  <tr>
   <td style="text-align:left;"> OR </td>
   <td style="text-align:left;"> If any of the two conditions are True, then the expression is true. </td>
   <td style="text-align:left;"> A&lt;&gt;0 OR B&lt;&gt;0 ' True </td>
  </tr>
  <tr>
   <td style="text-align:left;"> NOT </td>
   <td style="text-align:left;"> Reverse logical: if the expression is true, then the NOT operator returns false. </td>
   <td style="text-align:left;"> NOT(A&lt;&gt;0 OR B&lt;&gt;0) ' False </td>
  </tr>
  <tr>
   <td style="text-align:left;"> XOR </td>
   <td style="text-align:left;"> Logical Exclusion. If exactly one condition is True, the result is True. </td>
   <td style="text-align:left;"> A&lt;&gt;0 XOR B&lt;&gt;0 ' True </td>
  </tr>
</tbody>
<tfoot><tr><td style="padding: 0; " colspan="100%">
<sup></sup> Assume that A = 0 and B=4.</td></tr></tfoot>
</table>

Let us consider an example (try to guess the output before running the procedure):

```
Sub TM3_Logical()
    If 5 > 4 And 6 > 2 Then
        MsgBox ("5 > 4 And 6 > 2 is True")
    Else
        MsgBox ("5 > 4 And 6 > 2 is False")
    End If
    
    If 1 > 4 Or 1 > 2 Then
        MsgBox ("1 > 4 Or 1 > 2 is True")
    Else
        MsgBox ("1 > 4 Or 1 > 2 is False")
    End If
    
    If 6 > 4 Or 1 > 2 Then
        MsgBox ("6 > 4 Or 1 > 2 is True")
    Else
        MsgBox ("6 > 4 Or 1 > 2 is False")
    End If
    
    If 5 > 4 And Not 6 > 2 Then
        MsgBox ("5 > 4 And Not 6 > 2 is True")
    Else
        MsgBox ("5 > 4 And Not 6 > 2 is False")
    End If
    
    ' If more than two boolean expressions remember parenthesis
    If (5 > 4 Xor 6 > 2) And 7 > 10 Then   ' Xor (exactly one is true)
        MsgBox ("(5 > 4 Xor 6 > 2) And 7 > 10 is True")
    Else
        MsgBox ("(5 > 4 Xor 6 > 2) And 7 > 10 is False")
    End If
    
    If 5 > 4 Xor (6 > 2 And 7 > 10) Then
        MsgBox ("5 > 4 Xor (6 > 2 And 7 > 10) is True")
    Else
        MsgBox ("5 > 4 Xor (6 > 2 And 7 > 10) is False")
    End If
End Sub
```

Note parentheses have an impact on the result. Remember to use them correctly. 



## Loops {#vba-loops}

Loops are used to repeat pieces of code. There are many types of loops statements but here we will consider `For` and `While` loops. The structure of a `For` loop is:

```
For i = 1 To 10 
    <code>
Next
```

Here `i` is a counter used to repeat the code inside the loop 10 times. In general we do not use a suffix for counter variables (`i` should have been named `intI` according to our naming convention). An example on a simple for loop is:

```
Sub TM3_Loop1()
    Dim i As Integer
    
    For i = 1 To 3
        MsgBox (i) ' What will the output be?
    Next
End Sub
```

You can use the `Step` keyword to increment the counter by more than one:

```
Sub TM3_Loop2()
    Dim i As Integer
    
    For i = 2 To 9 Step 2
        If i <> 4 Then
            MsgBox (i) ' What will the output be?
        End If
    Next
End Sub
```

You can use `Exit For` to end a for loop prematurely (jump to the code after the loop):

```
'' Write the row number in column A and exit after row 10 even though the loop runs to 20
Sub TM3_WriteNumbers1()
   Dim r As Integer
   
   Worksheets("TM3").Activate  ' activate the sheet we want to use
   For r = 6 To 20
      If r > 10 Then
         Exit For
      End If
      Cells(r, 1) = r  ' write to row r, col 1 (A)
   Next
End Sub
```

Loops may be nested inside each other. For instance if some action needs to be performed for each day and each employee or for each project and each work package of that project.

```
Sub TM3_NestedLoops()
    Dim i As Integer
    Dim j As Integer
    
    For i = 1 To 2
        For j = 1 To 3
            MsgBox ("(" & i & "," & j & ")")
        Next
    Next
End Sub
```

The structure of a `While` loop is:
      
```
Do While <condition true>  
    <code>
Loop
```

Here the loops runs until the condition is not true. While loops are useful when you do not know how many times to do the loop in advance. An example on a simple while loop is:

```
'' Write the row number in column B and exit after row 10
Sub TM3_WriteNumbers2()
    Dim r As Integer
    
    Worksheets("TM3").Activate
    r = 6
    Do While r < 11
        Cells(r, 2) = r ' write to row r, col 2 (B)
        r = r + 1
    Loop
End Sub
```

You can use `Exit Do` to end a while loop prematurely (jump to the code after the loop):

```
'' Write 2, 4, ... in column C and exit after 21 or if equals 12
Sub TM3_WriteNumbers3()
    Dim i As Integer, r As Integer
    
    Worksheets("TM3").Activate
    r = 6
    i = 2
    Do While i < 21
        Cells(r, 3) = i ' write to row r, col 3 (C)
        If i = 12 Then
            Exit Do
        End If
        r = r + 1
        i = i + 2
    Loop
End Sub
```

Beware of endless loops. If the stopping criteria is NOT reached when using a while loop, the computer will keep going:

```
' An endless loop. Do not run if you don't know how to stop
Sub TM3_EndlessLoop()
    Dim i As Integer
    While i >= 0
        i = i + 1
    Wend
End Sub
```

An endless loop can be hard to stop depending on the operating system you use. Therefore always “save” before you “run” the code. Make sure the stopping criterion will be reached. You may try to stop the program using a shortcut (<svg viewBox="0 0 448 512" style="height:1em;position:relative;display:inline-block;top:.1em;" xmlns="http://www.w3.org/2000/svg">  <path d="M0 93.7l183.6-25.3v177.4H0V93.7zm0 324.6l183.6 25.3V268.4H0v149.9zm203.8 28L448 480V268.4H203.8v177.9zm0-380.6v180.1H448V32L203.8 65.7z"></path></svg> try Ctrl + Break or Ctrl + Alt + Delete. <svg viewBox="0 0 384 512" style="height:1em;position:relative;display:inline-block;top:.1em;" xmlns="http://www.w3.org/2000/svg">  <path d="M318.7 268.7c-.2-36.7 16.4-64.4 50-84.8-18.8-26.9-47.2-41.7-84.7-44.6-35.5-2.8-74.3 20.7-88.5 20.7-15 0-49.4-19.7-76.4-19.7C63.3 141.2 4 184.8 4 273.5q0 39.3 14.4 81.2c12.8 36.7 59 126.7 107.2 125.2 25.2-.6 43-17.9 75.8-17.9 31.8 0 48.3 17.9 76.4 17.9 48.6-.7 90.4-82.5 102.6-119.3-65.2-30.7-61.7-90-61.7-91.9zm-56.6-164.2c27.3-32.4 24.8-61.9 24-72.5-24.1 1.4-52 16.4-67.9 34.9-17.5 19.8-27.8 44.3-25.6 71.9 26.1 2 49.9-11.4 69.5-34.3z"></path></svg> try ⌘., ⌃ +  Esc or  ⌘⌥ + Esc.)

Finally, the `For Each` loop has to be mentioned:

```
Sub TM3_ForEach()
   Dim rngC As Range
   Dim i As Integer
   
   Worksheets("TM3").Activate
   i = 1
   For Each rngC In Range("D6:E9")
      rngC = i
      i = i + 1
   Next
End Sub
```

The loop is used for running trough a set of objects (we will have a closer look at objects in Section \@ref(vba-objects)). Here `rngC` is used to run through all the cells in the range and set values. Note a range is scanned left-down.


## Conditional statements {#vba-cond}

Conditional statements are used to redirect code execution based on the conditions. If the condition is met then the code is executed. The general layout of an if-then-else conditional statement is:

```
If <condition> Then
 <code>
ElseIf <condition> Then
 <code>
ElseIf <condition> Then
 <code>
Else
 <code>
End If

If <condition> Then <code> Else <code>  ' single line form
```

You can drop the `ElseIf` and `Else` code chunks. Other conditional statements exists but in general you can formulate them using an if-then-else statement. Let us try to use a conditional statement to separate persons in two groups:

```
'' Seperate persons into two groups (names are written in 2 columns)
Sub TM3_SeparatePersons1()
    Dim r As Integer
    
    Worksheets("TM3_Separate1").Activate ' activate the correct sheet
    For r = 2 To 12 ' scan rows 2-12
        If Cells(r, 2) = "Professor" Then
            Cells(r, 3) = Cells(r, 1)  ' output in row C
        Else
            Cells(r, 4) = Cells(r, 1)  ' output in row D
        End If
    Next
End Sub
```

We use variable `r` to store the row number we want to write to and then an if statement to separate professors from others. The output will be:

<div class="figure" style="text-align: center">
<img src="./img/sep-persons-1.png" alt="Separate into two groups." width="400px" />
<p class="caption">(\#fig:sep-2)Separate into two groups.</p>
</div>

If you want to separate both professors and associate professors from others, you may modify the if statement and use an `ElseIf`:

```
'' Seperate persons into 3 groups (names are written in 3 columns)
Sub TM3_SeparatePersons2()
    Dim r As Integer
    
    Worksheets("TM3_Separate2").Activate ' activate the correct sheet
    For r = 2 To 12
        If Cells(r, 2) = "Professor" Then
            Cells(r, 3) = Cells(r, 1)
        ElseIf Cells(r, 2) = "Associate Professor" Then
            Cells(r, 4) = Cells(r, 1)
        Else
            Cells(r, 5) = Cells(r, 1)
        End If
    Next
End Sub
```

Finally, let us try to separate into five groups: 

```
'' Seperate persons into 5 groups (names are written in 5 columns)
Sub TM3_SeparatePersons3()
    Dim r As Integer
    
    Worksheets("TM3_Separate3").Activate ' activate the correct sheet
    For r = 2 To 12
        If Cells(r, 2) = "Professor" Then
            Cells(r, 3) = Cells(r, 1)
        ElseIf Sheet1.Cells(r, 2) = "Associate Professor" Then
            Cells(r, 4) = Cells(r, 1)
        ElseIf Sheet1.Cells(r, 2) = "Post Doc" Then
            Cells(r, 5) = Cells(r, 1)
        ElseIf Sheet1.Cells(r, 2) = "PhD student" Then
            Cells(r, 6) = Cells(r, 1)
        Else
            Cells(r, 7) = Cells(r, 1)
        End If
    Next
End Sub
```

Here the output will be:

<div class="figure" style="text-align: center">
<img src="./img/sep-persons-3.png" alt="Separate into five groups." width="600px" />
<p class="caption">(\#fig:sep-5)Separate into five groups.</p>
</div>


## Example - Find Jen {#vba-ex-jen}

Consider column A in Figure \@ref(fig:sep-5). Assume we want to check if Jen is in a name and output her position. We can use a for loop for this:

```
'' Find cell with Jen using a For loop
Sub TM3_FindJen1()
    Dim r As Integer
    
    Worksheets("TM3_Separate1").Activate ' activate the correct sheet
    For r = 2 To 12
        If InStr(Cells(r, 1), "Jen ") > 0 Then  ' InStr returns first char position at which match is found (0 if no match)
            MsgBox "Jen is a " & Cells(r, 2) & " (Row " & r & ")"
            Exit For   ' exit the loop
        End If
    Next
End Sub
```

We scan all rows for Jen and return her position. If we found her, then we exit the for loop (no need to search further). What happens if we search for `"Jen"` and not `"Jen "`? 

<div class="figure" style="text-align: center">
<img src="./img/tm3-jen.png" alt="Search for Jen." width="300px" />
<p class="caption">(\#fig:jen1)Search for Jen.</p>
</div>
 
The same can be done using a while loop:

```
'' Find cell with Jen using a While loop
Sub TM3_FindJen2()
    Dim r As Integer
    
    r = 2
    Do While InStr(Cells(r, 1), "Jen ") = 0
        r = r + 1
    Loop
    MsgBox "Jen is a " & Cells(r, 2) & " (Row " & r & ")"
End Sub
```

Beware of endless looping here. What happens if Jen is not present in column A? A more error safe while loop is:

```
'' Find cell with Jen using a While loop and better stopping criteria
Sub TM3_FindJen3()
    Dim r As Integer
    
    r = 2
    Do While InStr(Cells(r, 1), "Jen ") = 0 And r < 13
        r = r + 1
    Loop
    If (r = 13) Then
        MsgBox ("Jen not found")
    Else
        MsgBox "Jen is a " & Cells(r, 2) & " (Cell A" & r & ")"
    End If
End Sub
```


## Example - A distance matrix {#vba-ex-dist-mat}

Assume that you have a set of $n=10$ locations: 

<table class="table table-striped table-hover table-condensed table-responsive" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:unnamed-chunk-5)A set of locations</caption>
 <thead>
  <tr>
   <th style="text-align:center;"> Location number </th>
   <th style="text-align:center;"> $x$-coordinate </th>
   <th style="text-align:center;"> $y$-coordinate </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:center;"> 1 </td>
   <td style="text-align:center;"> 6 </td>
   <td style="text-align:center;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 2 </td>
   <td style="text-align:center;"> 1 </td>
   <td style="text-align:center;"> 5 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 3 </td>
   <td style="text-align:center;"> 6 </td>
   <td style="text-align:center;"> 3 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 4 </td>
   <td style="text-align:center;"> 7 </td>
   <td style="text-align:center;"> 4 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5 </td>
   <td style="text-align:center;"> 4 </td>
   <td style="text-align:center;"> 6 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6 </td>
   <td style="text-align:center;"> 4 </td>
   <td style="text-align:center;"> 7 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 7 </td>
   <td style="text-align:center;"> 5 </td>
   <td style="text-align:center;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 8 </td>
   <td style="text-align:center;"> 1 </td>
   <td style="text-align:center;"> 4 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 9 </td>
   <td style="text-align:center;"> 4 </td>
   <td style="text-align:center;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 10 </td>
   <td style="text-align:center;"> 6 </td>
   <td style="text-align:center;"> 5 </td>
  </tr>
</tbody>
</table>

The euclidean distance $d$ between location $l_1 = (x_1, y_1)$ and $l_2 = (x_2, y_2)$ are: $$d(1,2)=\sqrt{(x_1-x_2)^2 + (y_1-y_2)^2}.$$ In VBA the function becomes:

```
'' Calculate distance between two points
'
' @param x1 x-coordinate of first point.
' @param y1 y-coordinate of first point.
' @param x2 x-coordinate of second point.
' @param y2 y-coordinate of second point.
Private Function TM3_Distance(x1, y1, x2, y2)
    Dim x As Double
    Dim y As Double
    
    x = x1 - x2
    y = y1 - y2
    TM3_Distance = Sqr((x * x) + (y * y))
End Function
```

Assume that you want to calculate the *distance matrix* $D$ where entry $(i,j)$ contains the distance between location $i$ and location $j$.

Consider the locations in columns B and C:

<div class="figure" style="text-align: center">
<img src="./img/dist-mat.png" alt="Distance matrix worksheet." width="100%" />
<p class="caption">(\#fig:dist-mat)Distance matrix worksheet.</p>
</div>

We want to fill out the cells F1:P11 with the distances. This have been done using procedure:

```
'' Create a distance matrix starting in column 6
'
' @pre Assume that coordinates are stored in column B and C starting from row 2
'      and that number of points are stored in E1.
Public Sub TM3_MakeDistanceMatrix()
    Dim n As Integer
    Dim i As Integer
    Dim j As Integer
      
    n = Range("E1")
    For i = 1 To n  ' add row and column headers
        Cells(i + 1, 6) = Cells(1 + i, 1) ' row equals i+1
        Cells(1, 6 + i) = Cells(1 + i, 1) ' column equals i+6
    Next
    
    ' add distances
    For i = 1 To n
        For j = 1 To n
           Cells(i + 1, j + 6) = TM3_Distance(Cells(i + 1, 2), Cells(i + 1, 3), Cells(j + 1, 2), Cells(j + 1, 3))
        Next
    Next
End Sub
```

First, row and column headers are written to the cells. Next, we use a nested for loop to calculate the distances and output them to the cells. Note we in fact calculate the same distance two times (the distance from $i$ to $j$ equals the distance from $j$ to $i$). Since we have symmetric distances there is no need to do this and it can be avoided by letting the inner loop in the nested loops be dependent on the outer loop: 

```
'' Create a symetric distance matrix with only the upper right part filled starting in column 6.
'
' @pre Assume that coordinates are stored in column B and C starting from row 2
'      and that number of points are stored in E1.
Public Sub TM3_MakeSymetricDistanceMatrix()
    Dim n As Integer
    Dim i As Integer
    Dim j As Integer
      
    n = Range("E1")
    For i = 1 To n
        Cells(i + 1, 6) = Cells(1 + i, 1)
        Cells(1, 6 + i) = Cells(1 + i, 1)
    Next
    
    For i = 1 To n
        For j = i + 1 To n
           Cells(i + 1, j + 6) = TM3_Distance(Cells(i + 1, 2), Cells(i + 1, 3), Cells(j + 1, 2), Cells(j + 1, 3))
        Next
    Next
End Sub
```

<div class="figure" style="text-align: center">
<img src="./img/dist-mat-sym.png" alt="Distance matrix worksheet with symmetric distances." width="100%" />
<p class="caption">(\#fig:dist-mat-sym)Distance matrix worksheet with symmetric distances.</p>
</div>


## Recap

- Loops are used to repeat pieces of code.
- For loops (repeat a number of times):
  ```
  For i = 1 To 10 
      <code>
  Next
  ```
      
- While loops (repeat until a condition is met):

   ```
   Do While <condition> ' repeat while true     
       <code>
   Loop
   ```
      
- Use `Exit for` and `Exit Do` to break a `For` and a `Do While` loop before it ends (jump to the code after the loop). 
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
   If <condition> Then
    <code>
   ElseIf <condition> Then
    <code>
   Else
    <code>
   End If
   ```
   
   You may drop the `ElseIf` and `Else` code chunks. 


```{=html}
<div>
You may also have a look at the
<a href="https://bss-osca.github.io/tfa/slides/03_vba-loops-cond-slides.html" target="_blank">slides for this module</a>
.
</div>
```

## Exercises {#ex-vba-loops-cond}

Below you will find a set of exercises. Always have a look at the exercises before you meet in your study group and try to solve them yourself. Are you stuck, see the [help page](#help). Some of the solutions to each exercise can be seen by pressing the button at each question. Beware, you will not learn by giving up too early. Put some effort into finding a solution!


```{=html}
<div>
A template with VBA code for this module is given in the file
<a href="https://github.com/bss-osca/tfa/blob/master/vba/03-vba-loops-cond-template.xlsm" target="_blank">03-vba-loops-cond-template.xlsm</a>
(open it and use it while reading the notes). Have a look inside the module
<i>TM3_ex</i>
in the VBA editor for examples used in the notes and during lectures. Have a look at module
<i>TM3_exercises</i>
for exercises. The template file for next teaching module will contain guiding answers for the exercises to this teaching module.
</div>
```

### Exercise - Loops {#ex-vba-loops}

Use the sheet _TM3_ for output.

   (1) Create a for loop that writes numbers 1 to 4 in rows 25 to 28 in column A.  
   (2) Create a do while loop that writes numbers 1 to 4 in rows 25 to 28 in column B. 
   (3) Create a loop that writes numbers 1 to 4 in rows 27 to 30 in column C.
   (4) Create a loop that writes numbers -1 to -4 in rows 25 to 28 in column D.
   (5) Create a loop that writes numbers 1 to 4 in rows 28 to 31 in column E, except if the number is 3 then the output should to a string `missing`.
   (6) Create a do while loop that writes numbers i = 1, 2, ... in column G (starting in row 25) until i/5 + 3 = 8. Hint: you may use a `Exit Do` to quit the loop. 
   (7) Create a sub that runs all the loops.

### Exercise - Conditional statements {#ex-vba-cond}

Consider worksheet *TM3_Numbers*, which contains a set of numbers. 

   (1) Create a procedure with the following features
       * Make a copy of the numbers with the upper left cell starting G1.
       * Scan all the numbers and remove (clear the cell) all the negative numbers (you may use a `For Each` loop).
       * Highlight all the numbers above 20 (using e.g. `rngC.Interior.ColorIndex = 37`).
       * Add a button to worksheet *TM3_Numbers* that run the procedure. 

   (2) Create a procedure with the following features:
       * Scan the numbers and find
         - the sum of all non-negative numbers,
         - the mean of all negative numbers.
       * Use a message box to display the sum and mean calculated.
       * Add a button to worksheet *TM3_Numbers* that run the procedure. 

*This exercise is a slightly modified version an exam assignment (reexam 2022-A5).*


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
