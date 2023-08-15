Attribute VB_Name = "ModTm"
'''' Course procedures related to timing code
' May be used "as is" during the course and the exam.
' All procedures start with Tm so you can use auto complete to find them easy.
' See the documentation for each procedure for further info.
' If you want to use the procedure in another Excel file, then copy the whole module.
' @author Lars Relund <lars@relund.dk>
'
' Use in the following way:
'
'    dblTimer = TmStart()
'    Application.Wait (Now() + TimeValue("0:00:02"))   ' wait for approx 2 sec
'    MsgBox (TmElapsed(dblTimer, "sec"))
'
' @author Lars Relund <lars@relund.dk>
'
' The module also contains two subs for optimizing speed by disabling screen updating etc. Usage
'
'    TmSpeedOptimize()
'    <code we want to be fast>
'    TmRestoreAfterSpeedOptimize()
'
' Resources http://stackoverflow.com/questions/198409/how-do-you-test-running-time-of-vba-code

Option Explicit


'' Start timer (unit seconds)
' @example
'    dblTimer = TmStart()
'    Application.Wait (Now() + TimeValue("0:00:02"))   ' wait for approx 2 sec
'    MsgBox (TmElapsed(dblTimer, "sec"))
Function TmStart() As Double
  TmStart = timer
End Function


'' Time since timer has be started.
'
' @param dblTimer Timer when started the timer using timer = StartTimer().
' @param strUnit Return unit must be either ms, sec, min or hour otherwise return -1
' @return Time used in the specified unit
' @example
'    dblTimer = TmStart()
'    Application.Wait (Now() + TimeValue("0:00:02"))   ' wait for approx 2 sec
'    MsgBox (TmElapsed(dblTimer, "sec"))
Function TmElapsed(dblTimer As Double, Optional strUnit As String = "sec")
    Dim time As Double

    TmElapsed = -1
    time = timer - dblTimer
    If strUnit = "ms" Then TmElapsed = time * 1000
    If strUnit = "sec" Then TmElapsed = time
    If strUnit = "min" Then TmElapsed = time / 60
    If strUnit = "hour" Then TmElapsed = time / 60 / 60
End Function


'' Set some properties for the Application object to optimize excecution of vba
' @example
'    Dim dbltimer As Double
'    Dim i As Integer
'    Dim dblT1 As Double, dblT2 As Double
'    ' Measure cpu time
'    dbltimer = TmStart()
'    Application.Wait (Now() + TimeValue("0:00:02"))   ' wait for approx 2 sec
'    MsgBox ("Time used: " & TmElapsed(dbltimer, "sec") & " sec")
'    ' Impact of disabling application updates
'    Call TmSpeedOptimize
'    dbltimer = TmStart()
'    For i = 1 To 10000
'      Cells(200, 500) = 56
'    Next
'    dblT1 = TmElapsed(dbltimer, "sec")
'    Call TmRestoreAfterSpeedOptimize
'    dbltimer = TmStart()
'    For i = 1 To 10000
'      Cells(200, 500) = 56
'    Next
'    dblT2 = TmElapsed(dbltimer, "sec")
'    MsgBox ("Time without updates: " & dblT1 & vbCr & "Time with updates: " & dblT2)
'    Cells(200, 500).Clear
Sub TmSpeedOptimize()
    Application.ScreenUpdating = False
    Application.Calculation = xlCalculationManual   ' turn off the automatic calculation
    Application.DisplayStatusBar = False            ' turn off status bar updates
    Application.EnableEvents = False                ' ignore events
End Sub


'' Restore properties for the Application object after have called ApplicationSpeedOptimize
' @author Lars Relund <lars@relund.dk>
' @example
'    Dim dbltimer As Double
'    Dim i As Integer
'    Dim dblT1 As Double, dblT2 As Double
'    ' Measure cpu time
'    dbltimer = TmStart()
'    Application.Wait (Now() + TimeValue("0:00:02"))   ' wait for approx 2 sec
'    MsgBox ("Time used: " & TmElapsed(dbltimer, "sec") & " sec")
'    ' Impact of disabling application updates
'    Call TmSpeedOptimize
'    dbltimer = TmStart()
'    For i = 1 To 10000
'      Cells(200, 500) = 56
'    Next
'    dblT1 = TmElapsed(dbltimer, "sec")
'    Call TmRestoreAfterSpeedOptimize
'    dbltimer = TmStart()
'    For i = 1 To 10000
'      Cells(200, 500) = 56
'    Next
'    dblT2 = TmElapsed(dbltimer, "sec")
'    MsgBox ("Time without updates: " & dblT1 & vbCr & "Time with updates: " & dblT2)
'    Cells(200, 500).Clear
Sub TmRestoreAfterSpeedOptimize()
    Application.ScreenUpdating = True
    Application.Calculation = xlCalculationAutomatic
    Application.DisplayStatusBar = True
    Application.EnableEvents = True
End Sub


