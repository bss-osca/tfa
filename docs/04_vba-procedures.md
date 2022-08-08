---
output: html_document
editor_options: 
  chunk_output_type: console
---





# Procedures {#mod-vba-procedures}

This module gives a short introduction to procedures. A procedure is a piece of code stored in a module which contains a series of computational steps that will be carried out when the procedure is called. VBA has two kinds of procedures subs (short for subroutine) and functions. Both are basic building blocks in programming. The main differences between a sub and a function is:

**Subs**

  - Can make changes to the worksheet.
  - Can modify its surroundings.
  - Can be executed by a button (a macro - if no arguments).
  - Cannot return anything.

**Functions**

  - Can return something.
  - Can be used in Excel.
  - Cannot be used as a macro.


```{=html}
<div>
A template with VBA code for this module is given in the file
<a href="https://github.com/bss-osca/tfa/blob/master/vba/04-vba-procedures-template.xlsm" target="_blank">04-vba-procedures-template.xlsm</a>
(open it and use it while reading the notes). Have a look inside the module
<i>TM4_ex</i>
in the VBA editor for examples used in the notes and during lectures. Have a look at module
<i>TM4_exercises</i>
for exercises. The template file for next teaching module will contain guiding answers for the exercises to this teaching module.
</div>
```

During execution of procedures it may be useful to use the debugger to run the code step by step. A very short introduction to debugging in VBA is given in Section \@ref(vba-debug). Read it before continuing this teaching module.

#### Learning path diagram {-}

Click/hover the nodes to follow links and see details.


```{=html}
<div id="htmlwidget-22d350465065095cb885" style="width:100%;height:100px;" class="grViz html-widget"></div>
<script type="application/json" data-for="htmlwidget-22d350465065095cb885">{"x":{"diagram":"digraph {\n\ngraph [layout = \"neato\",\n       outputorder = \"edgesfirst\",\n       bgcolor = \"white\"]\n\nnode [fontname = \"Helvetica\",\n      fontsize = \"10\",\n      shape = \"circle\",\n      fixedsize = \"true\",\n      width = \"0.5\",\n      style = \"filled\",\n      fillcolor = \"aliceblue\",\n      color = \"gray70\",\n      fontcolor = \"gray50\"]\n\nedge [fontname = \"Helvetica\",\n     fontsize = \"8\",\n     len = \"1.5\",\n     color = \"gray80\",\n     arrowsize = \"0.5\"]\n\n  \"1\" [label = \"💡 Subs and functions\\nThe basics\", URL = \"#vba-subs-functions\", tooltip = \"Subs and functions\\nThe basics (interactive)\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"egg\", margin = \"0.2\", fillcolor = \"DarkSeaGreen4\", pos = \"2,0!\"] \n  \"2\" [label = \"💡 Optional\\narguments\", URL = \"#vba-optional-arg\", tooltip = \"Optional\\narguments (interactive)\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"egg\", margin = \"0.2\", fillcolor = \"DarkSeaGreen4\", pos = \"4.7,0!\"] \n  \"3\" [label = \"📖 Public and private\\nprocedures\", URL = \"#vba-pub-priv\", tooltip = \"Public and private\\nprocedures (reading)\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", fillcolor = \"DarkSeaGreen4\", pos = \"7,0!\"] \n  \"4\" [label = \"💡 Passing arguments\\nby reference\\nor by value\", URL = \"#vba-byref\", tooltip = \"Passing arguments\\nby reference\\nor by value (interactive)\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"egg\", margin = \"0.2\", fillcolor = \"DarkSeaGreen4\", pos = \"10,0!\"] \n  \"5\" [label = \"💡 Built-in\\nfunctions\", URL = \"#vba-built-in\", tooltip = \"Built-in\\nfunctions (interactive)\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"egg\", margin = \"0.2\", fillcolor = \"DarkSeaGreen4\", pos = \"12.7,0!\"] \n  \"6\" [label = \"💡 Example\\nSelection\\nof test persons\", URL = \"#vba-test-persons\", tooltip = \"Example\\nSelection\\nof test persons (interactive)\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"egg\", margin = \"0.2\", fillcolor = \"DarkSeaGreen4\", pos = \"15,0!\"] \n  \"7\" [label = \"💻 Exercises\", URL = \"#ex-vba-procedures\", tooltip = \"Exercises (interactive)\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"egg\", margin = \"0.2\", fillcolor = \"DarkSeaGreen4\", pos = \"17.5,0!\"] \n\"1\"->\"2\" [color = \"black\", arrowhead = \"vee\"] \n\"2\"->\"3\" [color = \"black\", arrowhead = \"vee\"] \n\"3\"->\"4\" [color = \"black\", arrowhead = \"vee\"] \n\"4\"->\"5\" [color = \"black\", arrowhead = \"vee\"] \n\"5\"->\"6\" [color = \"black\", arrowhead = \"vee\"] \n\"6\"->\"7\" [color = \"black\", arrowhead = \"vee\"] \n}","config":{"engine":"dot","options":null}},"evals":[],"jsHooks":[]}</script>
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


## Subs and functions - The basics {#vba-subs-functions}

A sub is declared using:

```
Sub SubName(arg1 As <datatype>, arg2 As <datatype>)
   <code>
