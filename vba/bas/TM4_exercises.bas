Attribute VB_Name = "TM4_exercises"
'''' Exercises for Teaching Module 4

Option Explicit



'''' Exercise - Subs

'' Output str in a message box if bln is true
'
' @param str String to output.
' @param bln Only output to message box if true (default is true).
Sub TM4_GetMsg(str As String, Optional bln As Boolean = True)
    If bln = True Then
        MsgBox str
    End If
End Sub


'' Testing above sub
Public Sub TM4_TestGetMsg()
    Call TM4_GetMsg("Output this")  '  same as Call TM4_GetMsg("Output this", True)
    Call TM4_GetMsg("Output this", False)
End Sub


'' Print name and age to a message box
Sub TM4_PrintNameAge(strName As String, intAge As Integer)
    MsgBox ("Your name and age is " & strName & " and " & intAge)
End Sub


'' Testing above sub
Sub TM4_TestPrintNameAge()
    Dim strName As String
    Dim intAge As Integer
    
    strName = InputBox("What is your name?")
    intAge = InputBox("What is you age?")
    Call TM4_PrintNameAge(strName, intAge)
End Sub




'''' Exercise - Temperatures

'' Convert temperature to fahrenheit
' @param dblVal Temperature to be converted.
' @return The converted temperature.
Function TM4_CelsiusToFahrenheit(dblVal As Double) As Double
    TM4_CelsiusToFahrenheit = 9 * dblVal / 5 + 32
End Function


'' Convert temperature to celsius
' @param dblVal Temperature to be converted.
' @return The converted temperature.
Function TM4_FahrenheitToCelsius(dblVal As Double) As Double
    TM4_FahrenheitToCelsius = 5 * (dblVal - 32) / 9
End Function


'' Convert temperature
' @param dblVal Temperature to be converted.
' @param strIUnit Unit of the temperature to be converted (c or f).
' @return The converted temperature.
Function TM4_ConvertTemp(dblVal As Double, strIUnit As String)
    If strIUnit = "c" Then
        TM4_ConvertTemp = TM4_CelsiusToFahrenheit(dblVal)
    ElseIf strIUnit = "f" Then
        TM4_ConvertTemp = TM4_FahrenheitToCelsius(dblVal)
    Else
        MsgBox ("Error: unit must equal c or f!")
    End If
End Function




'''' Exercise - Functions

'' Calculate the discounted amount.
' @param dblDiscount The discount in percent given (e.g. 0.2 - 20%)
' @param dblAmount The amount to apply the discount on.
' @return The discounted amount, i.e. multiply the amount with (1 - dblDiscount).
Function TM4_Discount(dblDiscount As Double, dblAmount As Double) As Double
    TM4_Discount = dblAmount * (1 - dblDiscount)
End Function


'' Is the first argument largest?
'
' @param intA First argument.
' @param intA Second argument.
'
' @return True if the first argument is largest.
Public Function TM4_Larger(intA As Integer, intB As Integer) As Boolean
    If intA > intB Then
        TM4_Larger = True
    Else
        TM4_Larger = False
    End If
End Function


'' Number of days from today.
'
' @param dtm The date.
'
' @return The mumber of days from today
Public Function TM4_NumbDays(dtm As Date) As Integer
    TM4_NumbDays = DateDiff("d", Date, dtm)
End Function


'' Discounted amount given input
Sub TM4_GetDiscount()
    Dim dbl As Double
    
    dbl = InputBox("What is the amount?")
    MsgBox ("The discounted amount is " & TM4_Discount(0.2, dbl))
End Sub




'''' Exercise - Worksheet functions

Sub TM4_Summary()
    Dim rng As Range
    
    Set rng = Range("A1:A40")
    Range("D1") = WorksheetFunction.Max(rng)
    Range("D2") = WorksheetFunction.Min(rng)
    Range("D3") = WorksheetFunction.Sum(rng)
    Range("D4") = WorksheetFunction.CountIf(rng, ">=0")
    Range("D5") = WorksheetFunction.Match(Range("D1"), rng, 0)
End Sub

