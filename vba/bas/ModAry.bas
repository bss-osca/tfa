Attribute VB_Name = "ModAry"
'' Course procedures related to arrays
' May be used "as is" during the course and the exam.
' All procedures start with Ary so you can use auto complete to find them easy.
' See the documentation for each procedure for further info.
' If you want to use the procedure in another Excel file, then copy the whole module.
' @author Lars Relund <lars@relund.dk>


Option Explicit


'' Array dimension
'
' @param ary The array.
' @return Dimension (an unallocated dynamic array has 0 dimension).
' @author Chip Pearson
Public Function AryDim(ary As Variant) As Integer
    Dim intDim As Integer
    Dim intRes As Integer
    
    On Error Resume Next
    ' Loop, increasing the dimension index intDim, until an error occurs.
    ' An error will occur when intDim exceeds the number of dimension
    ' in the array. Return intDim - 1.
    Do
        intDim = intDim + 1
        intRes = UBound(ary, intDim)
    Loop Until Err.Number <> 0
    
    AryDim = intDim - 1
End Function


'' Convert an array to a string
'
' @param ary A 1D or 2D array.
' @param strSep Seperator used to seperate the values.
' @author Lars Relund <lars@relund.dk>
Public Function AryToStr(ary As Variant, Optional strSep As String = ", ") As String
    Dim strA() As String
    Dim str As String
    Dim i As Integer, j As Integer
    Dim intDim As Integer
    
    intDim = AryDim(ary)
    If intDim = 1 Then
        ReDim strA(LBound(ary) To UBound(ary))
        For i = LBound(ary) To UBound(ary)
            strA(i) = CStr(ary(i))
        Next
        AryToStr = Join(strA, strSep)
    ElseIf intDim = 2 Then
        ReDim strA(LBound(ary, 1) To UBound(ary, 1), LBound(ary, 2) To UBound(ary, 2))
        For i = LBound(ary, 1) To UBound(ary, 1)
            For j = LBound(ary, 2) To UBound(ary, 2)
                str = str & CStr(ary(i, j)) & strSep
            Next
        Next
        AryToStr = Left(str, Len(str) - Len(strSep))
    Else
        AryToStr = "Error: array dimension larger than 2."
        Exit Function
    End If
End Function


'' Paste a 1D or 2D array to a sheet
'
' @param ary The array.
' @param rng The upper left cell of the printed cells.
' @param blnRowwise Paste the 1D array as a column or row (default).
'
' @author Lars Relund <lars@relund.dk>
Sub AryPaste(ary As Variant, rng As Range, Optional blnRowwise As Boolean = True)
    If AryDim(ary) = 1 Then
        If blnRowwise Then
            rng.Resize(1, UBound(ary) - LBound(ary) + 1) = ary
        Else
            rng.Resize(UBound(ary) - LBound(ary) + 1, 1) = WorksheetFunction.Transpose(ary)
        End If
    ElseIf AryDim(ary) = 2 Then
        rng.Resize(UBound(ary, 1) - LBound(ary, 1) + 1, UBound(ary, 2) - LBound(ary, 2) + 1) = ary
    End If
End Sub


'' Read a range into a 2D array
'
' @param ary Dynamic array.
' @param rng Range to be copied.
' @param intStartIdx1 Starting index for first dimension (default 1).
' @param intStartIdx2 Starting index for second dimension (default 1).
' @param blnReduceDim If true then reduce a range with 1 row or column to a 1D array.
'
' @post The array contains the range values
' @author Lars Relund <lars@relund.dk>
Sub AryRead(ByRef ary As Variant, ByRef rng As Range, _
                 Optional intStartIdx1 As Integer = 1, _
                 Optional intStartIdx2 As Integer = 1, _
                 Optional blnReduceDim As Boolean = True)
    Dim i As Integer, j As Integer
    
    'MsgBox rng.Rows.Count & " " & rng.Columns.Count
    If rng.Rows.Count = 1 Then
        ReDim ary(intStartIdx2 To intStartIdx2 + rng.Columns.Count - 1)
        For j = 1 To rng.Columns.Count
            ary(intStartIdx2 + j - 1) = rng(1, j)
        Next j
    ElseIf rng.Columns.Count = 1 Then
        ReDim ary(intStartIdx1 To intStartIdx1 + rng.Rows.Count - 1)
        For i = 1 To rng.Rows.Count
            ary(intStartIdx1 + i - 1) = rng(i, 1)
        Next i
    Else
        ReDim ary(intStartIdx1 To intStartIdx1 + rng.Rows.Count - 1, intStartIdx2 To intStartIdx2 + rng.Columns.Count - 1)
        For i = 1 To rng.Rows.Count
            For j = 1 To rng.Columns.Count
                ary(intStartIdx1 + i - 1, intStartIdx2 + j - 1) = rng(i, j)
            Next j
        Next i
    End If