End Sub
```

The name of the sub is `SubName` and it takes two *arguments* `arg1` and `arg2`. A sub can take an arbitrary number of arguments. Until now we have mostly considered subs with no arguments often called a macro. Macros can be called using a button in Excel. 

A function is declared using:

```
Function FunctionName(arg1 As <datatype>, arg2 As <datatype>) As <return datatype>
 <code>
 FunctionName = value  ' assign a return value to the function
End Sub
```

The name of the function is `FunctionName` and it takes two *arguments* `arg1` and `arg2`. A function can take an arbitrary number of arguments. A function always return a value of a data type (a sub do not return anything). You return a value by assigning it to the variable `FunctionName` (same as the function name). 

Let us consider a simple sub with one argument: 

```
Sub TM4_SimpleSub(str As String)
   MsgBox (str)
End Sub
```

and a simple function with two arguments:

```
Function TM4_SimpleFunc(dblA As Double, dblB As Double) As Integer
   TM4_SimpleFunc = dblA + dblB  ' return variable equals function name
End Function
```

You call a sub from another procedure using the `Call` keyword and a another function by assigning its return value to a variable:

```
' Try running it using the debugger (Ctrl + F8 (win) or cmd + shift + I (mac))
Sub TM4_CallSimpleProc()
   Dim dblV As Double
   
   MsgBox ("Ready")
   Call TM4_SimpleSub("SimpleSub")  ' call a sub within a procedure
   dblV = TM4_SimpleFunc(3, 4)      ' call a function within a procedure
   MsgBox ("Value is " & intV)
End Sub
```

It is always good coding practice to document you procedures:

```
'' Product of two numbers
' @param i First number
' @param j Second number
' @return The product i * j
' @remarks The numbers are doubles.
Function TM4_ProductFunc(i As Double, j As Double) As Double
    TM4_ProductFunc = i * j
End Function

'' Product of two numbers which are stored in dblV (since ByRef is the default).
' @param i First number
' @param j Second number
' @param dblV Stores the product
' @remarks The numbers are doubles.
Private Sub TM4_ProductSub(i As Double, j As Double, dblV As Double)
    dblV = i * j
End Sub
```

Note both procedures above do the same thing. The function returns the product and the procedure stores the product in argument `dblV` which is modified when the function call is returned:

```
'' Use TM4_ProductSub (TM4_ProductFunc produce the same result)
' Try running it using the debugger (Ctrl + F8 (win) or cmd + shift + I (mac))
Sub TM4_RunProductSub()
    Dim dblV As Double
    
    dblV = 4
    MsgBox ("Current value is " & dblV)  ' Current value is 4
    Call TM4_ProductSub(7, 3, dblV)      ' dblV = TM4_ProductFunc(7, 3) (same result)
    MsgBox ("Current value is " & dblV)  ' Current value is 21
