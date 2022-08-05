Attribute VB_Name = "TM3_ex"
'' Examples for Teaching Module 3

Option Explicit


'' Comparison of two variables
' Try to guess the result before running the code.
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


'' Examples using And, Or, Not and Xor (exactly one expression evaluates to true)
' Try to guess the result before running the code.
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


'' Simple for loop
Sub TM3_Loop1()
    Dim i As Integer
    
    For i = 1 To 3
        MsgBox (i) ' What will the output be?
    Next
End Sub


'' Using Step in a loop
Sub TM3_Loop2()
    Dim i As Integer
    
    For i = 2 To 9 Step 2
        If i <> 4 Then
            MsgBox (i) ' What will the output be?
        End If
    Next
End Sub


'' Write the row number in column A and exit after row 10 even though the loop runs to 20
Sub TM3_WriteNumbers1()
   Dim R As Integer
   
   Worksheets("TM3").Activate  ' activate the sheet we want to use
   For R = 6 To 20
      If R > 10 Then
         Exit For
      End If
      Cells(R, 1) = R  ' write to row r, col 1 (A)
   Next
End Sub


'' Nested loops
Sub TM3_NestedLoops()
    Dim i As Integer
    Dim j As Integer
    
    For i = 1 To 2
        For j = 1 To 3
            MsgBox ("(" & i & "," & j & ")")
        Next
    Next
End Sub


'' Write the row number in column B and exit after row 10
Sub TM3_WriteNumbers2()
    Dim R As Integer
    
    Worksheets("TM3").Activate
    R = 6
    Do While R < 11
        Cells(R, 2) = R ' write to row r, col 2 (B)
        R = R + 1
    Loop
End Sub


'' Write the 2, 4, ... in column C and exit after 21 or if equals 12
Sub TM3_WriteNumbers3()
    Dim i As Integer, R As Integer
    
    Worksheets("TM3").Activate
    R = 6
    i = 2
    Do While i < 21
        Cells(R, 3) = i ' write to row r, col 3 (C)
        If i = 12 Then
            Exit Do
        End If
        R = R + 1
        i = i + 2
    Loop
End Sub


' Don't run if you don't know how to stop
Sub TM3_EndlessLoop()
    Dim i As Integer
    While i >= 0
        i = i + 1
    Wend
End Sub


'' For Each loop
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


'' Seperate persons into two groups (names are written in 2 columns)
Sub TM3_SeparatePersons1()
    Dim R As Integer
    
    Worksheets("TM3_Separate1").Activate ' activate the correct sheet
    For R = 2 To 12 ' scan rows 2-12
        If Cells(R, 2) = "Professor" Then
            Cells(R, 3) = Cells(R, 1) ' output in row C
        Else
            Cells(R, 4) = Cells(R, 1) ' output in row D
        End If
    Next
End Sub


'' Seperate persons into 3 groups (names are written in 3 columns)
Sub TM3_SeparatePersons2()
    Dim R As Integer
    
    Worksheets("TM3_Separate2").Activate ' activate the correct sheet
    For R = 2 To 12
        If Cells(R, 2) = "Professor" Then
            Cells(R, 3) = Cells(R, 1) ' output in row C
        ElseIf Cells(R, 2) = "Associate Professor" Then
            Cells(R, 4) = Cells(R, 1) ' output in row D
        Else
            Cells(R, 5) = Cells(R, 1) ' output in row E
        End If
    Next
End Sub


'' Seperate persons into 5 groups (names are written in 5 columns)
Sub TM3_SeparatePersons3()
    Dim R As Integer
    
    Worksheets("TM3_Separate3").Activate ' activate the correct sheet
    For R = 2 To 12
        If Cells(R, 2) = "Professor" Then
            Cells(R, 3) = Cells(R, 1)
        ElseIf Sheet1.Cells(R, 2) = "Associate Professor" Then
            Cells(R, 4) = Cells(R, 1)
        ElseIf Sheet1.Cells(R, 2) = "Post Doc" Then
            Cells(R, 5) = Cells(R, 1)
        ElseIf Sheet1.Cells(R, 2) = "PhD student" Then
            Cells(R, 6) = Cells(R, 1)
        Else
            Cells(R, 7) = Cells(R, 1)
        End If
    Next
End Sub


