Attribute VB_Name = "ModRng"
'' Useful procedures related to ranges
' See procedure documentation (above each) for more info.
' All procedures start with Rng so you can use auto complete to see all functions.
' @author Lars Relund <junk@relund.dk>

Option Explicit


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
    RngGetCurRegionRows = rng.CurrentRegion.Rows.Count
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
' @author Lars Relund <lars@relund.dk>
Function GetColLetter(lngCol As Long) As String
    Dim vArr As Variant
    
    vArr = Split(Cells(1, lngCol).address(True, False), "$")
    GetColLetter = vArr(0)
End Function


'' First row in current region
'
' @param rng A range within the currentregion
' @note Currentregion is the 2-dim range exapanded until empty cells
' @author Lars Relund <lars@relund.dk>
Function RngGetCurRegionFirstRow(rng As Range) As Long
    RngGetCurRegionFirstRow = rng.CurrentRegion.Rows(1).row
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
    RngGetCurRegionLastRow = rng.CurrentRegion.Rows(rng.CurrentRegion.Rows.Count).row
End Function


'' Last column in current region
'
' @param rng A range within the currentregion
' @note Currentregion is the 2-dim range exapanded until empty cells
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
    Dim RngCur As Range
    
    Set RngCur = rng.CurrentRegion
    Set RngGetCurRegionRange = Range(RngCur.Cells(row, col), RngCur.Cells(RngCur.Rows.Count, RngCur.Columns.Count))
End Function


'' Return the upper left cell of the current region
'
' @param rng A range within the currentregion
' @param asString Return as R1C1 string; otherwise return a Range to the cell.
' @author Lars Relund <lars@relund.dk>
Function RngGetCurRegionUpperLeft(rng As Range, Optional asString As Boolean = False) As Variant
    Dim RngCur As Range
    
    Set RngCur = rng.CurrentRegion
    If asString Then
        RngGetCurRegionUpperLeft = RngCur.Cells(1).address
    Else
       Set RngGetCurRegionUpperLeft = RngCur.Cells(1)
    End If
End Function


'' Return the lower left cell of the current region
'
' @param rng A range within the currentregion
' @param asString Return as R1C1 string; otherwise return a Range to the cell.
' @author Lars Relund <lars@relund.dk>
Function RngGetCurRegionLowerLeft(rng As Range, Optional asString As Boolean = False) As Variant
    Dim RngCur As Range
    
    Set RngCur = rng.CurrentRegion
    If asString Then
        RngGetCurRegionLowerLeft = RngCur.Cells(RngCur.Rows.Count, 1).address
    Else
       Set RngGetCurRegionLowerLeft = RngCur.Cells(RngCur.Rows.Count, 1)
    End If
End Function


'' Return the upper right cell of the current region
'
' @param rng A range within the currentregion
' @param asString Return as R1C1 string; otherwise return a Range to the cell.
' @author Lars Relund <lars@relund.dk>
Function RngGetCurRegionUpperRight(rng As Range, Optional asString As Boolean = False) As Variant
    Dim RngCur As Range
    
    Set RngCur = rng.CurrentRegion
    If asString Then
        RngGetCurRegionUpperRight = RngCur.Cells(1, RngCur.Columns.Count).address
    Else
       Set RngGetCurRegionUpperRight = RngCur.Cells(1, RngCur.Columns.Count)
    End If
End Function


'' Return the lower right cell of the current region
'
' @param rng A range within the currentregion
' @param asString Return as R1C1 string; otherwise return a Range to the cell.
' @author Lars Relund <lars@relund.dk>
Function RngGetCurRegionLowerRight(rng As Range, Optional asString As Boolean = False) As Variant
    Dim RngCur As Range
    
    Set RngCur = rng.CurrentRegion
    If asString Then
        RngGetCurRegionLowerRight = RngCur.Cells(RngCur.Cells.Count).address
    Else
       Set RngGetCurRegionLowerRight = RngCur.Cells(RngCur.Cells.Count)
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
' @param withFormat If true also copy cell format too
' @author Lars Relund <lars@relund.dk>
Sub RngPaste(rng As Range, rngUL As Range, Optional withFormat As Boolean = False)
    If withFormat Then
        rng.Copy rngUL
    Else
        rngUL.Resize(rng.Rows.Count, rng.Columns.Count).value = rng.value
    End If
End Sub


'' Clear contents of a range.
'
' @param rng The range to clear.
' @param blnOnlyContent Clear only values not formatting.
' @author Lars Relund <lars@relund.dk>
Sub RngClear(rng As Range, Optional blnOnlyContent As Boolean = False)
    If blnOnlyContent Then
       rng.ClearContents
    Else
       rng.Cells.Clear
    End If
End Sub


