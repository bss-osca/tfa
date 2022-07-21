Attribute VB_Name = "ModRng"
'' Course procedures related to ranges
' May be used "as is" during the course and the exam.
' All procedures start with Rng so you can use auto complete to find them easy.
' See the documentation for each procedure for further info.
' If you want to use the procedure in another Excel file, then copy the whole module.
' @author Lars Relund <lars@relund.dk>

Option Explicit


'' Remove fill colors in cell range
'
' @param rng Range to clear.
' @author Lars Relund <lars@relund.dk>
Sub RngRemoveInterior(rng As Range)
    rng.Interior.Pattern = xlNone
End Sub


'' Format a range
'
' @param rng Range to format.
' @param color A string equal "normal", "yellow", "orange" or "green" (otherwise leave background as is).
' @param fit Autofit width?
' @param vertical Make orientation vertical?
' @param merge Merge range?
' @param wrap Wrap text?
' @author Lars Relund <lars@relund.dk>
' @note Only works if you use an english version of Excel since e.g. .Style="Good"
'       must be replaced with .Style = "God" in DK.
Sub RngFormat(rng As Range, Optional color As String = "none", Optional fit As Boolean = False, Optional vertical As Boolean = False, _
 Optional merge As Boolean = False, Optional wrap As Boolean = False)
    With rng
        If color = "yellow" Or color = "orange" Or color = "green" Then .Style = "Input"
        If color = "yellow" Then .Style = "Neutral"
        If color = "green" Then .Style = "Good"
        If color = "none" Then .Style = "Normal"
        .HorizontalAlignment = xlCenter
        If (vertical) Then .Orientation = 90
    End With
    If merge Then rng.merge
    If wrap Then rng.WrapText = True
    If fit Then rng.Columns.AutoFit
End Sub


'' Rows in current region
'
' @param rng A range within the currentregion
' @note Currentregion is the 2-dim range exapanded until empty cells
' @author Lars Relund <lars@relund.dk>
Function RngGetCurRegionRows(rng As Range) As Long
    RngGetCurRegionRows = rng.CurrentRegion.rows.Count
End Function


'' Columns in current region
'
' @param rng A range within the currentregion
' @note Currentregion is the 2-dim range exapanded until empty cells
' @author Lars Relund <lars@relund.dk>
Function RngGetCurRegionCols(rng As Range) As Long
    RngGetCurRegionCols = rng.CurrentRegion.Columns.Count
End Function


' Convert column number to letter
'
' @param lngCol Column number.
' @author Lars Relund <lars@relund.dk>
Function GetColLetter(lngCol As Long) As String
    Dim vArr As Variant
    
    vArr = Split(Cells(1, lngCol).Address(True, False), "$")
    GetColLetter = vArr(0)
End Function


'' First row in current region
'
' @param rng A range within the currentregion
' @note Currentregion is the 2-dim range exapanded until empty cells
' @author Lars Relund <lars@relund.dk>
Function RngGetCurRegionFirstRow(rng As Range) As Long
    RngGetCurRegionFirstRow = rng.CurrentRegion.rows(1).row
End Function


'' First column in current region
'
' @param rng A range within the currentregion
' @note Currentregion is the 2-dim range exapanded until empty cells
' @author Lars Relund <lars@relund.dk>
Function RngGetCurRegionFirstCol(rng As Range, Optional asLetter As Boolean = False) As Variant
    If asLetter Then
        RngGetCurRegionFirstCol = GetColLetter(rng.CurrentRegion.Columns(1).Column)
    Else
        RngGetCurRegionFirstCol = rng.CurrentRegion.Columns(1).Column
    End If
End Function


'' Last row in current region
'
' @param rng A range within the currentregion
' @note Currentregion is the 2-dim range exapanded until empty cells
' @author Lars Relund <lars@relund.dk>
Function RngGetCurRegionLastRow(rng As Range) As Long
    RngGetCurRegionLastRow = rng.CurrentRegion.rows(rng.CurrentRegion.rows.Count).row
End Function


'' Last column in current region
'
' @param rng A range within the currentregion
' @note Currentregion is the 2-dim range exapanded until empty cells
' @author Lars Relund <lars@relund.dk>
Function RngGetCurRegionLastCol(rng As Range, Optional asLetter As Boolean = False) As Variant
    If asLetter Then
        RngGetCurRegionLastCol = GetColLetter(rng.CurrentRegion.Columns(rng.CurrentRegion.Columns.Count).Column)
    Else
        RngGetCurRegionLastCol = rng.CurrentRegion.Columns(rng.CurrentRegion.Columns.Count).Column
    End If
End Function