End Sub
```

The reason is that arguments are per default references pointing to the same place in memory (we will look at the details in Section \@ref(vba-byref)).

You can use `Exit Sub`/`Exit Function` to exit the sub/function early in the code:

```
'' Division of two numbers
' @param i First number.
' @param j Second number.
' @return Divison i / j.
' @remarks The numbers are doubles.
Sub TM4_DivisionSub(i As Double, j As Double)
    If j = 0 Then
      MsgBox ("Error: division with zero!")
      Exit Sub
    End If
    MsgBox ("Value is " & i / j)
End Sub

'' Run using F5
Sub TM4_TestDivisionSub()
    Call TM4_DivisionSub(8, 2)  ' no error
    Call TM4_DivisionSub(8, 0)  ' gives an error message
End Sub
```


## Optional arguments {#vba-optional-arg}

Often you define procedures that have arguments with a default value. You can do this using the `Optional` keyword:

```
'' Convert kilograms to grams or pounds
' @param dblKg Kilograms.
' @param blnToGrams Convert to grams (if true) otherwise to pounds.
' @return Converted value.
Function TM4_ConvertKg(dblKg As Double, Optional blnToGrams As Boolean = True)
   If blnToGrams Then
      TM4_ConvertKg = dblKg * 1000
      Exit Function
   End If
   TM4_ConvertKg = dblKg * 2.20462
End Function

'' Run using F5
Sub TM4_TestConvertKg()
   MsgBox (TM4_ConvertKg(10))         ' use default value (to grams)
   MsgBox (TM4_ConvertKg(10, False))  ' to pounds
End Sub
```

Here we have one optional argument with default value equal to true. Now the function can be called with one argument (use the default value of the second argument) or with two arguments. Have a look at cells A8:C13 in worksheet *TM4* (Figure \@ref(fig:tm4-sheet)) where we use the function to find convert to grams (`TM4_ConvertKg(A8)`) and pounds (`TM4_ConvertKg(A8; FALSE)`).

Let us try to define a sub that format some cells (the content have been found using the macro recorder and then cleaned):

```
'' Format a range
'@param rng Range to format.
'@param intInteriorColor Interior color index.
'@param intFontColor Font color index.
'@param intFontSize Font size.
Sub TM4_FormatCell(rng As Range, Optional intInteriorColor As Integer = 0, _
 Optional intFontColor As Integer = 44, Optional intFontSize As Integer = 12)
    rng.Interior.ColorIndex = intInteriorColor
    rng.Font.ColorIndex = intFontColor
    rng.Font.Size = intFontSize
End Sub

'' Run using F5
Sub TestingFormatCell()
    Dim rng As Range
    
    Worksheets("TM4").Activate
    Call FormatCell(Range("A16"))       ' use default values
    Call FormatCell(Range("B16"), 46)   ' use background color index 46
    Call FormatCell(Range("C16"), , 21) ' set font color
    Call FormatCell(rng:=Range("D16"), intFontSize:=16, intFontColor:=23)  ' call sub using argument names explicit
End Sub
```

Observe that there is different ways to call a procedure with optional arguments. If you have may optional arguments it is best to use the last where you explicit state the argument names (here the order of the arguments do not matter either). Note that every argument following an optional argument in the procedure definition must also be optional. Moreover, if lines are to long you may split them using `_` (underscore).

In the example above we use the color index values in VBA (56 different ones). Let us have a look at them:

```
'' Run using F5
Sub TM4_SeeColorIndex()
   Dim r As Integer
   Dim c As Integer
   Dim i As Integer
   
   Worksheets("TM4").Activate
   i = 1
   For r = 18 To 40
      For c = 2 To 5
         Cells(r, c) = i
         Call TM4_FormatCell(rng:=Cells(r, c), intInteriorColor:=i, intFontColor:=1 + i Mod 4)
         If i = 56 Then
            Exit Sub
         End If
         i = i + 1
      Next
   Next
