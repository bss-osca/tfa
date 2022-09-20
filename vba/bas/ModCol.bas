Attribute VB_Name = "ModCol"
''' Course procedures related to collections
' May be used "as is" during the course and the exam.
' All procedures start with Coll so you can use auto complete to find them easy.
' See the documentation for each procedure for further info.
' If you want to use the procedure in another Excel file, then copy the whole module.
' @author Lars Relund <lars@relund.dk>

Option Explicit


'' Convert a collection to a string
'
' @param col A collection.
' @param strSep Seperator used to seperate the values.
' @author Lars Relund <lars@relund.dk>
Function Col2Str(col As Collection, Optional strSep As String = ", ") As String
    Dim e As Variant
    Dim str As String
    
    For Each e In col
        str = str & e & strSep
    Next e
    Col2Str = Left(str, Len(str) - Len(strSep))
End Function


'' Copy a collection
'
' @param colFrom The collection to copy.
' @return A new collection which is a copy.
Function ColCopy(colFrom As Collection) As Collection
    Dim e As Variant
    Dim colTo As New Collection
    
    For Each e In colFrom
        colTo.Add (e)
    Next e
    Set CopyColl = colTo
End Function




