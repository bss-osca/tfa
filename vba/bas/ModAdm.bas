Attribute VB_Name = "ModAdm"
'''' Procedures related to administration of the course
' Mainly for the teacher of the course and not relevant at the exam.
' All procedures start with Adm so you can use auto complete to find them easy.
' See the documentation for each procedure for further info.
' If you want to use the procedure in another Excel file, then copy the whole module.
' @author Lars Relund <lars@relund.dk>

Option Explicit



'' Set the zoom of each sheet in the active workbook to 150%
' @note This procedure is mainly for the teacher of the course and not relevant for the exam.
Sub AdmSetZoom150()
   Dim ws As Worksheet
   Dim wsCur As Worksheet
   
   Set wsCur = ActiveWorkbook.ActiveSheet
   Application.ScreenUpdating = False    'Optional
   For Each ws In ActiveWorkbook.Worksheets
       ws.Activate
       ActiveWindow.Zoom = 150
   Next
   Application.ScreenUpdating = True
   wsCur.Activate
End Sub


'' Set the zoom of each sheet in the active workbook to 100%
' @note This procedure is mainly for the teacher of the course and not relevant for the exam.
Sub AdmSetZoom100()
   Dim ws As Worksheet
   Dim wsCur As Worksheet
   
   Set wsCur = ActiveWorkbook.ActiveSheet
   Application.ScreenUpdating = False    'Optional
   For Each ws In ActiveWorkbook.Worksheets
       ws.Activate
       ActiveWindow.Zoom = 100
   Next
   Application.ScreenUpdating = True
   wsCur.Activate
End Sub


'' Remove all external workbook reference from all shapes triggering macros in this workbook!
' @note This procedure is mainly for the teacher of the course and not relevant for the exam.
' You must copy the macro to the active workbook for working (otherwise point to this workbook)
' Source: https://stackoverflow.com/questions/31033749/moving-sheets-with-vba-codes-and-buttons-to-a-new-workbook
Sub AdmFixCopiedButtonMacroLinks()
    Dim control As Shape
    Dim macroLink As String
    Dim splitLink As Variant
    Dim newLink As String
    Dim wst As Worksheet

    For Each wst In Worksheets
       'Loop through each shape in worksheet
       For Each control In wst.Shapes
           'Grab current macro link (if available)
           macroLink = control.OnAction
           'Determine if shape was linking to a macro
           If macroLink <> vbNullString And InStr(macroLink, "!") <> 0 Then
               'Split Macro Link at the exclaimation mark (store in Array)
               splitLink = Split(macroLink, "!")
               'Pull text occurring after exclaimation mark
               newLink = splitLink(1)
               'Remove any straggling apostrophes from workbook name
               If Right(newLink, 1) = "'" Then
                   newLink = Left(newLink, Len(newLink) - 1)
               End If
               'Apply New Link
               control.OnAction = newLink
           End If
       Next control
    Next wst
End Sub


'' Excel macro to export all VBA modules in the active workbook.
' @note This procedure is mainly for the teacher of the course and not relevant for the exam.
' Requires enabling trust the "VBA project object model" in Excel.
' Assume that there is a "bas" subfolder to place the files. Old bas files are overwritten.
Sub AdmExportModules()
   Const Module = 1
   Const ClassModule = 2
   Const Form = 3
   Const Document = 1004
   Dim strPath As String
   Dim strFile As String
   Dim VBComponent As Object
   
   On Error GoTo Err
   If MsgBox("Export modules from " & ActiveWorkbook.Name & " to the bas subfolder?", vbYesNo) = vbYes Then
      strPath = ActiveWorkbook.Path & Application.PathSeparator & "bas" & Application.PathSeparator
      For Each VBComponent In ActiveWorkbook.VBProject.VBComponents
         Select Case VBComponent.Type
            Case ClassModule, Document
            Case Form
            Case Module
               strFile = strPath & VBComponent.Name & ".bas"
               Call VBComponent.Export(strFile)
            Case Else
         End Select
      Next
      MsgBox ("Exported modules!")
   End If
   Exit Sub
Err:
   MsgBox ("Error exporting modules!")
End Sub


'' Get all module names of a workbook as a string seperated by "|"
' @param wbk The workbook to get module names from.
' @note This procedure is mainly for the teacher of the course and not relevant for the exam.
Function AdmGetAllModuleNames(wbk As Workbook) As String
   Dim modNames As String
   Const Module = 1
   Const ClassModule = 2
   Const Form = 3
   Const Document = 1004
   Dim strPath As String
   Dim strFile As String
   Dim VBComponent As Object
   
   For Each VBComponent In wbk.VBProject.VBComponents
      Select Case VBComponent.Type
         Case Module
            modNames = modNames & "|" & VBComponent.Name
         Case Else
      End Select
   Next
   'MsgBox "Module Names: " & modNames
   GetAllModuleNames = modNames
End Function


'' Overwrite workbook modules with bas modules in bas subfolder
' @param wbkTo The workbook where to overwrite the modules.
' @param strModNames The names of the modules to overwrite.
' @note This procedure is mainly for the teacher of the course and not relevant for the exam.
Sub AdmImportModules(wbkTo As Workbook, strModNames() As String)
   Dim strPath As String, strMod As String
   Dim VBComponent As Object
   Dim str As String
   
   On Error GoTo Err
   strMod = GetAllModuleNames(wbkTo)
   strPath = ThisWorkbook.Path & Application.PathSeparator
   strPath = strPath & "bas" & Application.PathSeparator
   If MsgBox("Overwrite modules in workbook " & wbkTo.Name & " with the modules from the bas subfolder?", vbYesNo) = vbYes Then
      For Each str In strModNames
         If InStr(strMod, str) = 0 Then
            Call wbkTo.VBProject.VBComponents.Import(strPath & str & ".bas")
         End If
      Next
   End If
   Exit Sub
Err:
   MsgBox ("Error importing modules!")
End Sub


'' Import sheets from a workbook to another
' @param wbkTo The workbook where to place the sheets.
' @param wbkFrom The workbook where to copy the sheets from.
' @note This procedure is mainly for the teacher of the course and not relevant for the exam.
Sub AdmImportSheets(wbkTo As Workbook, wbkFrom As Workbook)
   Dim strPath As String
   Dim VBComponent As Object
   Dim wst As Worksheet
   Dim oFrom As Variant
   
   'On Error GoTo Err
   strPath = ThisWorkbook.Path & Application.PathSeparator
   
   ' Copy worksheets
   For Each wst In wbkFrom.Worksheets
      'If InStr(wst.Name, "TM2") > 0 Or InStr(wst.Name, "TM3") > 0 Then
         wbkTo.Activate
         If Not WstExists(wst.Name) Then Call wst.Copy(After:=wbkTo.Sheets(wbkTo.Sheets.Count))
      'End If
   Next
   Exit Sub
Err:
   MsgBox ("Error importing sheets!")
End Sub


Sub AdmTest()
   Dim strPath As String
   strPath = ActiveWorkbook.Path & Application.PathSeparator
   
   ' Import bas and sheets to TM5
   Call ImportModules(Workbooks.Open(strPath & "05-vba-datatypes-solution.xlsm"), ws_main.Range("F7:F13"))
   Call ImportSheets(Workbooks.Open(strPath & "05-vba-datatypes-solution.xlsm"), _
      Workbooks.Open(strPath & "04-vba-procedures-solution.xlsm"))
   
End Sub

