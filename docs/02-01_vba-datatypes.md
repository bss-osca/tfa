---
output: html_document
editor_options: 
  chunk_output_type: console
---


# (PART) Programming in VBA {-}

# Data types and variables {#mod-vba-datatypes}

This module gives a short introduction to variables and data types. In general syllabus will point to chapters in @vba-book; however, there is a lot for videos about VBA online such as courses [30 for 30 Excel VBA Absolute Beginner Course][vba-yt-course1] and [14-Hour VBA Course][vba-yt-course2]. You may have a look at these videos instead if you prefer a different learning style. In the learning path diagram, links to alternative online content will be pointed out. Note this is alternatives to the standard learning path that you may use instead. The learning path may also have extra content that is not a part of syllabus you can have a look at.

__Learning path diagram__

Click/hover the nodes to follow links and see details.


```{=html}
<div id="htmlwidget-87dc7088084899c634fb" style="width:100%;height:400px;" class="grViz html-widget"></div>
<script type="application/json" data-for="htmlwidget-87dc7088084899c634fb">{"x":{"diagram":"digraph {\n\ngraph [layout = \"neato\",\n       outputorder = \"edgesfirst\",\n       bgcolor = \"white\"]\n\nnode [fontname = \"Helvetica\",\n      fontsize = \"10\",\n      shape = \"circle\",\n      fixedsize = \"true\",\n      width = \"0.5\",\n      style = \"filled\",\n      fillcolor = \"aliceblue\",\n      color = \"gray70\",\n      fontcolor = \"gray50\"]\n\nedge [fontname = \"Helvetica\",\n     fontsize = \"8\",\n     len = \"1.5\",\n     color = \"gray80\",\n     arrowsize = \"0.5\"]\n\n  \"1\" [label = \"📖 Data types and variables\", URL = \"#vba-datatypes\", tooltip = \"Data types and variables\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", width = \"0.5\", fillcolor = \"DarkSeaGreen4\", pos = \"2,1!\"] \n  \"2\" [label = \"📖 How do I structure my code?\", URL = \"#vba-code-structure\", tooltip = \"How do I structure my code?\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", width = \"0.5\", fillcolor = \"DarkSeaGreen4\", pos = \"5,1!\"] \n  \"3\" [label = \"💻 Exercises\", URL = \"#ex-vba-datatypes\", tooltip = \"Exercises\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"egg\", margin = \"0.2\", width = \"0.5\", fillcolor = \"DarkSeaGreen4\", pos = \"8,1!\"] \n  \"4\" [label = \"🎬 Variables\", URL = \"https://youtu.be/BXjFDiH6R8E\", tooltip = \"Variables\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", width = \"0.5\", fillcolor = \"DarkOrange4\", pos = \"3,2!\"] \n  \"5\" [label = \"🎬 Scope of variables\", URL = \"https://youtu.be/SpnWO6GOvrY\", tooltip = \"Scope of variables\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", width = \"0.5\", fillcolor = \"DarkOrange4\", pos = \"3,3!\"] \n  \"6\" [label = \"🎬 Arrays\", URL = \"https://youtu.be/ELFrOYNTxEU\", tooltip = \"Arrays\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", width = \"0.5\", fillcolor = \"DarkOrange4\", pos = \"1,2!\"] \n  \"7\" [label = \"🎬 Loop over an array\", URL = \"https://youtu.be/EOMX1nXZEb4\", tooltip = \"Loop over an array\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", width = \"0.5\", fillcolor = \"DarkOrange4\", pos = \"1,3!\"] \n  \"8\" [label = \"🎬 Dynamic arrays\", URL = \"https://youtu.be/AqYDI2Vt1mw\", tooltip = \"Dynamic arrays\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", width = \"0.5\", fillcolor = \"DarkOrange4\", pos = \"1,4!\"] \n  \"9\" [label = \"📖 Scope of variables\", URL = \"http://www.cpearson.com/excel/scope.aspx\", tooltip = \"Scope of variables\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", width = \"0.5\", fillcolor = \"PeachPuff3\", pos = \"3,0!\"] \n  \"10\" [label = \"📖 Collections\", URL = \"http://excelmacromastery.com/excel-vba-collections/\", tooltip = \"Collections\", style = \"filled\", fixedsize = \"FALSE\", fontsize = \"11\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica-bold\", shape = \"rect\", margin = \"0.2\", width = \"0.5\", fillcolor = \"PeachPuff3\", pos = \"1,0!\"] \n  \"11\" [label = \"\", URL = \"\", tooltip = \" \", style = \"filled\", fixedsize = \"true\", fontsize = \"9\", fontcolor = \"white\", penwidth = \"0.5\", fontname = \"Helvetica\", shape = \"rect\", height = \"1\", width = \"6\", fillcolor = \"#F0F8FF\", pos = \"5.9,4.16!\"] \n  \"12\" [label = \"Color:\", URL = \"\", tooltip = \" \", style = \"filled\", fixedsize = \"true\", fontsize = \"9\", fontcolor = \"black\", penwidth = \"0\", fontname = \"Helvetica\", shape = \"none\", height = \"0\", width = \"0.8\", fillcolor = \"#FFFFFE\", pos = \"3.27,4.5!\"] \n  \"13\" [label = \"mandatory\", URL = \"\", tooltip = \"Mandatory syllabus.\", style = \"filled\", fixedsize = \"true\", fontsize = \"9\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica\", shape = \"rect\", width = \"0.8\", fillcolor = \"DarkSeaGreen4\", pos = \"3.5,4.1!\"] \n  \"14\" [label = \"alternative\", URL = \"\", tooltip = \"Alternative syllabus if you prefer another learning style.\", style = \"filled\", fixedsize = \"true\", fontsize = \"9\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica\", shape = \"rect\", width = \"0.8\", fillcolor = \"DarkOrange4\", pos = \"4.5,4.1!\"] \n  \"15\" [label = \"extra\", URL = \"\", tooltip = \"Extra learning if you are interested (not part of syllabus).\", style = \"filled\", fixedsize = \"true\", fontsize = \"9\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica\", shape = \"rect\", width = \"0.8\", fillcolor = \"PeachPuff3\", pos = \"5.5,4.1!\"] \n  \"16\" [label = \"Shape:\", URL = \"\", tooltip = \" \", style = \"filled\", fixedsize = \"true\", fontsize = \"9\", fontcolor = \"black\", penwidth = \"0\", fontname = \"Helvetica\", shape = \"none\", height = \"0\", width = \"1\", fillcolor = \"#FFFFFE\", pos = \"6.7,4.5!\"] \n  \"17\" [label = \"non-interactive\", URL = \"\", tooltip = \"Non-interactive learning content (e.g. reading).\", style = \"filled\", fixedsize = \"true\", fontsize = \"9\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica\", shape = \"rect\", width = \"1\", fillcolor = \"Grey40\", pos = \"7,4.1!\"] \n  \"18\" [label = \"interactive\", URL = \"\", tooltip = \"Interactive learning content (tutorial, exercises etc.).\", style = \"filled\", fixedsize = \"true\", fontsize = \"9\", fontcolor = \"white\", penwidth = \"2\", fontname = \"Helvetica\", shape = \"egg\", width = \"1\", fillcolor = \"Grey40\", pos = \"8.25,4.1!\"] \n\"1\"->\"2\" [color = \"black\", arrowhead = \"vee\"] \n\"1\"->\"4\" [color = \"black\", arrowhead = \"vee\"] \n\"1\"->\"6\" [color = \"black\", arrowhead = \"vee\"] \n\"1\"->\"9\" [color = \"black\", arrowhead = \"vee\"] \n\"1\"->\"10\" [color = \"black\", arrowhead = \"vee\"] \n\"2\"->\"3\" [color = \"black\", arrowhead = \"vee\"] \n\"4\"->\"5\" [color = \"black\", arrowhead = \"vee\"] \n\"6\"->\"7\" [color = \"black\", arrowhead = \"vee\"] \n\"7\"->\"8\" [color = \"black\", arrowhead = \"vee\"] \n}","config":{"engine":"dot","options":null}},"evals":[],"jsHooks":[]}</script>
```