'' Return the part of the current region starting with upper right cell in row and col
'  number (counting within the current range) and lower right corner of the current range.
'
' @param rng A range within the currentregion
' @param row Row number in the current range.
' @param col Column number in the current range.
' @example RngGetCurRegionRange(rng, 2, 3) return the range of the current region starting in row number 2 and column number 3.
' @author Lars Relund <lars@relund.dk>
Function RngGetCurRegionRange(rng As Range, Optional row As Integer = 1, Optional col As Integer = 1) As Range
    Dim rngCur As Range
    
    Set rngCur = rng.CurrentRegion
    Set RngGetCurRegionRange = Range(rngCur.Cells(row, col), rngCur.Cells(rngCur.rows.Count, rngCur.Columns.Count))
End Function


'' Return the upper left cell of the current region
'
' @param rng A range within the currentregion
' @param asString Return as R1C1 string; otherwise return a Range to the cell.
' @author Lars Relund <lars@relund.dk>
Function RngGetCurRegionUpperLeft(rng As Range, Optional asString As Boolean = False) As Variant
    Dim rngCur As Range
    
    Set rngCur = rng.CurrentRegion
    If asString Then
        RngGetCurRegionUpperLeft = rngCur.Cells(1).Address
    Else
       Set RngGetCurRegionUpperLeft = rngCur.Cells(1)
    End If
End Function


'' Return the lower left cell of the current region
'
' @param rng A range within the currentregion
' @param asString Return as R1C1 string; otherwise return a Range to the cell.
' @author Lars Relund <lars@relund.dk>
Function RngGetCurRegionLowerLeft(rng As Range, Optional asString As Boolean = False) As Variant
    Dim rngCur As Range
    
    Set rngCur = rng.CurrentRegion
    If asString Then
        RngGetCurRegionLowerLeft = rngCur.Cells(rngCur.rows.Count, 1).Address
    Else
       Set RngGetCurRegionLowerLeft = rngCur.Cells(rngCur.rows.Count, 1)
    End If
End Function


'' Return the upper right cell of the current region
'
' @param rng A range within the currentregion
' @param asString Return as R1C1 string; otherwise return a Range to the cell.
' @author Lars Relund <lars@relund.dk>
Function RngGetCurRegionUpperRight(rng As Range, Optional asString As Boolean = False) As Variant
    Dim rngCur As Range
    
    Set rngCur = rng.CurrentRegion
    If asString Then
        RngGetCurRegionUpperRight = rngCur.Cells(1, rngCur.Columns.Count).Address
    Else
       Set RngGetCurRegionUpperRight = rngCur.Cells(1, rngCur.Columns.Count)
    End If
End Function


'' Return the lower right cell of the current region
'
' @param rng A range within the currentregion
' @param asString Return as R1C1 string; otherwise return a Range to the cell.
' @author Lars Relund <lars@relund.dk>
Function RngGetCurRegionLowerRight(rng As Range, Optional asString As Boolean = False) As Variant
    Dim rngCur As Range
    
    Set rngCur = rng.CurrentRegion
    If asString Then
        RngGetCurRegionLowerRight = rngCur.Cells(rngCur.Cells.Count).Address
    Else
       Set RngGetCurRegionLowerRight = rngCur.Cells(rngCur.Cells.Count)
    End If
End Function


'' Join two ranges
' @author Lars Relund <lars@relund.dk>
Function RngJoin(rng1 As Range, rng2 As Range) As Range
    Set RngJoin = Union(rng1, rng2)
End Function


'' Paste a range on a sheet.
'
' @param rng The range to paste
' @param rngUL The upper left cell to paste to.
' @param withFormat If true also copy cell format too.
' @author Lars Relund <lars@relund.dk>
Function RngPaste(rng As Range, rngUL As Range, Optional withFormat As Boolean = False) As Range
    If withFormat Then
        Call rng.Copy(rngUL)
    Else
        rngUL.Resize(rng.rows.Count, rng.Columns.Count).value = rng.value
    End If
    Set RngPaste = rngUL.Resize(rng.rows.Count, rng.Columns.Count)
End Function


'' Clear a range
'
' @param rng Range to clear.
' @param blnCells Delete cell contents, formats, comments, etc. (default).
' @param blnContents Delete cell contents.
' @param blnFormat Delete cell format.
' @author Lars Relund <lars@relund.dk>
Sub RngClear(rng As Range, _
  Optional blnCells As Boolean = True, _
  Optional blnContents As Boolean = False, _
  Optional blnFormat As Boolean = False)
   If blnCells Then rng.Cells.Clear
   If blnContents Then rng.Cells.ClearContents
   If blnFormat Then rng.Cells.ClearFormats
End Sub