End Sub
```

The output will be outputted from row 18 (column B-E):

<div class="figure" style="text-align: center">
<img src="./img/tm4-sheet.png" alt="TM4 worksheet." width="400px" />
<p class="caption">(\#fig:tm4-sheet)TM4 worksheet.</p>
</div>


## Public and private procedures {#vba-pub-priv}

You may use the keyword `Private` or `Public` (default) when you define a procedure. For instance:

```
Private Sub SubName(arg1 As <datatype>, arg2 As <datatype>)
   <code>
End Sub
```

A private procedure can only be used by other procedures in the module. This may be useful if you want to define 'internal' procedures that you only want to use in the module. This also imply that a private sub can not be called from a button and a private function can not be called from a cell. Note the default value is `Public`. That is, if `Private` or `Public` is excluded, VBA will always treat the sub as if it were Public:

```
Sub SubName(arg1 As <datatype>, arg2 As <datatype>)  ' VBA assumes it is public (the default)
   <code>
End Sub

Public Sub SubName(arg1 As <datatype>, arg2 As <datatype>) ' same result as above
   <code>
End Sub
```


## Passing arguments by reference or by value {#vba-byref}

There are two ways of passing arguments to procedures:

```
Sub SubName(ByRef arg1 As <datatype>, ByVal arg2 As <datatype>)
 <code>
End Sub
```

Argument `arg1` is passed **by reference** (default). That is, no new memory is allocated when the procedure is called and as a result the procedure can have changed the value of `arg1` when the procedure stops. Note since the default, the result is the same if we omitted the keyword `ByRef`. Argument `arg2` is passed **by value**. That is, a copy of the variable is created in memory. Hence the procedure cannot change the value of `arg2` when the procedure stops (the copy is deleted). 

Using `ByRef` is faster and saves memory since we do not have to allocate new memory. We may use `ByRef` to return updated values of the input arguments (sub `TM4_ProductSub` did that). In fact you may have multiple arguments which when the sub finished have been modified. See it as the arguments have been modified with the result of the sub. Using `ByVal` is safer if you want be sure that the argument is not modified inside the procedure.

Try guessing the result of running sub `TM4_TestingBy`:

```
Private Function TM4_ByVal(ByVal i As Integer) As Integer
    i = i * 2
    MsgBox ("In ByVal i is " & i)
    TM4_ByVal = i * 5
End Function

'' Note "Function TM4_ByRef(i As Integer) As Integer" gives same result
Private Function TM4_ByRef(ByRef i As Integer) As Integer
    i = i * 2
    MsgBox ("In ByRef i is " & i)
    TM4_ByRef = i * 5
End Function


' Try running it using F5 or the debugger (Ctrl + F8 (win) or cmd + shift + I (mac))
Private Sub TM4_TestBy()
    Dim n As Integer
    Dim i As Integer
    
    i = 5
    MsgBox ("In the start i is " & i)
    n = TM4_ByVal(i)
    MsgBox ("Try gussing the values of n and i")
    MsgBox ("After TM4_ByVal i is " & i & " and " & n & " is returned.")
    n = TM4_ByRef(i)
    MsgBox ("Try gussing the values of n and i")
    MsgBox ("After TM4_ByRef i is " & i & " and " & n & " is returned.")
End Sub
```

### Return values from a sub

Since `ByRef` does not create a new copy of the argument in memory. We can return multiple values from a sub by

   1) Pass arguments (variables) by reference in the sub.
   2) Modify the variables inside the sub.
   
When the sub returns after it has been called the variables used a arguments contain the new updated values. See e.g `TM4_ProductSub` which returns the product in variable `dblV`. 


## Built-in functions {#vba-built-in}

VBA has a set of [built-in functions](https://bettersolutions.com/vba/functions/complete-list.htm) such as `Abs`, `Log` and `Date`. You call them by just writing their name:

```
'' Test VBA functions
' You can always get help by putting the crusor in the function name and press F1
Sub TM4_TestVBAfunctions()
   MsgBox ("Absolute value: " & Abs(-4.2))
   MsgBox ("Integer part: " & Fix(-4.2))
   MsgBox ("Floor of the number: " & Int(-4.2))
   MsgBox ("Natural logarithm: " & Log(16))
   MsgBox ("Random number [0,1[: " & Rnd())
   MsgBox ("Current date: " & Date)
   MsgBox ("Days from now: " & DateDiff("d", Date, DateValue("October, 28, 2022")))
