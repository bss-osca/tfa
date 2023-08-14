Attribute VB_Name = "TM2_exercises"
'''' Exercises for Teaching Module 2

Option Explicit



'''' Exercise - Hello

'' Advanced say hello sub
Sub TM2_SayHelloAdv()
    Dim strName As String
    
    Worksheets("TM2").Activate
    strName = InputBox("What is your name?")
    Range("B11") = "Hello " & strName
End Sub




'''' Exercise - Record a macro

'' Change layout sub (cleaned code)
Sub TM2_ChangeLayout()
Attribute TM2_ChangeLayout.VB_ProcData.VB_Invoke_Func = " \n14"
    Selection.Interior.color = 15773696
    Selection.Font.Size = 14
End Sub




'''' Exercise - User input

'' Check the number and output the result in a messagebox
Sub TM2_CheckNumber()
    Dim intN As Integer
    
    Worksheets("TM2").Activate
    intN = InputBox("Type an integer")
    If intN > 10 Then
        MsgBox ("The number is above 10")
    Else
        MsgBox ("The number is at most 10")
    End If
    Range("B14") = intN
End Sub




'''' Exercise - Max and min number

'' Generate some random numbers (run to get some numbers)
' @return Integers in cells A1:A40.
Sub TM2_GenerateNumbers()
    Dim cell As Range
    
    Worksheets("TM2").Activate
    For Each cell In Range("A1:A40")
        cell.value = WorksheetFunction.RandBetween(-1000, 1000)
    Next cell
End Sub


'' Find the maximum number of cells A1:A40
' @return Number in cell D1.
Sub TM2_FindMax()
    Dim intM As Integer
    Dim r As Integer
    
    Worksheets("TM2_Numbers").Activate
    intM = 0
    For r = 1 To 40
        If Cells(r, 1) > intM Then
            intM = Cells(r, 1)
        End If
    Next
    Range("D1") = intM
End Sub


'' Find the minimum number of cells A1:A40
' @return Number in cell D2.
Sub TM2_FindMin()
    Dim intM As Integer
    Dim r As Integer
    
    Worksheets("TM2_Numbers").Activate
    intM = 1001
    For r = 1 To 40
        If Cells(r, 1) < intM Then
            intM = Cells(r, 1)
        End If
    Next
    Range("D2") = intM
End Sub


'' Find the range of cells A1:A40
' @return String in cell D3.
Sub TM2_FindRange()
    Dim intM1 As Integer
    Dim intM2 As Integer
    Dim r As Integer
    
    Worksheets("TM2_Numbers").Activate
    intM1 = 1001
    intM2 = 0
    For r = 1 To 40
        If Cells(r, 1) < intM1 Then
            intM1 = Cells(r, 1)
        End If
        If Cells(r, 1) > intM2 Then
            intM2 = Cells(r, 1)
        End If
    Next
    Range("D3") = "[" & intM1 & "," & intM2 & "]"
End Sub


'' Find the number of positives of cells A1:A40
' @return Number in cell D4.
Sub TM2_CountPositives()
    Dim intN As Integer
    Dim r As Integer
    
    Worksheets("TM2_Numbers").Activate
    intN = 0
    For r = 1 To 40
        If Cells(r, 1) > 0 Then
            intN = intN + 1
        End If
    Next
    Range("D4") = intN
End Sub


'' Find the row index with maximum number of cells A1:A40
' @return Number in cell D5.
Sub TM2_RowMax()
    Dim intM As Integer
    Dim intN As Integer
    Dim r As Integer
    
    Worksheets("TM2_Numbers").Activate
    intM = 0
    For r = 1 To 40
        If Cells(r, 1) > intM Then
            intM = Cells(r, 1)
            intN = r
        End If
    Next
    Range("D5") = intN
End Sub


'' Find the row index with minimum number of cells A1:A40
' @return Number in cell D6.
Sub TM2_RowMin()
    Dim intM As Integer
    Dim intN As Integer
    Dim r As Integer
    
    Worksheets("TM2_Numbers").Activate
    intM = 1001
    For r = 1 To 40
        If Cells(r, 1) < intM Then
            intM = Cells(r, 1)
            intN = r
        End If
    Next
    Range("D6") = intN
End Sub


'' Run all procedures
Sub TM2_RunAll()
    Call TM2_GenerateNumbers
    Call TM2_FindMax
    Call TM2_FindMin
    Call TM2_FindRange
    Call TM2_CountPositives
    Call TM2_RowMax
    Call TM2_RowMin
End Sub