End Sub


'' Read a range (long format) into an array (up to a 5D array is supported)
'
' @param ary Dynamic array.
' @param rng Range to be copied in long format, i.e. index in all columns except the last which contains the values.
'
' @post The array contains the range values
' @author Lars Relund <lars@relund.dk>
Sub AryReadLong(ByRef ary As Variant, ByRef rng As Range, _
                 Optional vntDefalult As Variant = 0)
    Dim i As Integer, j As Integer
    Dim intDim As Integer
    Dim AryDim() As Long
    
    '' Find upper and lower index
    intDim = rng.Columns.Count - 1
    If intDim > 5 Then
        MsgBox ("Error array dimension must be at most 5!")
        Exit Sub
    End If
    ReDim AryDim(1 To 2, 1 To intDim)
    For i = 1 To intDim
        AryDim(1, i) = WorksheetFunction.Min(rng.Columns(i))
        AryDim(2, i) = WorksheetFunction.Max(rng.Columns(i))
    Next
    If intDim = 1 Then
        ReDim ary(AryDim(1, 1) To AryDim(2, 1))
    ElseIf intDim = 2 Then
        ReDim ary(AryDim(1, 1) To AryDim(2, 1), AryDim(1, 2) To AryDim(2, 2))
    ElseIf intDim = 3 Then
        ReDim ary(AryDim(1, 1) To AryDim(2, 1), AryDim(1, 2) To AryDim(2, 2), AryDim(1, 3) To AryDim(2, 3))
    ElseIf intDim = 4 Then
        ReDim ary(AryDim(1, 1) To AryDim(2, 1), AryDim(1, 2) To AryDim(2, 2), AryDim(1, 3) To AryDim(2, 3), AryDim(1, 4) To AryDim(2, 4))
    ElseIf intDim = 5 Then
        ReDim ary(AryDim(1, 1) To AryDim(2, 1), AryDim(1, 2) To AryDim(2, 2), AryDim(1, 3) To AryDim(2, 3), AryDim(1, 4) To AryDim(2, 4), AryDim(1, 5) To AryDim(2, 5))
    End If
    '' Set default
    Call AryToVal(ary, vntDefalult)
    '' Read values
    ReDim AryDim(1 To intDim)
    For i = 1 To rng.Rows.Count
        For j = 1 To intDim
            AryDim(j) = rng(i, j)
        Next
        If intDim = 1 Then
            ary(AryDim(1)) = rng(i, intDim + 1)
        ElseIf intDim = 2 Then
            ary(AryDim(1), AryDim(2)) = rng(i, intDim + 1)
        ElseIf intDim = 3 Then
            ary(AryDim(1), AryDim(2), AryDim(3)) = rng(i, intDim + 1)
        ElseIf intDim = 4 Then
            ary(AryDim(1), AryDim(2), AryDim(3), AryDim(4)) = rng(i, intDim + 1)
        ElseIf intDim = 5 Then
            ary(AryDim(1), AryDim(2), AryDim(3), AryDim(4), AryDim(5)) = rng(i, intDim + 1)
        End If
    Next
End Sub


'' Check if an array empty
'
' @param ary The variable to check.
' @return Returns false if not an array or dynamic array that has not been initialised (ReDim not used yet)
'         or has been erased (Erase). Otherwise true.
' @author Lars Relund <lars@relund.dk>
Function AryEmpty(ary As Variant) As Boolean
  If IsArray(ary) = False Then AryEmpty = True
  On Error Resume Next
  If UBound(ary) < LBound(ary) Then
    AryEmpty = True
    Exit Function
  Else
    AryEmpty = False
  End If
End Function


'' Set all array elements to a specific value
'
' @param ary A 1D or 2D array.
' @param value The value.
' @author Lars Relund <lars@relund.dk>
Sub AryToVal(ByRef ary As Variant, value As Variant)
    Dim i As Long, j As Long, k As Long, l As Long, h As Long
    Dim intDim As Integer
    
    intDim = AryDim(ary)
    If intDim = 1 Then
        For i = LBound(ary) To UBound(ary)
            ary(i) = value
        Next
    ElseIf intDim = 2 Then
        For i = LBound(ary, 1) To UBound(ary, 1)
            For j = LBound(ary, 2) To UBound(ary, 2)
                ary(i, j) = value
            Next
        Next
    ElseIf intDim = 3 Then
        For i = LBound(ary, 1) To UBound(ary, 1)
            For j = LBound(ary, 2) To UBound(ary, 2)
                For k = LBound(ary, 3) To UBound(ary, 3)
                    ary(i, j, k) = value
                Next
            Next
        Next
    ElseIf intDim = 4 Then
        For i = LBound(ary, 1) To UBound(ary, 1)
            For j = LBound(ary, 2) To UBound(ary, 2)
                For k = LBound(ary, 3) To UBound(ary, 3)
                    For l = LBound(ary, 4) To UBound(ary, 4)
                        ary(i, j, k, l) = value
                    Next
                Next
            Next
        Next
    ElseIf intDim = 5 Then
        For i = LBound(ary, 1) To UBound(ary, 1)
            For j = LBound(ary, 2) To UBound(ary, 2)
                For k = LBound(ary, 3) To UBound(ary, 3)
                    For l = LBound(ary, 4) To UBound(ary, 4)
                        For h = LBound(ary, 5) To UBound(ary, 5)
                            ary(i, j, k, l, h) = value
                        Next
                    Next
                Next
            Next
        Next
    Else
        Call MsgBox("Error: Array diminsion to big. Can not assign the default value!")
    End If