End Sub
```

You can also use the [worksheet functions](https://bettersolutions.com/excel/functions/vba-or-excel.htm) in Excel. You call them using the `WorksheetFunction` object. A few examples:

```
'' Test worksheetfunctions
' You can always get help by putting the crusor in the function name and press F1
Sub TM4_TestWorksheetfunctions()
   Dim r As Integer
   Dim c As Integer
   
   Worksheets("TM4").Activate
   MsgBox ("Numbers above 80: " & WorksheetFunction.CountIf(Range("B33:E38"), ">80")) ' count numbers above
   MsgBox ("Sumproduct: " & WorksheetFunction.SumProduct(Range("B33:E33"), Range("B34:E34")))
   MsgBox ("Max: " & WorksheetFunction.Max(Range("B33:E38")))
   
   For r = 40 To 45
      For c = 2 To 4
         Cells(r, c) = WorksheetFunction.RandBetween(0, 9)
      Next
   Next
End Sub
```

## Example - Selection of test persons {#vba-test-persons}

*This example is a slightly modified version an exam assignment (exam 2021-A6).*

A virus has infected a number of persons. A possible cure has been developed, but the effect of it is expected to be dependent on the persons’ height. The cure can be tested on non-infected persons and the findings of this test can be directly transferred to any infected person whose height is within a range of 2 cm from the height of the tested person. For example, if the cure is tested on a non-infected person of height $172.2$, then any infected person whose height is in the interval $[170.2 ; 174.2]$ is *covered* by the test. 

<div class="figure" style="text-align: center">
<img src="./img/tm4-test-persons.png" alt="Infected and test persons." width="500px" />
<p class="caption">(\#fig:test-persons)Infected and test persons.</p>
</div>

Figure \@ref(fig:test-persons) shows the data in worksheet *TM4_Virus*:

   * Cell D1 states the number of infected persons. Columns A and B provide the person’s ID and height for each person.
   * Cell D2 states the number of non-infected persons volunteering to be test persons. Columns F and G provide their ID and height. 
   * The testing process is extremely resource demanding, and thus it is only possible to test a limited number of test volunteers. This number is stated in cell D3.
   
Given a test person we make a function `TM4_TestCover` that takes person id as argument and return the number of new infected persons covered. A person is already covered, if that person has a 1 in the *Covered* column.

```
Function TM4_TestCover(intId As Integer) As Integer
   Dim intI As Integer     ' number of infected
   Dim intC As Integer     ' number of covered
   Dim dblHeight As Double ' height of test person
   Dim r As Integer
   
   intI = Range("D1")
   dblHeight = Range("G" & intId + 6)
   intC = 0
   For r = 7 To intI + 6    ' loop through all infected
      If Cells(r, 2) >= dblHeight - 2 And Cells(r, 2) <= dblHeight + 2 And Cells(r, 3) <> 1 Then
         intC = intC + 1
      End If
   Next
   TM4_TestCover = intC