## Learning outcomes {#lo-vba-datatypes}

By the end of this module, you are expected to be able to:

* Describe what a variable is.
* Name different datatypes and how they effect memory size.
* Declare a variable as a datatype.
* Describe that scope for a variable means.
* Declare an array variable with both fixed and dynamic dimension.
* Assign values to variables.
* Formulate well-structured code.

The learning outcomes relate to the [overall learning goals](#lg-course) number 1, 2, 4, 8 and 9 of the course.

<!-- SOLO increasing: identify · memorise · name · do simple procedure · collect data · -->
<!-- enumerate · describe · interpret · formulate · list · paraphrase · combine · do -->
<!-- algorithms · compare · contrast · explain causes · analyse · relate · derive · -->
<!-- evaluate · apply · argue · theorise · generalise · hypothesise · solve · reflect -->


## Datatypes {#vba-datatypes}

Variables are used to store information in a program that is saved in memory. A variable may store different datatypes such as an integer, a double, a string or an object (e.g. a range).

Read Chapter 4 in @vba-book. You may also have a look at the alternative and extra videos instead as listed in the learning path diagram.

### Collections

A useful datatype not mentioned in Chapter 4 is a collection. Collections are a way of storing a group of items together (think of it as a set). Collections and arrays are both used to group variables. They both store a set of items e.g. a list of student marks or country names. If we compare collections against arrays:

- Collections are similar to arrays but better to use when the number of items is not fixed. With an array you normally set the size once. On the contrary you often add or remove items from a collection.
- Collections are better when adding and removing items.
- An item in a collection are read-only whereas an entry in an array are read/write.
- Collection can be accessed using a key or an index (starting from 1).
- Items of a collection do not have to share the same data type.

Collections are a part of the [Object Model](#mod-vba-object-model) and hence a collection have to be defined in a special way. Let us consider an [example](https://github.com/bss-osca/tfa/blob/master/vba/vba-collection-examples.xlsm). First we declare and create a collection:
```
Dim col As New Collection
```
The collection (or set) is now defined with zero items. You can add items using
```
col.Add "Apple"
col.Add "Pear"
col.Add 123
```
Let us create a function that prints the items of a collection as string:
```
Function Coll2Str(col As Collection) As String
    Dim e As Variant
    Dim str As String
    
    For Each e In col
        str = str & e & ", "
    Next e
    str = Left(str, Len(str) - 1)
    Coll2Str = str
End Function
```
Then the output of 
```
Debug.Print "The collection now contains " & col.Count & " items: " & Coll2Str(col)
```
in the Immediate window becomes
```
The collection now contains 3 items: Apple, Pear, 123
```
You can access values in the collection using index:
```
Debug.Print "The 1. item is: " & col(1)
Debug.Print "The 3. item is: " & col(3)
```
```
The 1. item is: Apple
The 3. item is: 123
```
Items are removed using:
```
col.Remove (2)
Debug.Print "The collection now contains " & col.Count & " items: " & Coll2Str(col)
```

```
The collection now contains 2 items: Apple, 123
```

Note index of items has now changed (the 3. item has become the 2. item):
```
Debug.Print "The 1. item is: " & col(1)
Debug.Print "The 2. item is: " & col(2)
```

```
The 1. item is: Apple
The 2. item is: 123
```

You clear a collection using:
```
Set col = Nothing
Debug.Print "The collection now contains " & col.Count & " items."
```

```
The collection now contains 0 items.
```

An item in a collection can be given a key:
```
col.Add "Hans Jørgensen", "ID123"   ' value, key
col.Add "Jens Hansen", "ID234"
col.Add "Lone Nielsen", "ID456"
' col.Add "Sine Mikkelsen", "ID456" ' gives an error since already used the key
Debug.Print "The collection now contains " & col.Count & " items: " & Coll2Str(col)
```

```
The collection now contains 3 items: Hans Jørgensen, Jens Hansen, Lone Nielsen
```
You can now access the item using the key:
```
Debug.Print "The item with key ID123 is: " & col("ID123")
```

```
The item with key ID123 is: Hans Jørgensen
```
Similar you can remove an item using a key:
```
 col.Remove "ID123"
 Debug.Print "The collection now contains " & col.Count & " items: " & Coll2Str(col)
```

```
The collection now contains 2 items: Jens Hansen, Lone Nielsen
```

It is recommended to use keys since using keys has three advantages:

- If the order changes your code will still access the correct item
- You can directly access the item without reading through the entire collection
- It can make you code more readable

For more information about collections you may have a look at this [webpage](http://excelmacromastery.com/excel-vba-collections/).


## How do I structure my code? {#vba-code-structure}

When you program it is always a good idea to structure your code. The main reason for using a consistent set of coding conventions is to standardize the structure and coding style of an application so that you and others can easily read and understand the code. Good coding conventions result in precise, readable, and unambiguous source code that is consistent with other language conventions and as intuitive as possible. 

Have a look at the [guidelines given here](#coding-convention).


## Recap

- Variables are used to store information in a program. The information is saved in memory. A variable may store different datatypes such as an integer, a double, a string or an object (e.g. a range).
- A selected set of datatypes are (see all in the [documentation](https://docs.microsoft.com/en-us/office/vba/language/reference/user-interface-help/data-type-summary)):

   Name    | Type      | Details                                                                        
   ------- | --------- | -------------------------------------------------------------------------------
   Byte    | Numerical | Whole number between 0 and 255.                                                
   Integer | Numerical | Whole number between -32'768 and 32'767.                                       
   Long    | Numerical | Whole number between - 2'147'483'648 and 2'147'483'647.                        
   Double  | Numerical | Floating decimal number between -1.79769313486232E308 and 1.79769313486232E308.
   String  | Text      | Text.                                                                          
   Date    | Date      | Date and time.                                                                 
   Boolean | Boolean   | True or False.                                                                 
   Variant | Any type  | Any kind of data (default type if the variable is not declared). 

- Memory consists of bits (binary digit) where a bit can take the value 0 or 1. 
- Common naming of memory chunks are 8 Bits = 1 Byte, 1024 Bytes = 1 Kilobyte, 1024 Kilobytes = 1 Megabyte, 1024 Megabytes = 1 Gigabyte, 1024 Gigabytes = 1 Terabyte.
- Variables take up different storage place in memory based on the datatype they use. The size of selected datatypes:

   Data type                                 | Storage size            
   ----------------------------------------- | ------------------------
   Byte                                      | 1 byte                  
   Boolean                                   | 2 bytes                 
   Integer                                   | 2 bytes                 
   Long  (long integer)                      | 4 bytes                 
   Double  (double-precision floating-point) | 8 bytes                 
   Date                                      | 8 bytes                 
   String                                    | 10 bytes + string length
   Variant  (with numbers)                   | 16 bytes                
   Variant  (with characters)                | 22 bytes + string length

   Arrays require 20 bytes of memory plus 4 bytes for each array dimension plus the number of bytes occupied by the data itself. A Variant containing an array requires 12 bytes more than the array alone.

- Variables must be declared by

  ```
  Dim {variable name} As {data type}
  ```

  Example:
  ```
  Dim intC As Integer		
  intC = 2
  Dim dblCost As Double		
  dblCost = 2.45
  Dim rng As Range			
  Set rng = Range(“A3”)
  ```

  Note the `Set` keyword for setting object variables.

- Declare varibles to optimize memory usage, avoid errors and speed up code (instead of storing in a sheet).
- Use `Option Explicit` in the top of every module so the VBA editor will tell you if you forget to declare variables.
- Variable scope:
   - Global variables are known to the whole module or the whole file
   - Declare global variables in the top of the file.
   - In general try to avoid global variables!
   - Local variables are local to a procedure and only known within that procedure.
   - Declare local variables inside the procedure.
- Strings are special variables with varying length.
- Use the `&` to concatenate strings (glue strings together).
- An empty string is of length zero.
- An array store groups of variables of a specific datatype. For example
  ```
  Dim intValues(8) As Integer
  ```
  The variable `intValues` is an array with 9 elements which can be accessed using index 0, 1, 2, ..., 8. 
- The default start index of an array is 0. If you want to start with index 1 then add `Option Base 1` to the top of your module.
- An array can have different dimensions, e.g.
  ```
  Dim intOrderSize(52, 100, 50) As Integer  
  ```
  where indices may be (week, customer, product) number. Let us assume that index start from 1 then we have an array with $52 \cdot 100 \cdot 50$ elements which can be accessed using e.g.

  ```
  intOrderSize(2,10, 20)  ' order size week 2, customer 10, product 20 
  ```
- Dynamic arrays are arrays where the dimension is unknown when they are declared. Use `ReDim` to set the dimension later:
 
   ```
   Dim strPeople() As String
   ...
   n = 8
   ReDim strPeople(n)
   ```

You may also have a look at the [slides for this module](https://bss-osca.github.io/tfa/slides/02-01_vba-datatypes-slides.html).

## Exercises {#ex-vba-datatypes}

Below you will find a set of exercises. Always have a look at the exercises before you meet in your study group and try to solve them yourself. Are you stuck, see the [help page](#help). Some of the solutions to each exercise can be seen by pressing the button at each question. Beware, you will not learn by giving up too early. Put some effort into finding a solution!

### Exercise - Product search {#ex-vba-search-products}

The [file](https://github.com/bss-osca/tfa/blob/master/vba/vba-search-products-template.xlsm) contains a sheet _Products_ with a set of products with product code and price. Cell D1 contains the total number of products. 

   (1) Create a sub `FindProduct` that 
       * Declare two arrays to store the price and product code.
       * Uses `ReDim` to set the size of the arrays.
       * Use a for loop to assign values to the arrays.
       * Use an input box to ask for a product code.
       * Use a for loop to search for the product and output the price in a message box.
   (2) Test you code using different product codes
   (3) Add a button to the Main sheet that run the procedure.
   (4) What happens if you write the product code without capital letters? If your code do not work, have a look at the [`UCase`](https://docs.microsoft.com/en-us/office/vba/language/reference/user-interface-help/ucase-function) function.
   (5) Modify your code so that if the product is not found then "Product not found!" is given in a message box. Hint: the [`Exit sub`](https://docs.microsoft.com/en-us/office/vba/language/reference/user-interface-help/exit-statement) may be useful inside the last for loop.
       

### Exercise - Read arrays {#ex-vba-read-arrays}

The [file](https://github.com/bss-osca/tfa/blob/master/vba/vba-read-arrays-template.xlsm) contains different sheets with numbers to be read into an array. 

   (1) The sheet _1D Array_ contains an index number `i` (column A) and value `v` (column B) also known as a long format. Create an array `ary1D` (with index starting from 0) that store the values `v` in array entry `ary1D(i)`. Assume that the default array value is 10. Hint you need a for loop to iterate though the numbers. Have a look at the unfinished sub `Read1DAry` for further hints.
   (2) The sheet _2D Array_ contains an array in matrix format where a cell in row `r` and column `c` contains the value to be stored in the array entry `ary2D(r, c)`. Create the array and store the values. Note `ary2D` start indexing from 1 and not 0. Have a look at the unfinished sub `Read2DAry` for further hints.
   (3) Modify sub `Read2DAry` so that indexing start from 0 instead of 1, i.e. a cell in row `r` and column `c` contains the value to be stored in the array entry `ary2D(r - 1, c - 1)`.
   (4) The sheet _4D Array_ contains values to be stored in a long format (column A:D indices and column E values). Create an array `ary4D` (with index starting from 0) that store the values. Assume that the default value is 5. Have a look at the unfinished sub `Read4DAry` for further hints.
   
   
### Exercise - Read collections {#ex-vba-read-collections}

The [file](https://github.com/bss-osca/tfa/blob/master/vba/vba-read-collections-template.xlsm) contains different sheets with numbers to be read into a collection.

Sheet _Data no keys_ contains some numbers. Create a procedure `CollNoKeys` that:

   (1) Create a collection `col` and add all the numbers.
   (2) Print the collection in a message box (you may use the function `Coll2Str` here).
   (3) Create another collection and add all the items in `col` with value below 5.

Sheet _Data with keys_ contains some ID numbers and prices for a set of products. Create a procedure `CollKeys` that:

   (1) Create a collection `col` and add all the prices using ID as key.
   (2) Print the price of the product with ID92011 in a message box.
   (3) What happens if you try to print the price of ID92?
   
   

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
