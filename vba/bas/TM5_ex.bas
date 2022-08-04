Attribute VB_Name = "TM5_ex"
'' Examples for Teaching Module 5

Option Explicit


'' Concatenate two strings
Sub TM5_StrConcat()
    Dim strX As String
    Dim strY As String
    Dim strRes As String
    
    strX = "VBA"
    strY = "Strings"
    strRes = strX & " " & strY
    MsgBox (strRes)
    MsgBox (strX & vbCr & strY)   ' use vbCr to insert a new line
End Sub


'' String functions
Sub TM5_StrFunc()
    Dim str As String
    
    str = "VBA Strings"
    MsgBox ("The length is: " & Len(str))
    MsgBox ("In lowercase: " & LCase(str))
    MsgBox ("Last 7 char: " & Right(str, 7))
    MsgBox ("Replace: " & Replace(str, "Strings", "Rules"))
    MsgBox ("Compare: " & StrComp(str, "VBA Strings"))  ' result is 0 (equal)
    MsgBox ("Compare: " & StrComp(str, "Apple"))        ' result is 1 (str alfabetically after)
    MsgBox ("Compare: " & StrComp(str, "Wait"))         ' result is -1 (str alfabetically before)
    MsgBox ("String is starting at char number: " & InStr(str, "String"))  ' result is 0 if not found
End Sub




'''' Worksheet examples

'' Worksheet object examples
Sub TM5_TestWorksheet()
   ThisWorkbook.Activate  ' activate this workbook
   Worksheets("TM5_Test1").Range("B2") = "Testing Worksheet"  ' write to cell in sheet TM5_Test1
   Sheet_TM5_Test1.Range("B3") = "Use the sheets code name"   ' use the code name (also work if sheet renamed)
   'ThisWorkbook.Worksheets("Test3").Range("B5") = "Test"     ' Error since there is no sheet Test3 in this workbook
   Range("B4") = "Do you know which sheet is active?"         ' Active sheet
   ' Good coding pratice is always to specify the full path (as above) or make the sheet under considration active
   Worksheets("TM5_Test1").Activate  ' Make sheet active so know where is
   Range("B5") = "I know which sheet is active!"
End Sub


'' Worksheet - Variable usage
Sub TM5_TestWorksheetVar()
  Dim wst1 As Worksheet  ' define a variable which hold a reference to a Worksheet object
  Dim wst2 As Worksheet  ' define a variable which hold a reference to a Worksheet object
  
  Set wst1 = ThisWorkbook.Worksheets("TM5_Test1")  ' set the reference
  Set wst2 = ThisWorkbook.Worksheets("TM5_Test2")  ' set the reference
  wst1.Range("B6") = "Writing using wst1"
  wst2.Range("B2") = "Writing using wst2"
  wst2.Activate   ' just to have a look
End Sub


'' Test the worksheet functions
Sub TM5_TestWorksheetFunc()
    If WstCreate("Test", blnForce:=True) Then MsgBox ("Created Test")  ' create Test sheet
    If WstRename("Test", "Test1") Then MsgBox ("Renamed the Test to Test1")  ' only work if no Test1 sheet
    If WstClear("Test8") Then MsgBox ("Cleared Test8") ' no clearing since on sheet with that name
    If WstDelete("Test1") Then MsgBox ("Deleted Test1")
End Sub




'''' Ranges examples

'' Testing range
Sub TM5_RangeEx1()
   Dim rng As Range
   Dim cell As Range
   Dim i As Integer
   
   Call TM5_ClearTestTM5    ' clear test cells so have empty cells
   ThisWorkbook.Worksheets("TM5").Activate
   ' Modify a range to a fixed value
   Set rng = Range("G4:I6")
   rng = 145   ' cell value in rng
   MsgBox rng.Address   ' range address
   ' Use for each to scan range (direction left-down)
   Set rng = Range("G8:I10")
   i = 1
   For Each cell In rng
      cell = "Entry " & i
      i = i + 1
   Next
   ' Use Cells to set a range
   Set rng = Range(Cells(23, 3), Cells(25, 6))
   MsgBox rng.Address
End Sub