End Function
```

First, note that given a test person id, the height is found in row `id + 6` and column G. Next, we use the counter `intC` to count new covered persons. This result is returned by the function.

To find the right test persons the following greedy strategy is used:

<div class="box">
**Step 1**:	Select the test person (not already selected) that can cover most new infected persons (not yet covered). If more than one test person have the same cover, select the one with the smallest ID. 

**Step 2**: Add ones to the *Covered* column for all infected persons covered by the test person.

**Step 3**: Go to Step 1 until found the test persons needed.
</div>

We implement the the greedy strategy:

```
Sub TM4_FindTestPersons()
   Dim intI As Integer  ' number of infected
   Dim intT As Integer  ' number of test volunteers
   Dim intS As Integer  ' number of selected persons
   Dim intC As Integer  ' number of covered
   Dim intBestId As Integer ' best id found
   Dim intBestC As Integer  ' best cover value found
   Dim r As Integer

   Worksheets("TM4_Virus").Activate
   intI = Range("D1")
   intT = Range("D2")
   intS = 0   ' no selected yet
   Do While intS < Range("D3")    ' stop when have found needed test persons
      intBestId = -1
      intBestC = -1
      For r = 7 To intT + 6       ' loop through all test volunteers
         If Cells(r, 8) <> 1 Then ' not selected already
            intC = TM4_TestCover(Cells(r, 6))
            If intBestC < intC Then ' found a better person
               intBestC = intC
               intBestId = Cells(r, 6)
            End If
         End If
      Next
      Cells(intBestId + 6, 8) = 1  ' select best
      For r = 7 To intI + 6  ' add ones in covered column
          If Abs(Cells(r, 2) - Cells(intBestId + 6, 7)) <= 2 Then
              Cells(r, 3) = 1
          End If
      Next
      intS = intS + 1
   Loop
End Sub
```

First, the number of persons are stored in variables. Next, a `Do While` loop is used to find the test persons. We use two variables to store the best id and cover value. The first inner for loop scan the test persons and for each person (not yet selected) we find the cover (using `TM4_TestCover`), check if better than current and update. The second inner for loop add ones to the *Covered* column. The output is given in Figure \@ref(fig:test-persons-res).

<div class="figure" style="text-align: center">
<img src="./img/tm4-test-persons-res.png" alt="Infected and test persons." width="500px" />
<p class="caption">(\#fig:test-persons-res)Infected and test persons.</p>
</div>

In total 13 infected persons are covered by 3 test persons.


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
   Sub SubName(arg1 As <datatype>, arg2 As <datatype>)
      <code>
   End Sub
   
   Function FunctionName(arg1 As <datatype>, arg2 As <datatype>) As <return datatype>
    <code>
    FunctionName = value  ' assign a return value to the function
   End Sub
  ```
- You can use `Exit Sub`/`Exit Function` to exit the sub/function early in the code.
- Procedures can be either public or private:
  - Public (default): Can be used from other modules, from other files and from Excel.
    ```
    Public Sub SubName()
    ...
    End Sub
    ```
  - Private: Can only be used from within its own module.
    ```
    Private Sub SubName()
    ...
    End Sub
    ```
- Use the `Call` keyword to call a sub:
  ```
  Call SubName(arg1, arg2)
  ```
- Call a function by assigning its return value to a variable
  ```
  result = FunctionName(arg1, arg2)
  ```
- There are two ways of passing arguments to procedures:
  ```
  Sub SubName(ByRef arg1 As <datatype>, ByVal arg2 As <datatype>)
    <code>
  End Sub
  ```
  - Argument `arg1` is passed **by reference** (default). That is, no new memory is allocated when the procedure is called and hence the procedure can have changed the value of `arg1` when the procedure stops. 
  - Since the default is `ByRef`, the result is the same if we omitted the keyword `ByRef`. 
  - Argument `arg2` is passed **by value**. That is, a copy of the variable is created in memory with local scope. Hence the procedure cannot change the value of `arg2` when the procedure stops (the local variables is deleted). 

  - Using `ByRef` is faster and saves memory since we do not have to allocate new memory. 
  - We may use `ByRef` to return updated values of the input arguments.
