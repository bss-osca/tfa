Attribute VB_Name = "TM4_ex"
'' Examples for Teaching Module 4

Option Explicit


Sub TM4_SimpleSub(str As String)
   MsgBox (str)
End Sub


Function TM4_SimpleFunc(dblA As Double, dblB As Double) As Integer
   TM4_SimpleFunc = dblA + dblB  ' return variable equals function name
End Function


' Try running it using the debugger (Ctrl + F8 (win) or cmd + shift + I (mac))
Sub TM4_CallSimpleProc()
   Dim dblV As Double
   
   MsgBox ("Ready")
   Call TM4_SimpleSub("SimpleSub")  ' call a sub within a procedure
   dblV = TM4_SimpleFunc(3, 4)      ' call a function within a procedure
   MsgBox ("Value is " & intV)
End Sub


'' Product of two numbers
' @param i First number.
' @param j Second number.
' @return The product i * j.
' @remarks The numbers are doubles.
Function TM4_ProductFunc(i As Double, j As Double) As Double
    TM4_ProductFunc = i * j
End Function


'' Product of two numbers which are stored in dblV (since ByRef is the default).
' @param i First number.
' @param j Second number.
' @param dblV Stores the product.
' @remarks The numbers are doubles.
Sub TM4_ProductSub(i As Double, j As Double, dblV As Double)
    dblV = i * j
End Sub


'' Use ProductSub or ProductFunc (they produce the same result in different ways)
' Try running it using the debugger (Ctrl + F8 (win) or cmd + shift + I (mac))
Sub TM4_RunProductSub()
    Dim dblV As Double
    
    dblV = 4
    MsgBox ("Current value is " & dblV)  ' Current value is 4
    Call TM4_ProductSub(7, 3, dblV)      ' dblV = TM4_ProductFunc(7, 3) (same result)
    MsgBox ("Current value is " & dblV)  ' Current value is 21
End Sub

' Your turn: which of the 3 previous procedures can be called from a button and a cell?


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
Sub TM4_TestingFormatCell()
    Dim rng As Range
    
    Worksheets("TM4").Activate
    Call FormatCell(Range("A16"))  ' use default values
    Call FormatCell(Range("B16"), 46)       ' use background color index 46
    Call FormatCell(Range("C16"), , 21)      ' set font color
    Call FormatCell(rng:=Range("D16"), intFontSize:=16, intFontColor:=23)   ' call sub using argument names explicit
End Sub


'' Run using F5
Sub TM4_SeeColorIndex()
   Dim R As Integer
   Dim c As Integer
   Dim i As Integer
   
   Worksheets("TM4").Activate
   i = 1
   For R = 18 To 40
      For c = 2 To 5
         Cells(R, c) = i
         Call TM4_FormatCell(rng:=Cells(R, c), intInteriorColor:=i, intFontColor:=1 + i Mod 4)
         If i = 56 Then
            Exit Sub
         End If
         i = i + 1
      Next
   Next
End Sub


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
    Dim N As Integer
    Dim i As Integer
    
    i = 5
    MsgBox ("In the start i is " & i)
    N = TM4_ByVal(i)
    MsgBox ("Try gussing the values of n and i")
    MsgBox ("After TM4_ByVal i is " & i & " and " & N & " is returned.")
    N = TM4_ByRef(i)
    MsgBox ("Try gussing the values of n and i")
    MsgBox ("After TM4_ByRef i is " & i & " and " & N & " is returned.")
End Sub


'' Test worksheetfunctions
' You can always get help by putting the crusor in the function name and press F1
Sub TM4_TestWorksheetfunctions()
   Dim R As Integer
   Dim c As Integer
   
   Worksheets("TM4").Activate
   MsgBox ("Numbers above 80: " & WorksheetFunction.CountIf(Range("B33:E38"), ">80")) ' count numbers above
   MsgBox ("Sumproduct: " & WorksheetFunction.SumProduct(Range("B33:E33"), Range("B34:E34")))
   MsgBox ("Max: " & WorksheetFunction.Max(Range("B33:E38")))
   
   For R = 40 To 45
      For c = 2 To 4
         Cells(R, c) = WorksheetFunction.RandBetween(0, 9)
      Next
   Next
End Sub


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


'''' Example - Selection of test persons

'' Find cover of test person
Function TM4_TestCover(intId As Integer) As Integer
   Dim intI As Integer     ' number of infected
   Dim intC As Integer     ' number of covered
   Dim dblHeight As Double ' height of test person
   Dim R As Integer
   
   intI = Range("D1")
   dblHeight = Range("G" & intId + 6)
   intC = 0
   For R = 7 To intI + 6    ' loop through all infected
      If Cells(R, 2) >= dblHeight - 2 And Cells(R, 2) <= dblHeight + 2 And Cells(R, 3) <> 1 Then
         intC = intC + 1
      End If
   Next
   TM4_TestCover = intC
End Function


'' Find set of test persons that gives the best cover using a greedy algorithm
Sub TM4_FindTestPersons()
   Dim intI As Integer  ' number of infected
   Dim intT As Integer  ' number of test volunteers
   Dim intS As Integer  ' number of selected persons
   Dim intC As Integer  ' number of covered
   Dim intBestId As Integer ' best id found
   Dim intBestC As Integer  ' best cover value found
   Dim R As Integer

   Worksheets("TM4_Virus").Activate
   intI = Range("D1")
   intT = Range("D2")
   intS = 0   ' no selected yet
   Do While intS < Range("D3")    ' stop when have found needed test persons
      intBestId = -1
      intBestC = -1
      For R = 7 To intT + 6       ' loop through all test volunteers
         If Cells(R, 8) <> 1 Then ' not selected already
            intC = TM4_TestCover(Cells(R, 6))
            If intBestC < intC Then ' found a better person
               intBestC = intC
               intBestId = Cells(R, 6)
            End If
         End If
      Next
      Cells(intBestId + 6, 8) = 1  ' select best
      For R = 7 To intI + 6  ' add ones in covered column
          If Abs(Cells(R, 2) - Cells(intBestId + 6, 7)) <= 2 Then
              Cells(R, 3) = 1
          End If
      Next
      intS = intS + 1
   Loop
End Sub











'' Procedures used cleaning etc (you should not understand this code)

Sub TM4_ClearSheetTM4()
    Call RngClear(Worksheets("TM4").Range("A16:D16"), False, False, True)
    Call RngClear(Worksheets("TM4").Range("B18:E31"))
    Call RngClear(Worksheets("TM4").Range("B40:D45"))
End Sub

Sub TM4_ClearSheetTM4Virus()
    Call RngClear(Worksheets("TM4_Virus").Range("C7:C36"), False, True)
    Call RngClear(Worksheets("TM4_Virus").Range("H7:H16"), False, True)
End Sub
