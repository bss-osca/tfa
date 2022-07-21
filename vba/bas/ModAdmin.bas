Attribute VB_Name = "ModAdmin"
Option Explicit

'' Excel macro to export all VBA modules in the active workbook.
' Requires enabling trust the "VBA project object model" in Excel
' Assume that
Sub ExportModules()
   Const Module = 1
   Const ClassModule = 2
   Const Form = 3
   Const Document = 1004
   Dim strPath As String
   Dim strFile As String
   Dim VBComponent As Object
   
   On Error GoTo Err
   If MsgBox("Export modules from " & ActiveWorkbook.Name, vbYesNo) = vbYes Then
      strPath = ActiveWorkbook.path & Application.PathSeparator & "bas" & Application.PathSeparator
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



' Excel macro to export all VBA modules in the active workbook.


'source code in this project to text files for proper source control versioning
' Requires enabling the Excel setting in Options/Trust Center/Trust Center Settings/Macro Settings/Trust access to the VBA project object model
Public Sub ExportModulesold()
    Const Module = 1
    Const ClassModule = 2
    Const Form = 3
    Const Document = 100
    Const Padding = 24
    
    Dim VBComponent As Object
    Dim count As Integer
    Dim path As String
    Dim directory As String
    Dim extension As String
    Dim fso As New FileSystemObject
    
    directory = ActiveWorkbook.path & "\VisualBasic"
    count = 0
    
    If Not fso.FolderExists(directory) Then
        Call fso.CreateFolder(directory)
    End If
    Set fso = Nothing
    
    For Each VBComponent In ActiveWorkbook.VBProject.VBComponents
        Select Case VBComponent.Type
            Case ClassModule, Document
                extension = ".cls"
            Case Form
                extension = ".frm"
            Case Module
                extension = ".bas"
            Case Else
                extension = ".txt"
        End Select
            
                
        On Error Resume Next
        Err.Clear
        
        path = directory & "\" & VBComponent.Name & extension
        Call VBComponent.Export(path)
        
        If Err.Number <> 0 Then
            Call MsgBox("Failed to export " & VBComponent.Name & " to " & path, vbCritical)
        Else
            count = count + 1
            Debug.Print "Exported " & Left$(VBComponent.Name & ":" & Space(Padding), Padding) & path
        End If

        On Error GoTo 0
    Next
    
    Application.StatusBar = "Successfully exported " & CStr(count) & " VBA files to " & directory
    Application.OnTime Now + TimeSerial(0, 0, 10), "ClearStatusBar"
End Sub



