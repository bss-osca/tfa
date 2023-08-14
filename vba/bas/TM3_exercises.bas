Attribute VB_Name = "TM3_exercises"
'''' Exercises for Teaching Module 3

Option Explicit


'''' Exercise - Loops

'' Question 1
Sub TM3_LoopsQ1()
    Dim i As Integer
    
    Worksheets("TM3").Activate  ' activate the sheet we want to use
    For i = 1 To 4
        Cells(24 + i, 1) = i
    Next
End Sub


'' Question 2
Sub TM3_LoopsQ2()
    Dim i As Integer
    
    Worksheets("TM3").Activate  ' activate the sheet we want to use
    i = 1
    Do While i <= 4
        Cells(24 + i, 2) = i
        i = i + 1
    Loop
End Sub


'' Question 3
Sub TM3_LoopsQ3()
    Dim i As Integer
    
    Worksheets("TM3").Activate  ' activate the sheet we want to use
    For i = 1 To 4
        Cells(26 + i, 3) = i
    Next
End Sub


'' Question 4
Sub TM3_LoopsQ4()
    Dim i As Integer
    
    Worksheets("TM3").Activate  ' activate the sheet we want to use
    For i = 1 To 4
        Cells(24 + i, 4) = -i
    Next
End Sub


'' Question 5
Sub TM3_LoopsQ5()
    Dim i As Integer
    
    Worksheets("TM3").Activate  ' activate the sheet we want to use
    For i = 1 To 4
        If i <> 3 Then
            Cells(27 + i, 5) = i
        Else
            Cells(27 + i, 5) = "missing"
        End If
    Next
End Sub


'' Question 6
Sub TM3_LoopsQ6()
    Dim i As Integer
    
    Worksheets("TM3").Activate  ' activate the sheet we want to use
    i = 1
    Do While i < 10000      ' so no infinite loop
        Cells(24 + i, 6) = i
        If i / 5 + 3 = 8 Then Exit Do
        i = i + 1
    Loop
End Sub


'' Question 7
Sub TM3_LoopsQ7()
    Worksheets("TM3").Activate  ' activate the sheet we want to use
    Call TM3_LoopsQ1
    Call TM3_LoopsQ2
    Call TM3_LoopsQ3
    Call TM3_LoopsQ4
    Call TM3_LoopsQ5
    Call TM3_LoopsQ6
End Sub




'''' Exercise - Conditional statements

'' Question 1
Sub TM3_CondQ1()
   Dim r As Integer
   Dim c As Integer
   Dim rngC As Range
   
   Worksheets("TM3_Numbers").Activate
   ' Copy numbers
   For r = 1 To 35
     For c = 1 To 5
        Cells(r, c + 6) = Cells(r, c)
     Next
   Next
   ' Remove and format numbers
   For Each rngC In Range("G1:K35")
     If rngC < 0 Then rngC.Clear
     If rngC > 20 Then rngC.Interior.ColorIndex = 37
   Next
End Sub


'' Question 2
Sub TM3_CondQ2()
   Dim rngC As Range
   Dim dblM As Double ' mean
   Dim dblS As Double ' sum
   Dim dblCtr As Double ' counter
   
   Worksheets("TM3_Numbers").Activate
   For Each rngC In Range("A1:E35")
      If rngC > 0 Then dblS = dblS + rngC
      If rngC < 0 Then
          dblM = dblM + rngC
          dblCtr = dblCtr + 1
      End If
   Next
   dblM = dblM / dblCtr
   MsgBox ("Sum of non-negative numbers = " & dblS & ". Mean of negative numbers = " & dblM & ".")
End Sub