'' Testing range
Sub TM5_RangeEx2()
  Dim rng As Range
  
  Set rng = ThisWorkbook.Worksheets("TM5").Range("C4:E19")
  MsgBox ("Number of rows: " & RngGetRows(rng))
  MsgBox ("Number of cols: " & RngGetCols(rng))
  MsgBox ("First column number: " & RngGetFirstCol(rng))
  MsgBox ("First column letter: " & RngGetFirstCol(rng, asLetter:=True))
  MsgBox ("Lower right cell: " & RngGetLowerRight(rng, asString:=True))
  MsgBox ("Upper right cell: " & RngGetUpperRight(rng, asString:=True))
End Sub


'' Find size of a region (smallest range surrounded by empty boxes)
'  For instance usefull when don't know the size of a table
Sub TM5_CurrentRegionEx1()
    Dim rng As Range

    ThisWorkbook.Worksheets("TM5").Activate
    ' Try to guess the output
    Set rng = RngCurRegion(Range("D7"))  ' rng now is the current region
    MsgBox ("Address: " & RngGetAddress(rng))
    MsgBox ("Rows = " & RngGetRows(rng) & " cols = " & RngGetCols(rng))
    MsgBox ("First row number = " & RngGetFirstRow(rng) & ". Last row number = " & RngGetLastRow(rng) & ".")
    MsgBox ("First col number = " & RngGetFirstCol(rng) & ". Last col number = " & RngGetLastCol(rng) & ".")
    MsgBox ("First col letter = " & RngGetFirstCol(rng, True) & ". Last col letter = " & RngGetLastCol(rng, True) & ".")
    
    Set rng = RngCurRegion(Range("C23"))  ' assume we know that data contains cell C23
    MsgBox ("Address: " & RngGetAddress(rng))
End Sub


'' Same result as in TM5_CurrentRegionEx1 using RngGetCurRegion functions
Sub TM5_CurrentRegionEx2()
    Dim rng As Range

    ThisWorkbook.Worksheets("TM5").Activate
    ' Try to guess the output
    Set rng = Range("D7")  ' assume we know that data contains cell D7
    MsgBox ("Address: " & RngGetCurRegionAddress(rng))
    MsgBox ("Rows = " & RngGetCurRegionRows(rng) & " cols = " & RngGetCurRegionCols(rng))
    MsgBox ("First row number = " & RngGetCurRegionFirstRow(rng) & ". Last row number = " & RngGetCurRegionLastRow(rng) & ".")
    MsgBox ("First col number = " & RngGetCurRegionFirstCol(rng) & ". Last col number = " & RngGetCurRegionLastCol(rng) & ".")
    MsgBox ("First col letter = " & RngGetCurRegionFirstCol(rng, True) & ". Last col letter = " & RngGetCurRegionLastCol(rng, True) & ".")
    
    Set rng = Range("C23")  ' assume we know that data contains cell C23
    MsgBox ("Address: " & RngGetCurRegionAddress(rng))
End Sub


'' Copy, format and clear range
Sub TM5_RangeEx3()
    Dim rng As Range
    Dim rngNew As Range
    
    Set rng = RngCurRegion(Range("D7"))         ' get current region
    MsgBox ("Copy to H14 (upper left corner).")
    Set rngNew = RngPaste(rng, Range("H14"))    ' rngNew is now the new range
    MsgBox ("Make yellow.")
    Call RngFormat(rngNew, "yellow")
    MsgBox ("Remove format.")
    Call RngClear(rngNew, blnCells:=False, blnFormat:=True)
    MsgBox ("Clear range.")
    Call RngClear(rngNew)
End Sub


' Test reading from csv files
Sub TM5_RngFromCSVEx()
    Dim rng As Range
    
    ThisWorkbook.Worksheets("TM5").Activate
    Call TM5_ClearTestTM5    ' clear test cells so have empty cells
    '' Read data1.csv file (NOTE you must know the separator in the csv file beforehand!)
    Range("G3") = "Content of data1.csv:"
    Set rng = RngFromCSV("data1.csv", Range("G4"), ";") ' paste file in range with upper left cell G4
    MsgBox (RngGetAddress(rng))
    '' Read data2.csv file (NOTE you must know the separator in the csv file beforehand!)
    Range("G8") = "Content of data2.csv:"
    Set rng = RngFromCSV("data2.csv", Range("G9"), ",") ' paste file in range with upper left cell G9
    MsgBox (RngGetAddress(rng))
