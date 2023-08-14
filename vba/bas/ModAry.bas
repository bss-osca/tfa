Attribute VB_Name = "ModAry"
'''' Course procedures related to arrays
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
Function AryDim(ary As Variant) As Integer
    Dim intdim As Integer
    Dim intRes As Integer
    
    On Error Resume Next
    ' Loop, increasing the dimension index intDim, until an error occurs.
    ' An error will occur when intDim exceeds the number of dimension
    ' in the array. Return intDim - 1.
    Do
        intdim = intdim + 1
        intRes = UBound(ary, intdim)
    Loop Until Err.Number <> 0
    
    AryDim = intdim - 1
End Function


'' Convert an array to a string
'
' @param ary A 1D or 2D array.
' @param strSep Seperator used to seperate the values.
' @author Lars Relund <lars@relund.dk>
' @example
'   Dim intAry(4) As Integer      ' define array of integers with index 0-4
'   ' Set values
'   intAry(0) = 9
'   intAry(1) = 12
'   intAry(2) = 222
'   intAry(3) = 4
'   intAry(4) = 100
'   ' Information about the array
'   MsgBox ("Lowest index: " & LBound(intAry))
'   MsgBox ("Largest index: " & UBound(intAry))
'   MsgBox ("Number of elements   : " & UBound(intAry) - LBound(intAry) + 1)
'   MsgBox ("Array as a string: " & AryToStr(intAry))
Function AryToStr(ary As Variant, Optional strSep As String = ", ") As String
    Dim strA() As String
    Dim str As String
    Dim i As Integer, j As Integer
    Dim intdim As Integer
    
    intdim = AryDim(ary)
    If intdim = 1 Then
        ReDim strA(LBound(ary) To UBound(ary))
        For i = LBound(ary) To UBound(ary)
            strA(i) = CStr(ary(i))
        Next
        AryToStr = Join(strA, strSep)
    ElseIf intdim = 2 Then
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
' @example
'    Dim ary() As Integer
'    Dim strAry() As String
'    ThisWorkbook.Worksheets("TM5").Activate
'    Call TM5_ClearTestTM5
'    '' Set to value single value
'    ReDim ary(2)
'    Call AryToVal(ary, 5)
'    Range("G4") = "A fixed value:"
'    Call AryPaste(ary, Range("G5")) ' the upper left cell is G5
'    '' Paste vertical
'    Range("K4") = "Paste vertical:"
'    Call AryPaste(ary, Range("K5"), False)
'    '' Set to sequence
'    Call AryToSeq(ary, 1, 6)
'    Range("G10") = "A sequence:"
'    Call AryPaste(ary, Range("G11"))
'    '' Read strings from a range
'    Call AryRead(strAry, Range("C31:D33"))  ' read a 2D array
'    Range("G31") = "Names in the " & AryDim(strAry) & "D array:"
'    Call AryPaste(strAry, Range("G32"))
Sub AryPaste(ary As Variant, rngUL As Range, Optional blnRowwise As Boolean = True)
    If AryDim(ary) = 1 Then
        If blnRowwise Then
            rngUL.Resize(1, UBound(ary) - LBound(ary) + 1) = ary
        Else
            rngUL.Resize(UBound(ary) - LBound(ary) + 1, 1) = WorksheetFunction.Transpose(ary)
        End If
    ElseIf AryDim(ary) = 2 Then
        rngUL.Resize(UBound(ary, 1) - LBound(ary, 1) + 1, UBound(ary, 2) - LBound(ary, 2) + 1) = ary
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
' @example
'    Dim ary() As Integer
'    ThisWorkbook.Worksheets("TM5").Activate
'    Call TM5_ClearTestTM5
'    '' Read values from a range with only 1 column
'    Call AryRead(ary, Range("C5:C9"))
'    Range("G4") = AryDim(ary) & "D array:"
'    Call AryPaste(ary, Range("G5"), False)
'    '' Read values from a range with only 1 row
'    Call AryRead(ary, Range("C5:E5"))
'    Range("I4") = AryDim(ary) & "D array:"
'    Call AryPaste(ary, Range("I5"))
'    '' Read values from a range with only 1 column/row but use 2D array
'    Call AryRead(ary, Range("C11:C14"), blnReduceDim:=False)
'    Range("G10") = AryDim(ary) & "D array:"
'    Call AryPaste(ary, Range("G11"), False)
'    '' Use other start and end index
'    Call AryRead(ary, Range("C17:E19"), intStartIdx1:=2, intStartIdx2:=5)
'    Range("G16") = AryDim(ary) & "D array with start index " & LBound(ary, 1) & " and " & LBound(ary, 2) & ":"
'    Call AryPaste(ary, Range("G17"))
Sub AryRead(ByRef ary As Variant, ByRef rng As Range, _
                 Optional intStartIdx1 As Integer = 1, _
                 Optional intStartIdx2 As Integer = 1, _
                 Optional blnReduceDim As Boolean = True)
    Dim i As Integer, j As Integer
    
    'MsgBox rng.Rows.Count & " " & rng.Columns.Count
    If rng.Rows.Count = 1 And blnReduceDim Then
        ReDim ary(intStartIdx2 To intStartIdx2 + rng.Columns.Count - 1)
        For j = 1 To rng.Columns.Count
            ary(intStartIdx2 + j - 1) = rng(1, j)
        Next j
    ElseIf rng.Columns.Count = 1 And blnReduceDim Then
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
' @example
'    Dim ary() As Integer
'    ThisWorkbook.Worksheets("TM5").Activate
'    Call TM5_ClearTestTM5
'    '' Read 1D array
'    Call AryReadLong(ary, Range("A36:B38"), 3)   ' default value = 3
'    Range("G35") = "Values in the " & AryDim(ary) & "D array:"
'    Call AryPaste(ary, Range("G36"))
'    '' Read 2D array
'    Call AryReadLong(ary, Range("A41:C47"), 4)   ' default value = 4
'    Range("G40") = "Values in the " & AryDim(ary) & "D array:"
'    Call AryPaste(ary, Range("G41"))
'    '' Read 3D array (cannot be pasted to the sheet, have a look at it using the debugger)
'    Call AryReadLong(ary, Range("A50:D56"), 5)   ' default value = 5
Sub AryReadLong(ByRef ary As Variant, ByRef rng As Range, _
                 Optional vntDefalult As Variant = 0)
    Dim i As Integer, j As Integer
    Dim intdim As Integer
    Dim AryDim() As Long
    
    '' Find upper and lower index
    intdim = rng.Columns.Count - 1
    If intdim > 5 Then
        MsgBox ("Error array dimension must be at most 5!")
        Exit Sub
    End If
    ReDim AryDim(1 To 2, 1 To intdim)
    For i = 1 To intdim
        AryDim(1, i) = WorksheetFunction.Min(rng.Columns(i))
        AryDim(2, i) = WorksheetFunction.Max(rng.Columns(i))
    Next
    If intdim = 1 Then
        ReDim ary(AryDim(1, 1) To AryDim(2, 1))
    ElseIf intdim = 2 Then
        ReDim ary(AryDim(1, 1) To AryDim(2, 1), AryDim(1, 2) To AryDim(2, 2))
    ElseIf intdim = 3 Then
        ReDim ary(AryDim(1, 1) To AryDim(2, 1), AryDim(1, 2) To AryDim(2, 2), AryDim(1, 3) To AryDim(2, 3))
    ElseIf intdim = 4 Then
        ReDim ary(AryDim(1, 1) To AryDim(2, 1), AryDim(1, 2) To AryDim(2, 2), AryDim(1, 3) To AryDim(2, 3), AryDim(1, 4) To AryDim(2, 4))
    ElseIf intdim = 5 Then
        ReDim ary(AryDim(1, 1) To AryDim(2, 1), AryDim(1, 2) To AryDim(2, 2), AryDim(1, 3) To AryDim(2, 3), AryDim(1, 4) To AryDim(2, 4), AryDim(1, 5) To AryDim(2, 5))
    End If
    '' Set default
    Call AryToVal(ary, vntDefalult)
    '' Read values
    ReDim AryDim(1 To intdim)
    For i = 1 To rng.Rows.Count
        For j = 1 To intdim
            AryDim(j) = rng(i, j)
        Next
        If intdim = 1 Then
            ary(AryDim(1)) = rng(i, intdim + 1)
        ElseIf intdim = 2 Then
            ary(AryDim(1), AryDim(2)) = rng(i, intdim + 1)
        ElseIf intdim = 3 Then
            ary(AryDim(1), AryDim(2), AryDim(3)) = rng(i, intdim + 1)
        ElseIf intdim = 4 Then
            ary(AryDim(1), AryDim(2), AryDim(3), AryDim(4)) = rng(i, intdim + 1)
        ElseIf intdim = 5 Then
            ary(AryDim(1), AryDim(2), AryDim(3), AryDim(4), AryDim(5)) = rng(i, intdim + 1)
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
' @example
'    Dim ary() As Integer
'    Dim strAry() As String
'    ThisWorkbook.Worksheets("TM5").Activate
'    Call TM5_ClearTestTM5
'    '' Set to value single value
'    ReDim ary(2)
'    Call AryToVal(ary, 5)
'    Range("G4") = "A fixed value:"
'    Call AryPaste(ary, Range("G5")) ' the upper left cell is G5
Sub AryToVal(ByRef ary As Variant, value As Variant)
    Dim i As Long, j As Long, k As Long, l As Long, h As Long
    Dim intdim As Integer
    
    intdim = AryDim(ary)
    If intdim = 1 Then
        For i = LBound(ary) To UBound(ary)
            ary(i) = value
        Next
    ElseIf intdim = 2 Then
        For i = LBound(ary, 1) To UBound(ary, 1)
            For j = LBound(ary, 2) To UBound(ary, 2)
                ary(i, j) = value
            Next
        Next
    ElseIf intdim = 3 Then
        For i = LBound(ary, 1) To UBound(ary, 1)
            For j = LBound(ary, 2) To UBound(ary, 2)
                For k = LBound(ary, 3) To UBound(ary, 3)
                    ary(i, j, k) = value
                Next
            Next
        Next
    ElseIf intdim = 4 Then
        For i = LBound(ary, 1) To UBound(ary, 1)
            For j = LBound(ary, 2) To UBound(ary, 2)
                For k = LBound(ary, 3) To UBound(ary, 3)
                    For l = LBound(ary, 4) To UBound(ary, 4)
                        ary(i, j, k, l) = value
                    Next
                Next
            Next
        Next
    ElseIf intdim = 5 Then
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
' @example
'    Dim ary() As Integer
'    Dim strAry() As String
'    ThisWorkbook.Worksheets("TM5").Activate
'    Call TM5_ClearTestTM5
'    '' Set to sequence
'    Call AryToSeq(ary, 1, 6)
'    Range("G10") = "A sequence:"
'    Call AryPaste(ary, Range("G11"))
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
' @example
'    Dim ary() As Integer
'    ThisWorkbook.Worksheets("TM5").Activate
'    Call TM5_ClearTestTM5
'    '' Read from a range and sort
'    Call AryRead(ary, Range("C5:E19"))
'    Call AryQuickSort(ary, 1)
'    Range("G3") = "Sort w.r.t. 1. column:"
'    Call RngPaste(Range("C4:E4"), Range("G4"))
'    Call AryPaste(ary, Range("G5"))
Sub AryQuickSort(ByRef ary As Variant, Optional lngColumn As Long = 0, Optional lngStartIdx As Long = -1, Optional lngEndIdx As Long = -1)
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


'' Read a csv file to and array
'
' @param strFileName File name.
' @param strDelim Delimiter, e.g. "," in a comma delimited file.
' @param strExcludeCharacter Sometimes csv files have quotes around strings ("value").
'                            If strExcludeCharacter = """" then removes the quotes.
' @param blnAbsPath If true strName specify the absolute path otherwise create
'        the folder as a subfolder to the current file placement.
' @param lngReadFrom The line to read from.
' @return An empty array if file is empty or can't be opened or a 2D array with all data values.
' @remarks Inspired by http://stackoverflow.com/questions/9564908/open-csv-file-via-vba-performance
'          Will not work if the cell values contain the delimeter.
'          You MUST use blnAbsPath = True if the files are stored at a network folder (e.g. OneDrive)
'          and specify the full path.
' @author Lars Relund <lars@relund.dk>
' @example
'    Dim rng As Range
'    Dim ary() As Integer
'    ThisWorkbook.Worksheets("TM5").Activate
'    Call TM5_ClearTestTM5
'    '' Read csv file (NOTE you must know the separator in the csv file beforehand!)
'    Range("G3") = "Array values:"
'    Call AryFromCSV(ary, "data2.csv", ",")   ' know that it contains integers (otherwise use variant)
'    Call AryPaste(ary, Range("G4"))
Sub AryFromCSV(ary As Variant, strFileName As String, Optional strDelim As String = ";", _
                       Optional strExcludeCharacter As String = "", Optional blnAbsPath As Boolean = False, _
                       Optional lngReadFrom As Long = 1)
    Dim linesList() As Variant  ' array of arrays with each value
    Dim data As Variant
    Dim i As Long, k As Integer
    Dim j As Long
    Dim lngNumRows As Long
    Dim lngNumCols As Long
    Dim file As Integer
    Dim strLine As String
    Dim strPath As String
    Const REDIM_STEP = 10000    ' size we extend the array with
    
    If blnAbsPath Then
        strPath = strFileName
    Else
        strPath = ThisWorkbook.Path & Application.PathSeparator & strFileName
    End If
    On Error GoTo error_open_file
    file = FreeFile()
    Open strPath For Input As #file
    On Error GoTo unhandled_error
    
    ' Counts the number of lines and the largest number of columns and read data into list
    ReDim linesList(1 To 1) As Variant
    Do While Not EOF(file)
        k = k + 1
        If i Mod REDIM_STEP = 0 Then
          ReDim Preserve linesList(1 To UBound(linesList, 1) + REDIM_STEP) As Variant
        End If
        Line Input #file, strLine
        If k >= lngReadFrom Then
            linesList(i + 1) = Split(strLine, strDelim)
            j = UBound(linesList(i + 1), 1) 'number of columns
            If lngNumCols < j Then lngNumCols = j
            i = i + 1
        End If
    Loop
    Close #file
    
    lngNumRows = i
    If lngNumRows = 0 Then Exit Sub      'Empty file
    
    ' Copies the content into an array
    ReDim ary(1 To lngNumRows, 1 To lngNumCols + 1)
    If strExcludeCharacter <> "" Then   ' remove it in the start and end
      For i = 1 To lngNumRows
        For j = 0 To UBound(linesList(i), 1)
          If Left(linesList(i)(j), 1) = strExcludeCharacter Then
            If Right(linesList(i)(j), 1) = strExcludeCharacter Then
              linesList(i)(j) = Mid(linesList(i)(j), 2, Len(linesList(i)(j)) - 2)       'If locTempArray = "", Mid returns ""
            Else
              linesList(i)(j) = Right(linesList(i)(j), Len(linesList(i)(j)) - 1)
            End If
          ElseIf Right(linesList(i)(j), 1) = strExcludeCharacter Then
            linesList(i)(j) = Left(linesList(i)(j), Len(linesList(i)(j)) - 1)
          End If
          ary(i, j + 1) = linesList(i)(j)
        Next j
      Next i
    Else
      For i = 1 To lngNumRows
        For j = 0 To UBound(linesList(i), 1)
          ary(i, j + 1) = linesList(i)(j)
        Next j
      Next i
    End If
    Exit Sub
error_open_file:
    MsgBox ("Error opening csv!")
    Exit Sub
unhandled_error:
    Erase ary
    MsgBox ("Error reading csv!")
End Sub


