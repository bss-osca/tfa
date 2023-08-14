Attribute VB_Name = "TM2_ex"
'''' Examples for Teaching Module 2

Option Explicit  ' you have to declare your variables


'' Add a scatter plot
Sub TM2_Plot()
    Worksheets("TM2").Activate
    Range("D8:E12").Select
    ActiveSheet.Shapes.AddChart2(240, xlXYScatterSmooth).Select
    ActiveChart.SetSourceData Source:=Range("'TM2'!$D$8:$E$12")
    ActiveChart.ChartTitle.Text = "A line"
End Sub


'' Your turn: macro recorder
' Record a macro that set the background color of cells D15:E17 to green, center the text and the font size to 16
' Clean the macro and paste it into this sub
Sub TM2_MacroRecorder()
    Range("D15:E17").Select
    Selection.Style = "Good"
    With Selection.Font
        .Size = 16
    End With
    With Selection
        .HorizontalAlignment = xlCenter
    End With
End Sub


'' Declare some variables (run it using F5)
Sub TM2_DeclareVariables()
    Dim intPersons As Integer
    Dim dblAmount As Double
    Dim strText As String
    
    intPersons = 10
    dblAmount = 27.4
    strText = "Number of persons are "
    
    MsgBox (strText & intPersons & " which own " & dblAmount & "$")
End Sub


'' A function joining two strings
Function TM2_StringJoin(strF As String, strL As String) As String
    Dim strJ As String
    strJ = strF & " " & strL
    TM2_StringJoin = strJ
    
    '' Your turn: change the function to having 3 input arguments
End Function


'' Call an Excel function (run it using F5)
Sub TM2_ExcelFunction()
    MsgBox ("The sum of cells D9:D12 are " & WorksheetFunction.Sum(Worksheets("TM2").Range("D9:D12")))
End Sub


'' Call VBA functions (run it using F5)
Sub TM2_VBAFunction()
    MsgBox ("The current date is " & Date)
    MsgBox ("Jen is found at char number: " & InStr("Hi Jen how are you", "Jen"))
End Sub


'' Two dialog boxes (run it using F5)
Sub TM2_Dialog()
    Dim strName As String

    strName = InputBox("Type your name:")
    MsgBox "Your name is " & strName
End Sub


'' Read and write to sheet (run it using F5)
Sub TM2_ReadWriteSheet()
    Dim str1 As String
    Dim str2 As String
    Dim int1 As Integer
    
    Worksheets("TM2").Activate
    ' Input values from sheet
    str1 = Range("D4")  ' read cell D4
    int1 = Cells(9, 4)  ' read row 9 and col 4 (cell D9)
    ' Output values
    Range("B7") = str1 & "(" & int1 & ")"
    Cells(8, 2) = str1
    ' Your turn - Allocate your first and surname into the two string variables and
    ' output them to B9 (you may use the TM2_StringJoin function)
    str2 = "Relund"
    Range("B9") = TM2_StringJoin(str1, str2)
End Sub


'' Conditional statements (run it using F5)
Sub TM2_CondStatement()
    Dim strName As String
    Dim str As String
    Dim intAnswer As Integer
    
    Worksheets("TM2").Activate
    strName = InputBox("Type your name:")
    intAnswer = MsgBox("Do you want to display your name in a message box?", vbYesNo)  ' you can use vbYes and vbNo in your code
    If intAnswer = vbYes Then
        ' Make the message box:
        MsgBox ("Your name is " & strName)
    Else
        ' Write to the sheet:
        Range("B10") = strName
        MsgBox ("Your name is in cell B10")
    End If

    ' Your turn: finish the sub
    ' Ask for a number
    ' Make a message box stating if it is positive or negative
    ' What happens if you don't give a number as input?
End Sub


'' Loops (run it using F5)
Sub TM2_Loops()
    Dim k As Integer
    
    Worksheets("TM2").Activate
    For k = 2 To 5
        Cells(k, 10) = "Row " & k
    Next
End Sub