- Use the `Optional` keyword to indicate default input arguments:
  ```
  Sub SubName(arg1 As <datatype>, Optional arg2 As <datatype> = <defaultValue>)  
  ```
  You can now call the procedure using:
  ```
  Call SubName(arg1)  ' assume that arg2 = defaultValue
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
  

```{=html}
<div>
You may also have a look at the
<a href="https://bss-osca.github.io/tfa/slides/04_vba-procedures-slides.html" target="_blank">slides for this module</a>
.
</div>
```


## Exercises {#ex-vba-procedures}

Below you will find a set of exercises. Always have a look at the exercises before you meet in your study group and try to solve them yourself. Are you stuck, see the [help page](#help). Some of the solutions to each exercise can be seen by pressing the button at each question. Beware, you will not learn by giving up too early. Put some effort into finding a solution!


```{=html}
<div>
A template with VBA code for this module is given in the file
<a href="https://github.com/bss-osca/tfa/blob/master/vba/04-vba-procedures-template.xlsm" target="_blank">04-vba-procedures-template.xlsm</a>
(open it and use it while reading the notes). Have a look inside the module
<i>TM4_ex</i>
in the VBA editor for examples used in the notes and during lectures. Have a look at module
<i>TM4_exercises</i>
for exercises. The template file for next teaching module will contain guiding answers for the exercises to this teaching module.
</div>
```

### Exercise - Subs {#ex-vba-subs}

   (1) Create a sub `GetMsg` that takes a string and a Boolean as input and create a message box with the string content if the Boolean is true. Test the procedure using the `TestGetMsg` sub.
   (2) Modify the procedure so the Boolean have a default value equal to true.
   (3) Create a sub `PrintNameAge` that takes two arguments as input (name and age) and create a message box with the persons name and age.
   (4) Write a sub `TestPrintNameAge` that uses two input boxes to ask for name and age and then call sub `PrintNameAge`.


### Exercise - Temperatures

*This exercise is a slightly modified version an exam assignment (reexam 2022-A4).*

Temperatures in Fahrenheit can be converted to Celsius using $$C = \frac{5(F-32)}{9}$$ 
Similar temperatures in Celsius can be converted to Fahrenheit using $$F = \frac{9C}{5} + 32$$

   (1) Make functions:
       - `TM4_CelsiusToFahrenheit` that takes a double `dblVal` in Celsius as input argument and returns the number converted to Fahrenheit.
       - `TM4_FahrenheitToCelsius` that takes a double `dblVal` in Fahrenheit as input argument and returns the number converted to Celsius.
   (2) Make a function `TM4_ConvertTemp` with the following features:
       - Input arguments are a double `dblVal` and a string `strIUnit`.
       - If the input unit `strIUnit` equals "c" then the returned number is converted to Fahrenheit.
       - If the input unit `strIUnit` equals "f" then the returned number is converted to Celsius.
       - If the input unit `strIUnit` does not equals "f" or "c" then a message box is given with an error.
   (3) Test function `TM4_ConvertTemp` on worksheet *TM4* (row 66).


### Exercise - Functions {#ex-vba-functions}

   (1) Write a function `TM4_Discount` which takes a two input arguments (doubles): the discount percentage and the amount. The function returns the discounted value. For instance if the discount is 10 percent and amount 100 then the discounted value is $90 = 100\cdot(1-0.1)$. Have a look at the unfinished sub `TM4_Discount` for hints. Note the comments describing the function using the [coding convention](#coding-convention). Check the test results starting from row 47 in worksheet *TM4*.
   (2) Write a function `Larger` which takes two integer arguments and returns true if the first is larger than the last; otherwise false. Check the test results starting from row 53 in worksheet *TM4*.
   (3) Write a function `NumbDays` that takes a date as argument and return the number of days from today. Hint: Have a look at the [`DateDiff`](https://docs.microsoft.com/en-us/office/vba/language/reference/user-interface-help/datediff-function) function. Check the test results starting from row 59 in worksheet *TM4*.
   (4) Write a sub that uses an input box to ask for an amount a then returns the discounted amount when the discount is 20%. The sub should use the function in Question 1. Test it using the button in worksheet *TM4* (row 49).


### Exercise - Worksheet functions {#ex-vba-worksheet-functions}

The worksheet *TM4_Numbers* contains a button that runs a procedure which generate a set of numbers. Create a procedure `TM4_Summary` that uses worksheet functions to:

- Find the maximum number and write it to cell D1. 
- Find the minimum number and write it to cell D2. 
- Find the sum of the numbers and write it to cell D3. 
- Count the number of positives and write it to cell D4.
- Find the row number with maximum value and write it to cell D5. 

Google is a good place to start if you want to find a specific Excel function, e.g. try to search 'excel row with max value'. Test the procedure using the *Summary* button in worksheet *TM4_Numbers*.



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