'' Remove formatting (e.g. fill colors) in cell range
'
' @param rng Range to clear.
' @param blnOnlyInterior Clear only values not formatting
' @author Lars Relund <lars@relund.dk>
Sub RngClearFormat(rng As Range, Optional blnOnlyInterior As Boolean = False, Optional blnOnlyBorders As Boolean = False)
      If Not blnOnlyInterior And Not blnOnlyBorders Then
         rng.ClearFormats
      Else
         If blnOnlyInterior Then
            rng.Interior.Pattern = xlNone
         End If
         If blnOnlyBorders Then
            rng.Borders.LineStyle = xlNone
         End If
      End If
End Sub

Sub test()
Call RngClearFormat(Range("G15"), True, True)
End Sub

'' Return the curren region of a range.
'
' @param rng The range to get the current region from.
' @author Lars Relund <lars@relund.dk>
Function RngCurRegion(rng As Range) As Range
    RngCurRegion = rng.CurrentRegion
End Function



'' Rows in range
'
' @param rng A range within the currentregion
' @note Currentregion is the 2-dim range exapanded until empty cells
' @author Lars Relund <lars@relund.dk>
Function RngGetRows(rng As Range) As Long
    RngGetRows = rng.Rows.Count
End Function


'' Columns in range
'
' @param rng A range within the currentregion
' @note Currentregion is the 2-dim range exapanded until empty cells
' @author Lars Relund <lars@relund.dk>
Function RngGetCols(rng As Range) As Long
    RngGetCols = rng.Columns.Count
End Function


'' First row in range
'
' @param rng A range within the currentregion
' @note Currentregion is the 2-dim range exapanded until empty cells
' @author Lars Relund <lars@relund.dk>
Function RngGetFirstRow(rng As Range) As Long
    RngGetFirstRow = rng.Rows(1).row
End Function


'' First column in range
'
' @param rng A range within the currentregion
' @note Currentregion is the 2-dim range exapanded until empty cells
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
' @param rng A range within the currentregion
' @note Currentregion is the 2-dim range exapanded until empty cells
' @author Lars Relund <lars@relund.dk>
Function RngGetLastRow(rng As Range) As Long
    RngGetLastRow = rng.Rows(rng.Rows.Count).row
End Function


'' Last column in range
'
' @param rng A range within the currentregion
' @note Currentregion is the 2-dim range exapanded until empty cells
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
' @param rng A range within the currentregion
' @param row Row number in the current range.
' @param col Column number in the current range.
' @example RngGetRange(rng, 2, 3) return the range of the range starting in row number 2 and column number 3.
' @author Lars Relund <lars@relund.dk>
Function RngGetRange(rng As Range, Optional row As Integer = 1, Optional col As Integer = 1) As Range
    Set RngGetRange = Range(rng.Cells(row, col), rng.Cells(RngCur.Rows.Count, rng.Columns.Count))
End Function


'' Return the upper left cell of the range
'
' @param rng A range within the currentregion
' @param asString Return as R1C1 string; otherwise return a Range to the cell.
' @author Lars Relund <lars@relund.dk>
Function RngGetUpperLeft(rng As Range, Optional asString As Boolean = False) As Variant
    If asString Then
        RngGetUpperLeft = rng.Cells(1).address
    Else
       Set RngGetUpperLeft = rng.Cells(1)
    End If
End Function


'' Return the lower left cell of the range
'
' @param rng A range within the currentregion
' @param asString Return as R1C1 string; otherwise return a Range to the cell.
' @author Lars Relund <lars@relund.dk>
Function RngGetLowerLeft(rng As Range, Optional asString As Boolean = False) As Variant
    If asString Then
        RngGetLowerLeft = rng.Cells(RngCur.Rows.Count, 1).address
    Else
       Set RngGetLowerLeft = rng.Cells(RngCur.Rows.Count, 1)
    End If
End Function


'' Return the upper right cell of the range
'
' @param rng A range within the currentregion
' @param asString Return as R1C1 string; otherwise return a Range to the cell.
' @author Lars Relund <lars@relund.dk>
Function RngGetUpperRight(rng As Range, Optional asString As Boolean = False) As Variant
    If asString Then
        RngGetUpperRight = rng.Cells(1, rng.Columns.Count).address
    Else
       Set RngGetUpperRight = rng.Cells(1, rng.Columns.Count)
    End If
End Function


'' Return the lower right cell of the range
'
' @param rng A range within the currentregion
' @param asString Return as R1C1 string; otherwise return a Range to the cell.
' @author Lars Relund <lars@relund.dk>
Function RngGetLowerRight(rng As Range, Optional asString As Boolean = False) As Variant
    If asString Then
        RngGetLowerRight = rng.Cells(RngCur.Cells.Count).address
    Else
       Set RngGetLowerRight = rng.Cells(RngCur.Cells.Count)
    End If
End Function