End Sub


' Test writing to csv file
Sub TM5_RngToCSVEx()
    Dim rng As Range
    
    ThisWorkbook.Worksheets("TM5").Activate
    Call TM5_ClearTestTM5    ' clear test cells so have empty cells
    '' Write to csv file
    Set rng = Range("C4:E19")
    Call RngToCSV("test.csv", rng, ";")     ' semicolon (;) separated file
    '' Read test.csv file to check
    Range("G3") = "Content of test.csv:"
    Set rng = RngFromCSV("test.csv", Range("G4"), ";")
End Sub


'' Sorting a range
Sub TM5_SortRangeEx()
    Dim rng As Range
    Dim rngCur As Range
    
    ThisWorkbook.Worksheets("TM5").Activate
    Call TM5_ClearTestTM5    ' clear test cells so have empty cells
    Set rng = RngCurRegion(Range("C4"))
   
    '' Sort based on second column ascending
    Set rngCur = RngPaste(rng, Range("G4"), withFormat:=True)  ' make a copy to work with
    Call rngCur.Sort(Key1:=rngCur.Columns(2), Header:=xlYes)
    rngCur(1).Offset(-1, 0) = "Sort 2. column"  ' offset first cell in range by -1 row and 0 col

    '' Sort based on second column and afterwards 3. column (descending)
    Set rngCur = RngPaste(rng, Range("K4"), True)
    Call rngCur.Sort(Key1:=rngCur.Columns(2), Header:=xlYes, Key2:=rngCur.Columns(3), Order2:=xlDescending)
    rngCur(1).Offset(-1, 0) = "Sort 2. and next 3. column"
End Sub