''' Example - Find Jen

'' Find cell with Jen using a For loop
Sub TM3_FindJen1()
    Dim R As Integer
    
    Worksheets("TM3_Separate1").Activate ' activate the correct sheet
    For R = 2 To 12
        If InStr(Cells(R, 1), "Jen ") > 0 Then  ' InStr returns first char position at which match is found (0 if no match)
            MsgBox "Jen is a " & Cells(R, 2) & " (Row " & R & ")"
            Exit For   ' exit the loop
        End If
    Next
End Sub


'' Find cell with Jen using a While loop
Sub TM3_FindJen2()
    Dim R As Integer
    
    R = 2
    Do While InStr(Cells(R, 1), "Jen ") = 0
        R = R + 1
    Loop
    MsgBox "Jen is a " & Cells(R, 2) & " (Row " & R & ")"
End Sub


'' Find cell with Jen using a While loop and better stopping criteria
Sub TM3_FindJen3()
    Dim R As Integer
    
    R = 2
    Do While InStr(Cells(R, 1), "Jen ") = 0 And R < 13
        R = R + 1
    Loop
    If (R = 13) Then
        MsgBox ("Jen not found")
    Else
        MsgBox "Jen is a " & Cells(R, 2) & " (Cell A" & R & ")"
    End If
End Sub


''' Example - Distance matrix

'' Calculate distance between two points
'
' @param x1 x-coordinate of first point.
' @param y1 y-coordinate of first point.
' @param x2 x-coordinate of second point.
' @param y2 y-coordinate of second point.
Function TM3_Distance(x1, y1, x2, y2) As Double
    Dim x As Double
    Dim y As Double
    
    x = x1 - x2
    y = y1 - y2
    TM3_Distance = Sqr((x * x) + (y * y))
End Function


'' Create a distance matrix starting in column 6
'
' @pre Assume that coordinates are stored in column B and C starting from row 2
'      and that number of points are stored in E1.
Sub TM3_MakeDistanceMatrix()
    Dim N As Integer
    Dim i As Integer
    Dim j As Integer
      
    ThisWorkbook.Worksheets("TM3_DistanceMatrix").Activate
    N = Range("E1")
    For i = 1 To N  ' add row and column numbers
        Cells(i + 1, 6) = Cells(1 + i, 1) ' row equals i+1
        Cells(1, 6 + i) = Cells(1 + i, 1) ' column equals i+6
    Next
    
    ' add distances
    For i = 1 To N
        For j = 1 To N
           Cells(i + 1, j + 6) = TM3_Distance(Cells(i + 1, 2), Cells(i + 1, 3), Cells(j + 1, 2), Cells(j + 1, 3))
        Next
    Next
End Sub


'' Create a symetric distance matrix with only the upper right part filled starting in column 6.
'
' @pre Assume that coordinates are stored in column B and C starting from row 2
'      and that number of points are stored in E1.
Public Sub TM3_MakeSymetricDistanceMatrix()
    Dim N As Integer
    Dim i As Integer
    Dim j As Integer
      
    ThisWorkbook.Worksheets("TM3_DistanceMatrix").Activate
    N = Range("E1")
    For i = 1 To N
        Cells(i + 1, 6) = Cells(1 + i, 1)
        Cells(1, 6 + i) = Cells(1 + i, 1)
    Next
    
    For i = 1 To N
        For j = i + 1 To N
           Cells(i + 1, j + 6) = TM3_Distance(Cells(i + 1, 2), Cells(i + 1, 3), Cells(j + 1, 2), Cells(j + 1, 3))
        Next
    Next
End Sub






















'' Procedures used cleaning etc (you should not understand this code)

Sub TM3_ClearCells()
    Call RngClear(Worksheets("TM3").Range("A6:G100"))
End Sub

Sub TM3_ClearPersons1()
    Call RngClear(Worksheets("TM3_Separate1").Range("C2:I30"))
End Sub

Sub TM3_ClearPersons2()
    Call RngClear(Worksheets("TM3_Separate2").Range("C2:I30"))
End Sub

Sub TM3_ClearPersons3()
    Call RngClear(Worksheets("TM3_Separate3").Range("C2:I30"))
End Sub

Sub TM3_ClearDist()
    Call RngClear(Worksheets("TM3_DistanceMatrix").Range("F1:P11"), blnCells:=False, blnContents:=True)
End Sub

Sub TM3_ClearNumbers()
   Call RngClear(Worksheets("TM3_Numbers").Range("G:M"))
End Sub