End Sub


'' Set all array elements to a sequence
'
' @param ary A dynamic array (use redim to resize it)
' @param lngFrom From value.
' @param lngTo To value.
' @param lngIdx Start index in the array.
' @author Lars Relund <lars@relund.dk>
Sub AryToSeq(ByRef ary As Variant, lngFrom As Long, lngTo As Long, Optional lngIdx As Long = 1)
    Dim i As Long, lng As Long
    ReDim ary(lngIdx To (lngTo - lngFrom + 1))
    
    lng = lngFrom
    For i = LBound(ary) To UBound(ary)
        ary(i) = lng
        lng = lng + 1
    Next
End Sub


'' Sort a 2-Dimensional array using a quicksort algorithm
'
' @param ary Array to sort and return.
' @param lngColumn Column to sort
' @param lngStartIdx Start index to sort from
' @param lngEndIdx End index to sort from
'
' @example
'
'   Call ArySort(ary,2)  ' sort based on 2. column
'
' @remark https://stackoverflow.com/questions/4873182/sorting-a-multidimensionnal-array-in-vba
'         Posted by Jim Rech 10/20/98 Excel.Programming.
'         Modifications by Nigel Heffernan: Escape failed comparison with empty variant and defensive coding: check inputs
Public Sub AryQuickSort(ByRef ary As Variant, Optional lngColumn As Long = 0, Optional lngStartIdx As Long = -1, Optional lngEndIdx As Long = -1)
    On Error Resume Next

    Dim i As Long
    Dim j As Long
    Dim varMid As Variant
    Dim arrRowTemp As Variant
    Dim lngColTemp As Long

    If IsEmpty(ary) Then
        Exit Sub
    End If
    If InStr(TypeName(ary), "()") < 1 Then  'IsArray() is somewhat broken: Look for brackets in the type name
        Exit Sub
    End If
    If lngStartIdx = -1 Then
        lngStartIdx = LBound(ary, 1)
    End If
    If lngEndIdx = -1 Then
        lngEndIdx = UBound(ary, 1)
    End If
    If lngStartIdx >= lngEndIdx Then    ' no sorting required
        Exit Sub
    End If

    i = lngStartIdx
    j = lngEndIdx

    varMid = Empty
    varMid = ary((lngStartIdx + lngEndIdx) \ 2, lngColumn)

    ' We  send 'Empty' and invalid data items to the end of the list:
    If IsObject(varMid) Then  ' note that we don't check isObject(ary(n)) - varMid *might* pick up a valid default member or property
        i = lngEndIdx
        j = lngStartIdx
    ElseIf IsEmpty(varMid) Then
        i = lngEndIdx
        j = lngStartIdx
    ElseIf IsNull(varMid) Then
        i = lngEndIdx
        j = lngStartIdx
    ElseIf varMid = "" Then
        i = lngEndIdx
        j = lngStartIdx
    ElseIf VarType(varMid) = vbError Then
        i = lngEndIdx
        j = lngStartIdx
    ElseIf VarType(varMid) > 17 Then
        i = lngEndIdx
        j = lngStartIdx
    End If

    While i <= j
        While ary(i, lngColumn) < varMid And i < lngEndIdx
            i = i + 1
        Wend
        While varMid < ary(j, lngColumn) And j > lngStartIdx
            j = j - 1
        Wend

        If i <= j Then
            ' Swap the rows
            ReDim arrRowTemp(LBound(ary, 2) To UBound(ary, 2))
            For lngColTemp = LBound(ary, 2) To UBound(ary, 2)
                arrRowTemp(lngColTemp) = ary(i, lngColTemp)
                ary(i, lngColTemp) = ary(j, lngColTemp)
                ary(j, lngColTemp) = arrRowTemp(lngColTemp)
            Next lngColTemp
            Erase arrRowTemp
            i = i + 1
            j = j - 1
        End If
    Wend
    If (lngStartIdx < j) Then Call AryQuickSort(ary, lngColumn, lngStartIdx, j)
    If (i < lngEndIdx) Then Call AryQuickSort(ary, lngColumn, i, lngEndIdx)
End Sub