'''' Array examples

'' Define an array (run using the debugger - step into)
' How to check the content of an array?
' Use the Locals window together with debug mode or a message box
Sub TM5_ArrayEx1()
   Dim intAry(4) As Integer      ' define array of integers with index 0-4
   Dim strAry(3 To 5) As String  ' define array of strings with index 3-5
   Dim i As Integer
   
   ' Set values
   intAry(0) = 9
   intAry(1) = 12
   intAry(2) = 222
   intAry(3) = 4
   intAry(4) = 100
   ' Information about the array
   MsgBox ("Lowest index: " & LBound(intAry))
   MsgBox ("Largest index: " & UBound(intAry))
   MsgBox ("Number of elements   : " & UBound(intAry) - LBound(intAry) + 1)
   MsgBox ("Array as a string: " & AryToStr(intAry))
   ' Read and assign values
    For i = 3 To 5
        strAry(i) = ThisWorkbook.Worksheets("TM5").Cells(23 + i, 3)
    Next
    MsgBox ("Array values: " & AryToStr(strAry))
End Sub


'' Define a multidimensional array and output it to sheet
Sub TM5_MultiDimArrayEx()
    Dim intA(20, 10) As Integer
    Dim i As Integer, j As Integer
    
    ThisWorkbook.Worksheets("TM5").Activate
    Call TM5_ClearTestTM5    ' clear test cells so have empty cells
    ' Assign some values
    For i = LBound(intA, 1) To UBound(intA, 1)
        For j = LBound(intA, 2) To UBound(intA, 2)
            intA(i, j) = WorksheetFunction.RandBetween(1, 1000)
        Next
    Next
    ' print results from G4
    For i = LBound(intA, 1) To UBound(intA, 1)
        For j = LBound(intA, 2) To UBound(intA, 2)
            Cells(i + 4, j + 7) = intA(i, j)
        Next
    Next
    ' Call AryPaste(intA, Range("G4")) ' same result
End Sub


'' Dynamic arrays
Sub TM5_DynArrayEx()
    Dim ary() As String   ' dynamic array, note use empty ()
    Dim i As Integer
    
    ThisWorkbook.Worksheets("TM5_Test3").Activate
    ReDim ary(2 To 5)  ' create entries a(2) to a(5)
    For i = 2 To 5
        ary(i) = Cells(i + 1, 1)   ' read from Array sheet
    Next
    MsgBox ("Values are: " & AryToStr(ary))
    MsgBox ("The lowest and higest index are " & LBound(ary) & " and " & UBound(ary))
    
    ReDim ary(3 To 5)  ' reallocate array, all values are set to default (empty string)
    MsgBox ("Values are: " & AryToStr(ary))
    For i = 3 To 5
        ary(i) = Cells(i + 1, 1)
    Next
    MsgBox ("Values are: " & AryToStr(ary))
    MsgBox ("The lowest and higest index are " & LBound(ary) & " and " & UBound(ary))
End Sub


'' Input and output (arrays)
Sub TM5_IOAryEx()
    Dim ary() As Integer
    Dim strAry() As String
    
    ThisWorkbook.Worksheets("TM5").Activate
    Call TM5_ClearTestTM5
    '' Set to value single value
    ReDim ary(2)
    Call AryToVal(ary, 5)
    Range("G4") = "A fixed value:"
    Call AryPaste(ary, Range("G5")) ' the upper left cell is G5
    '' Paste vertical
    Range("K4") = "Paste vertical:"
    Call AryPaste(ary, Range("K5"), False)
    '' Set to sequence
    Call AryToSeq(ary, 1, 6)
    Range("G10") = "A sequence:"
    Call AryPaste(ary, Range("G11"))
    '' Read strings from a range
    Call AryRead(strAry, Range("C31:D33"))  ' read a 2D array
    Range("G31") = "Names in the " & AryDim(strAry) & "D array:"
    Call AryPaste(strAry, Range("G32"))
End Sub


'' AryRead examples
Sub TM5_AryReadEx()
    Dim ary() As Integer

    ThisWorkbook.Worksheets("TM5").Activate
    Call TM5_ClearTestTM5
    '' Read values from a range with only 1 column
    Call AryRead(ary, Range("C5:C9"))
    Range("G4") = AryDim(ary) & "D array:"
    Call AryPaste(ary, Range("G5"), False)
    '' Read values from a range with only 1 row
    Call AryRead(ary, Range("C5:E5"))
    Range("I4") = AryDim(ary) & "D array:"
    Call AryPaste(ary, Range("I5"))
    '' Read values from a range with only 1 column/row but use 2D array
    Call AryRead(ary, Range("C11:C14"), blnReduceDim:=False)
    Range("G10") = AryDim(ary) & "D array:"
    Call AryPaste(ary, Range("G11"), False)
    '' Use other start and end index
    Call AryRead(ary, Range("C17:E19"), intStartIdx1:=2, intStartIdx2:=5)
    Range("G16") = AryDim(ary) & "D array with start index " & LBound(ary, 1) & " and " & LBound(ary, 2) & ":"
    Call AryPaste(ary, Range("G17"))
End Sub


'' AryReadLong examples
Sub TM5_AryReadLongEx()
    Dim ary() As Integer
    
    ThisWorkbook.Worksheets("TM5").Activate
    Call TM5_ClearTestTM5
    '' Read 1D array
    Call AryReadLong(ary, Range("A36:B38"), 3)   ' default value = 3
    Range("G35") = "Values in the " & AryDim(ary) & "D array:"
    Call AryPaste(ary, Range("G36"))
    '' Read 2D array
    Call AryReadLong(ary, Range("A41:C47"), 4)   ' default value = 4
    Range("G40") = "Values in the " & AryDim(ary) & "D array:"
    Call AryPaste(ary, Range("G41"))
    '' Read 3D array (cannot be pasted to the sheet, have a look at it using the debugger)
    Call AryReadLong(ary, Range("A50:D56"), 5)   ' default value = 5
End Sub


'' Read array from csv
Sub TM5_AryReadCSVEx()
    Dim rng As Range
    Dim ary() As Integer
    
    ThisWorkbook.Worksheets("TM5").Activate
    Call TM5_ClearTestTM5
    '' Read csv file (NOTE you must know the separator in the csv file beforehand!)
    Range("G3") = "Array values:"
    Call AryFromCSV(ary, "data2.csv", ",")   ' know that it contains integers (otherwise use variant)
    Call AryPaste(ary, Range("G4"))
End Sub


Sub TM5_ArySortEx()
    Dim ary() As Integer
    
    ThisWorkbook.Worksheets("TM5").Activate
    Call TM5_ClearTestTM5
    
    '' Read from a range and sort
    Call AryRead(ary, Range("C5:E19"))
    Call AryQuickSort(ary, 1)
    Range("G3") = "Sort w.r.t. 1. column:"
    Call RngPaste(Range("C4:E4"), Range("G4"))
    Call AryPaste(ary, Range("G5"))
End Sub



'' Alternative (and faster) way to store a distance matrix is using an array
Sub TM5_MakeDistArray()
    Dim N As Integer
    Dim aryDist() As Double
    Dim i As Integer
    Dim j As Integer
    
    ThisWorkbook.Worksheets("TM3_DistanceMatrix").Activate
    N = Range("E1")
    ReDim aryDist(1 To N, 1 To N)
    For i = 1 To N
        For j = i + 1 To N
           aryDist(i, j) = TM3_Distance(Cells(i + 1, 2), Cells(i + 1, 3), Cells(j + 1, 2), Cells(j + 1, 3))
           aryDist(j, i) = aryDist(i, j)  ' set symetric value
        Next
    Next
End Sub




'''' Collection examples