'' Return the current region of a range.
'
' @param rng The range to get the current region from.
' @author Lars Relund <lars@relund.dk>
Function RngCurRegion(rng As Range) As Range
    Set RngCurRegion = rng.CurrentRegion
End Function


'' Return the address of the current region of a range.
'
' @param rng The range to get the current region from.
' @author Lars Relund <lars@relund.dk>
Function RngGetCurRegionAddress(rng As Range) As String
    RngGetCurRegionAddress = rng.CurrentRegion.Address
End Function


'' Return the address of a range.
'
' @param rng The range to get the current region from.
' @author Lars Relund <lars@relund.dk>
Function RngGetAddress(rng As Range) As String
    RngGetAddress = rng.Address
End Function


'' Rows in range
'
' @param rng A range.
' @author Lars Relund <lars@relund.dk>
Function RngGetRows(rng As Range) As Long
    RngGetRows = rng.rows.Count
End Function


'' Columns in range
'
' @param rng A range.
' @author Lars Relund <lars@relund.dk>
Function RngGetCols(rng As Range) As Long
    RngGetCols = rng.Columns.Count
End Function


'' First row in range
'
' @param rng A range.
' @author Lars Relund <lars@relund.dk>
Function RngGetFirstRow(rng As Range) As Long
    RngGetFirstRow = rng.rows(1).row
End Function


'' First column in range
'
' @param rng A range.
' @author Lars Relund <lars@relund.dk>
Function RngGetFirstCol(rng As Range, Optional asLetter As Boolean = False) As Variant
    If asLetter Then
        RngGetFirstCol = GetColLetter(rng.Columns(1).Column)
    Else
        RngGetFirstCol = rng.Columns(1).Column
    End If
End Function


'' Last row in range
'
' @param rng A range.
' @author Lars Relund <lars@relund.dk>
Function RngGetLastRow(rng As Range) As Long
    RngGetLastRow = rng.rows(rng.rows.Count).row
End Function


'' Last column in range
'
' @param rng A range.
' @author Lars Relund <lars@relund.dk>
Function RngGetLastCol(rng As Range, Optional asLetter As Boolean = False) As Variant
    If asLetter Then
        RngGetLastCol = GetColLetter(rng.Columns(rng.Columns.Count).Column)
    Else
        RngGetLastCol = rng.Columns(rng.CurrentRegion.Columns.Count).Column
    End If
End Function


'' Return the part of the range starting with upper right cell in row and col
'  number (counting within the current range) and lower right corner of the current range.
'
' @param rng A range.
' @param row Row number in the current range.
' @param col Column number in the current range.
' @example RngGetRange(rng, 2, 3) return the range of the range starting in row number 2 and column number 3.
' @author Lars Relund <lars@relund.dk>
Function RngGetRange(rng As Range, Optional row As Integer = 1, Optional col As Integer = 1) As Range
    Set RngGetRange = Range(rng.Cells(row, col), rng.Cells(rng.rows.Count, rng.Columns.Count))
End Function


'' Return the upper left cell of the range
'
' @param rng A range.
' @author Lars Relund <lars@relund.dk>
Function RngGetUpperLeft(rng As Range, Optional asString As Boolean = False) As Variant
    If asString Then
        RngGetUpperLeft = rng.Cells(1).Address
    Else
       Set RngGetUpperLeft = rng.Cells(1)
    End If
End Function


'' Return the lower left cell of the range
'
' @param rng A range.
' @param asString Return as address string; otherwise return a Range to the cell.
' @author Lars Relund <lars@relund.dk>
Function RngGetLowerLeft(rng As Range, Optional asString As Boolean = False) As Variant
    If asString Then
        RngGetLowerLeft = rng.Cells(rng.rows.Count, 1).Address
    Else
       Set RngGetLowerLeft = rng.Cells(rng.rows.Count, 1)
    End If
End Function


'' Return the upper right cell of the range
'
' @param rng A range.
' @param asString Return as R1C1 string; otherwise return a Range to the cell.
' @author Lars Relund <lars@relund.dk>
Function RngGetUpperRight(rng As Range, Optional asString As Boolean = False) As Variant
    If asString Then
        RngGetUpperRight = rng.Cells(1, rng.Columns.Count).Address
    Else
       Set RngGetUpperRight = rng.Cells(1, rng.Columns.Count)
    End If
End Function


'' Return the lower right cell of the range
'
' @param rng A range.
' @param asString Return as R1C1 string; otherwise return a Range to the cell.
' @author Lars Relund <lars@relund.dk>
Function RngGetLowerRight(rng As Range, Optional asString As Boolean = False) As Variant
    If asString Then
        RngGetLowerRight = rng.Cells(rng.Cells.Count).Address
    Else
       Set RngGetLowerRight = rng.Cells(rng.Cells.Count)
    End If
End Function


















