Attribute VB_Name = "ModWst"
'''' Course procedures related to Worksheets
' May be used "as is" during the course and the exam.
' All procedures start with Wst so you can use auto complete to find them easy.
' See the documentation for each procedure for further info.
' If you want to use the procedure in another Excel file, then copy the whole module.
' @author Lars Relund <lars@relund.dk>

Option Explicit


'' Check if a worksheet exists
'
' @param strName Name of worksheet.
' @return True if exists.
' @author Lars Relund <lars@relund.dk>
' @example
'    If WstExists("Test") Then MsgBox ("Found it!")
Function WstExists(strName As String) As Boolean
    WstExists = Evaluate("ISREF('" & strName & "'!A1)")
End Function


'' Delete a worksheet if it exists
'
' @param strName Name of worksheet.
' @return True if deleted.
' @author Lars Relund <lars@relund.dk>
' @example
'    If WstDelete("Test1") Then MsgBox ("Deleted Test1")
Function WstDelete(strName As String) As Boolean
    Dim wst As Worksheet
    Dim bln As Boolean
    
    bln = Application.DisplayAlerts
    Application.DisplayAlerts = False   ' no "really want to delete" alert
    If WstExists(strName) Then
        Worksheets(strName).Delete
        WstDelete = True
    Else
        WstDelete = False
    End If
    Application.DisplayAlerts = bln     ' restore value
End Function


'' Create a worksheet
'
' @param strName Name of worksheet.
' @param blnForce Force deletion of worksheet if exists.
' @return True if created.
' @author Lars Relund <lars@relund.dk>
' @example
'    If WstCreate("Test", blnForce:=True) Then MsgBox ("Created Test")  ' create Test sheet
Function WstCreate(strName As String, Optional blnForce As Boolean = False) As Boolean
    Dim wst As Worksheet
    
    If blnForce And WstExists(strName) Then Call WstDelete(strName)
    If Not WstExists(strName) Then
        Set wst = Worksheets.Add
        wst.Name = strName
        WstCreate = True
    Else
        WstCreate = False
    End If
End Function


'' Rename a worksheet if it exists and no sheet with the new name
'
' @param strName Name of worksheet.
' @param strNewName New name of worksheet.
' @return True if renamed.
' @author Lars Relund <lars@relund.dk>
' @example
'    If WstRename("Test", "Test1") Then MsgBox ("Renamed the Test to Test1")  ' only work if no Test1 sheet
Function WstRename(strName As String, strNewName As String) As Boolean
    Dim wst As Worksheet

    If WstExists(strName) And Not WstExists(strNewName) Then
        Worksheets(strName).Name = strNewName
        WstRename = True
    Else
        WstRename = False
    End If
End Function


'' Clear a worksheet if it exists
'
' @param strName Name of worksheet.
' @param blnCells Delete cell contents, formats, comments, etc. (default).
' @param blnContents Delete only cell contents.
' @param blnFormat Delete only cell format.
' @param blnObjects Delete cell buttons and charts too.
' @return True if cleared.
' @author Lars Relund <lars@relund.dk>
' @example
'    If WstClear("Test8") Then MsgBox ("Cleared Test8") ' no clearing since if no sheet with that name
Function WstClear(strName As String, _
  Optional blnCells As Boolean = True, _
  Optional blnContents As Boolean = False, _
  Optional blnFormat As Boolean = False, _
  Optional blnObjects As Boolean = False) As Boolean
    Dim wst As Worksheet
    
    On Error Resume Next
    If WstExists(strName) Then
        Set wst = Worksheets(strName)
        If blnCells Then wst.UsedRange.Clear
        If blnContents Then wst.Cells.ClearContents
        If blnFormat Then wst.Cells.ClearFormats
        If blnObjects Then
            wst.ChartObjects.Delete
            wst.Buttons.Delete
        End If
        WstClear = True
    Else
        WstClear = False
    End If
End Function