'' Collection without keys examples.
Sub TM5_ColEx()
    Dim col As New Collection   ' declare and create
    Dim e As Variant
    
    ThisWorkbook.Worksheets("TM5").Activate
    Call TM5_ClearTestTM5
    '' Add items
    Call col.Add("Apple")
    Call col.Add("Pear")
    Call col.Add(123)
    Cells(4, 7) = "The collection now contains " & col.Count & " items: " & Col2Str(col)
    '' Use For Each to scan elements
    For Each e In col
      MsgBox (e)
    Next e
    '' Access values in the collection using index
    Cells(5, 7) = "The 1. item is: " & col(1)
    Cells(6, 7) = "The 3. item is: " & col(3)
    ' Remove items
    Call col.Remove(2)
    Cells(7, 7) = "The collection now contains " & col.Count & " items: " & Col2Str(col)
    '' Note index of items has now changed (the 3. item has become the 2. item)
    Cells(8, 7) = "The 1. item is: " & col(1)
    Cells(9, 7) = "The 2. item is: " & col(2)
    '' Clear collection
    Set col = Nothing
    Cells(10, 7) = "The collection now contains " & col.Count & " items."
End Sub


'' Collection with key examples.
Sub TM5_ColKeyEx()
    Dim col As New Collection   ' declare and create
    Dim k As Variant
    
    ThisWorkbook.Worksheets("TM5").Activate
    '' Add using keys
    Call col.Add("Hans J¿rgensen", "ID123")   ' value, key
    Call col.Add("Jens Hansen", "ID234")
    Call col.Add("Lone Nielsen", "ID456")
    ' Call col.Add("Sine Mikkelsen", "ID456") ' gives an error since already used the key
    Cells(12, 7) = "The collection now contains " & col.Count & " items: " & Col2Str(col)
    '' Access values using keys
    Cells(13, 7) = "The item with key ID123 is: " & col("ID123")
    ' Remove items using keys
    Call col.Remove("ID123")
    Cells(14, 7) = "The collection now contains " & col.Count & " items: " & Col2Str(col)
End Sub




