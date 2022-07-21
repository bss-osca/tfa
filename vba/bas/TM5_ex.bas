Attribute VB_Name = "TM5_ex"
Option Explicit


'''' Worksheet examples

'' Worksheet object examples
Sub TM5_TestWorksheet()
   ThisWorkbook.Activate  ' activate this workbook
   Worksheets("TM5_Test1").Range("B2") = "Testing Worksheet"  ' write to cell in sheet TM5_Test1
   Sheet_TM5_Test1.Range("B3") = "Use the sheets code name"   ' use the code name (also work if sheet renamed)
   'ThisWorkbook.Worksheets("Test3").Range("B5") = "Test"     ' Error since there is no sheet Test3 in this workbook
   Range("B4") = "Do you know which sheet is active?"         ' Active sheet
   ' Good coding pratice is always to specify the full path or make the sheet under considration active
   Worksheets("TM5_Test1").Activate  ' Make sheet active so know where is
   Range("B5") = "I know which sheet is active!"
End Sub


'' Worksheet - Variable usage
Sub TM5_TestWorksheetVar()
  Dim wst1 As Worksheet  ' define a variable which hold a reference to a Worksheet object
  Dim wst2 As Worksheet  ' define a variable which hold a reference to a Worksheet object
  Dim rng As Range
  
  Set wst1 = ThisWorkbook.Worksheets("TM5_Test1")  ' set the reference
  Set wst2 = ThisWorkbook.Worksheets("TM5_Test2")  ' set the reference
  wst1.Range("B6") = "Writing using wst1"
  wst2.Range("B2") = "Writing using wst2"
  wst1.Activate   ' just to have a look
End Sub


'' Test the worksheet functions
Sub TM5_TestWorksheetFunc()
    If WstCreate("Test", blnForce:=True) Then MsgBox ("Created Test")
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
   MsgBox rng.Address   ' range address ($A$1:$D$5)
   ' Use for each to scan range (direction left-down)
   Set rng = Range("G8:I10")
   i = 0
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
   Dim intAry(4) As Integer      ' define array with index 0-4
   Dim strAry(3 To 5) As String  ' define array with index 3-5
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



'' Define an array
Sub DynArray()
    Dim a() As String   ' dynamic array
    Dim i As Integer
    
    ReDim a(2 To 5)  ' create entries a(2) to a(5)
    For i = 2 To 5
        a(i) = Worksheets("Array").Cells(i + 1, 1)   ' read from Array sheet
    Next
    MsgBox (Join(a, ","))
    MsgBox ("The lowest and higest index are " & LBound(a) & " and " & UBound(a))
    
    ReDim a(3 To 5)
    For i = 3 To 5
        a(i) = Worksheets("Array").Cells(i + 1, 1)
    Next
    MsgBox (Join(a, ","))
    MsgBox ("The lowest and higest index are " & LBound(a) & " and " & UBound(a))
End Sub







'''' Collection examples










'' Testing speed with and without setting properties
Sub TestSpeed()
    Dim timer As Double
    Dim i As Integer
    
    timer = StartTimer()
    For i = 1 To 10000
        Worksheets("Test4").Cells(i, 15) = i * 2
    Next
    MsgBox ("Without optimizing speed " & TimeElapsed(timer, "ms") & " miliseconds")
    
    Call ApplicationSpeedOptimize
    timer = StartTimer()
    For i = 1 To 10000
        Worksheets("Test4").Cells(i, 15) = i * 2
    Next
    Call ApplicationRestoreAfterSpeedOptimize
    Worksheets("Test4").Activate
    MsgBox ("Optimizing speed " & TimeElapsed(timer, "ms") & " miliseconds")
    
    Range("O:O").Clear
End Sub










'' Procedures used to clear tests

Sub TM5_ClearTest1()
   Call WstClear("TM5_Test1")
End Sub

Sub TM5_ClearTest2()
   Call WstClear("TM5_Test2")
End Sub

Sub TM5_ClearTestTM5()
   Call RngClear(ThisWorkbook.Worksheets("TM5").Range("G:S"))
End Sub