'''' Example - Job sequencing


'' Job sequeceing using a cost array
'
' @param costs An array with setup costs
' @param strSeq The job sequence found (returned ByRef).
' @param dblCosts The total setup costs (returned ByRef).
Sub TM5_GreedyAlg(costs() As Double, strSeq As String, dblCosts As Double)
    Dim intJobs As Integer          ' number of jobs
    Dim used() As Integer           ' an entry equals 1 if already scheduled
    Dim intCurJob As Integer        ' current job
    Dim intNextJob As Integer       ' best candidate for next job (= intM if not found yet)
    Dim dblNextCost As Double       ' setup cost current to next job
    Dim c As Integer                ' iterators
    Dim intM As Integer             ' big number

    '' Allocate arrays
    intJobs = UBound(costs, 1)
    ReDim used(1 To intJobs)    ' set size
    Call AryToVal(used, 0)      ' set to 0
    
    '' Run greedy
    strSeq = "0"  ' start idle
    intM = 1000   ' a number bigger than largest cost
    intCurJob = 0  ' start idle
    dblCosts = 0
    Do While True ' find next job given current
        intNextJob = intM
        dblNextCost = intM
        For c = 1 To intJobs ' scan row in array to find next unused job with minimal cost
            If used(c) <> 1 And costs(intCurJob, c) < dblNextCost Then
                intNextJob = c
                dblNextCost = costs(intCurJob, c)
            End If
        Next
        If intNextJob = intM Then Exit Do  ' no new job found (all jobs used)
        dblCosts = dblCosts + dblNextCost
        used(intNextJob) = 1
        intCurJob = intNextJob
        strSeq = strSeq & ", " & intNextJob
    Loop
End Sub


'' Copy a dataset to cell A4
Sub TM5_CopyData()
   Dim str As String
   
   ThisWorkbook.Worksheets("TM5_JobSeq").Activate   ' so use the correct sheet
   str = InputBox("Specify cell in data (e.g. N7)") ' get a cell value
   Call TM5_CleanJobSeq                             ' delete previous data
   Call RngPaste(RngCurRegion(Range(str)), Range("A4"), withFormat:=True) ' paste the current region
End Sub


'' Cleanup solution
Sub TM5_CleanJobSeq()
    Range("C1") = ""
    Range("C2") = ""
    Range("F1") = ""
    Call RngClear(Range("A4:I30"))
End Sub


'' Job sequeceing using a greedy algorithm
Sub TM5_RunGreedy()
    Dim costs() As Double  ' setup costs
    Dim strSeq As String   ' job seq
    Dim dblCosts As Double ' total setup costs
    Dim rng As Range

    ThisWorkbook.Worksheets("TM5_JobSeq").Activate
    ' Allocate costs to array
    Set rng = RngCurRegion(Range("A4")) ' rng now is the whole dataset with headers
    Set rng = Range("B5:" & RngGetLastCol(rng, asLetter:=True) & RngGetLastRow(rng)) ' rng now is the costs
    Call AryRead(costs, rng, 0, 1) ' start index from 0 (first dim) and 1 (second dim)
    ' Run algorithm
    Call TM5_GreedyAlg(costs, strSeq, dblCosts)
    
    ' Write results to sheet
    Range("C1") = UBound(costs, 1)
    Range("C2") = strSeq
    Range("F1") = dblCosts
End Sub


'' Find a better sequence of jobs.
Sub TM5_RunBetter()
    Dim minCol() As Double ' min value in col c
    Dim intJobs As Integer ' number of jobs
    Dim costs() As Double  ' setup costs
    Dim strSeq As String   ' job seq
    Dim dblCosts As Double ' total setup costs
    Dim rng As Range
    Dim dbl As Double
    Dim r As Integer, c As Integer
    
    ThisWorkbook.Worksheets("TM5_JobSeq").Activate
    ' Allocate costs to array
    Set rng = RngCurRegion(Range("A4")) ' rng now is the whole dataset with headers
    Set rng = Range("B5:" & RngGetLastCol(rng, asLetter:=True) & RngGetLastRow(rng)) ' rng now is the costs
    Call AryRead(costs, rng, 0, 1) ' start index from 0 (first dim) and 1 (second dim)
    ' Calc min value in each col
    intJobs = UBound(costs, 1)
    ReDim minCol(1 To intJobs)
    For c = 1 To intJobs
        dbl = 10000000   ' a big number
        For r = 0 To intJobs
            If costs(r, c) < dbl And r <> c Then dbl = costs(r, c)
        Next
        minCol(c) = dbl
    Next
    ' Calc relative
    For c = 1 To intJobs
        For r = 0 To intJobs
            costs(r, c) = costs(r, c) - minCol(c)
        Next
    Next
    ' Run algorithm
    Call TM5_GreedyAlg(costs, strSeq, dblCosts)
    ' Write results to sheet
    Range("C1") = intJobs
    Range("C2") = strSeq
    Range("F1") = dblCosts + WorksheetFunction.Sum(minCol)
End Sub










'' Procedures used to clear tests

Sub TM5_ClearTest1()
   Call WstClear("TM5_Test1")
End Sub

Sub TM5_ClearTest2()
   Call WstClear("TM5_Test2")
End Sub

Sub TM5_ClearTestTM5()
   Call RngClear(ThisWorkbook.Worksheets("TM5").Range("F:S"))
End Sub
