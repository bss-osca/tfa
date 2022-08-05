Attribute VB_Name = "TM6_exercises"
''' Exercises for Teaching Module 5

Option Explicit



'''' Exercise - Two random integers

'' Generate two random integers
Sub TM6_RandInt1()
    Dim intA As Integer
    Dim intB As Integer
    Dim intR1 As Integer
    Dim intR2 As Integer
    Dim i As Integer
    
    ThisWorkbook.Worksheets("TM6").Activate
    Call TM6_ClearTestTM6
    intA = Range("B24")
    intB = Range("B25")
    Randomize
    intR1 = Application.WorksheetFunction.RandBetween(intA, intB)
    intR2 = intR1
    For i = 1 To 1000  ' try 1000 times
        intR2 = Application.WorksheetFunction.RandBetween(intA, intB)
        If intR2 <> intR1 Then Exit For
    Next
    If intR1 < intR2 Then
      Range("D24") = intR1
      Range("D25") = intR2
    Else
      Range("D24") = intR2
      Range("D25") = intR1
    End If
End Sub


Sub TM6_RandInt2(intA As Integer, intB As Integer, intR1 As Integer, intR2 As Integer)
    Dim i As Integer

    Randomize
    intR1 = Application.WorksheetFunction.RandBetween(intA, intB)
    intR2 = intR1
    For i = 1 To 1000  ' try 1000 times
        intR2 = Application.WorksheetFunction.RandBetween(intA, intB)
        If intR2 <> intR1 Then Exit For
    Next
    If intR1 > intR2 Then
      i = intR2
      intR2 = intR1
      intR1 = i
    End If
End Sub


Sub TM6_RandInt2Main()
    Dim intR1 As Integer
    Dim intR2 As Integer

    Call TM6_RandInt2(2, 17, intR1, intR2)
    MsgBox (intR1 & " " & intR2)
End Sub




'''' Exercise - Swap entries (solution using arrays - using ranges also okay)

'' Swap two entries
Sub TM6_Swap1()
   Dim ary() As String
   Dim intIdx1 As Integer
   Dim intIdx2 As Integer
   Dim intTmp As String
   
   ' prepare
   ThisWorkbook.Worksheets("TM6_Swap").Activate
   Call RngClear(Range("D:D"))
   Call AryRead(ary, RngCurRegion(Range("A4"))) ' read list into array
   intIdx1 = Cells(1, 2)
   intIdx2 = Cells(2, 2)
   ' Swap
   intTmp = ary(intIdx2)
   ary(intIdx2) = ary(intIdx1)
   ary(intIdx1) = intTmp
   ' output
   Range("D3") = "Q1"
   Call AryPaste(ary, Range("D4"), False)
   Call RngFormat(Cells(intIdx1 + 3, 4), "green")
   Call RngFormat(Cells(intIdx2 + 3, 4), "green")
End Sub


'' Swap between entries
Sub TM6_Swap2()
   Dim ary() As String
   Dim intIdx1 As Integer
   Dim intIdx2 As Integer
   Dim intTmp As String
   
   ' prepare
   ThisWorkbook.Worksheets("TM6_Swap").Activate
   Call RngClear(Range("E:E"))
   Call AryRead(ary, RngCurRegion(Range("A4"))) ' read list into array
   intIdx1 = Cells(1, 2)
   intIdx2 = Cells(2, 2)
   ' Swap
   Do While intIdx1 < intIdx2
      intTmp = ary(intIdx1)
      ary(intIdx1) = ary(intIdx2)
      ary(intIdx2) = intTmp
      intIdx1 = intIdx1 + 1
      intIdx2 = intIdx2 - 1
   Loop
   ' output
   Range("E3") = "Q2"
   Call AryPaste(ary, Range("E4"), False)
   Call RngFormat(Range(Cells(Cells(1, 2) + 3, 5), Cells(Cells(2, 2) + 3, 5)), "green")
End Sub


'' Swap random
Sub TM6_Swap3()
   Dim ary() As Variant  ' use variant since columns contain different data types
   Dim i As Integer
   
   ' prepare
   ThisWorkbook.Worksheets("TM6_Swap").Activate
   Call RngClear(Range("F:F"))
   ReDim ary(1 To RngGetCurRegionRows(Range("A4")), 1 To 2)  ' use first col to store a random number
   For i = 1 To UBound(ary, 1)
      ary(i, 1) = Rnd()
      ary(i, 2) = Cells(i + 3, 1)
   Next
   ' Swap using sort based on random number
   Call AryQuickSort(ary, 1)
   ary = WorksheetFunction.Index(ary, 0, 2) ' use Index to remove 1. col
   ' output
   Range("F3") = "Q3"
   Call AryPaste(ary, Range("F4"), False)
   Call RngFormat(Range(Cells(4, 6), Cells(23, 6)), "green")
End Sub





'''' Exercise - Dan's bakery

'' Calcultate daily profit
'
' @param dblDemand Demand.
' @param dblProd Production.
' @param dblPrice Sales price.
' @param dblCost Production costs.
' @param dblGW Lost goodwill cost.
Function TM6_DanProfit(dblDemand As Double, dblProd As Double, dblPrice As Double, _
                       dblCost As Double, dblGW As Double)
    TM6_DanProfit = (dblPrice - dblCost) * WorksheetFunction.Min(dblDemand, dblProd) _
              - dblCost * WorksheetFunction.Max(0, dblProd - dblDemand) _
              - dblGW * WorksheetFunction.Max(0, dblDemand - dblProd)
End Function


'' Simulate daily profit and calcultate daily profit statistics
'
' @param dblProd Production.
' @param dblPrice Sales price.
' @param dblCost Production costs.
' @param dblGW Lost goodwill cost.
' @param aryDens Demand level density array (needed for RandGenDiscrete)..
' @param intDays Days to simulate.
' @param aryStat Array to store the output statistics (output ByRef).
Sub TM6_DanSim(dblProd As Double, dblPrice As Double, dblCost As Double, dblGW As Double, _
               aryDens() As Double, intDays As Integer, aryStat() As Double)
    Dim i As Integer
    Dim dblDemand As Double
    Dim aryProfit() As Double  ' to store profit for all days
    
    ' Simulate
    ReDim aryProfit(1 To intDays)
    For i = 1 To intDays
        dblDemand = RandPoissonInv(50 + RandDiscreteInv(aryDens) * 60)
        aryProfit(i) = TM6_DanProfit(dblDemand, dblProd, dblPrice, dblCost, dblGW)
    Next
    ' Store statistics
    ReDim aryStat(1 To 9)
    aryStat(1) = intDays
    aryStat(2) = dblProd
    aryStat(3) = dblPrice
    aryStat(4) = dblCost
    aryStat(5) = dblGW
    aryStat(6) = WorksheetFunction.Average(aryProfit)
    aryStat(7) = WorksheetFunction.StDev_S(aryProfit)
    aryStat(8) = WorksheetFunction.Min(aryProfit)
    aryStat(9) = WorksheetFunction.Max(aryProfit)
End Sub


'' Calcultate daily profit statistics for the data in the Main sheet and different production levels
Sub TM6_BtnDanSim()
    Dim aryDens() As Double, aryStat() As Double
    Dim dblProd As Double, dblPrice As Double, dblCost As Double, dblGW As Double
    Dim intRow As Integer
    Dim i As Integer
    
    ' Prepare
    ThisWorkbook.Worksheets("TM6_DanSim").Activate
    Call AryRead(aryDens, Range("B4:C6"))   ' read density
    dblPrice = Range("F4")
    dblCost = Range("F5")
    dblGW = Range("F6")
    Call RngClear(Range("10:1000"))
    ' Simulate
    intRow = 10
    For i = 1 To 20
        dblProd = i * 20
        Call TM6_DanSim(dblProd, dblPrice, dblCost, dblGW, aryDens, 500, aryStat)
        Call AryPaste(aryStat, Range("A" & intRow))
        intRow = intRow + 1
    Next
End Sub




'''' Exercise - Generating random numbers

'' Examples on distributions
Sub TM6_GenRandNumb()
    Dim ary() As Double
    Dim aryDens(6, 2) As Double
    Dim intBins As Integer, intSize As Integer
    
    Randomize    ' initialize random-number generator
    ThisWorkbook.Worksheets("TM6_GenRand").Activate
    Call WstClear("TM6_GenRand", blnObjects:=True)
    intBins = 50
    intSize = 5000
    ' Generate normal
    Call RandGenNormal(intSize, 100, 20, ary)
    Call TM6_PlotFreq(ary, intBins, Range("B4"), 200, 15 * 3)
    ' Generate uniform
    Call RandGenUniformCont(intSize, 10, 500, ary)
    Call TM6_PlotFreq(ary, intBins, Range("B" & intBins + 6), 200, 15 * 3 + 15 * (intBins + 1))
    ' Generate binomial
    Call RandGenBinomial(intSize, 100, 0.2, ary)
    Call TM6_PlotFreq(ary, intBins, Range("L4"), 700, 15 * 3)
    ' Generate poisson
    Call RandGenPoisson(intSize, 5, ary)
    Call TM6_PlotFreq(ary, intBins, Range("L" & intBins + 6), 700, 15 * 3 + 15 * (intBins + 1))
    ' Generate custom
    aryDens(1, 1) = 3
    aryDens(2, 1) = 4
    aryDens(3, 1) = 5
    aryDens(4, 1) = 6
    aryDens(1, 2) = 0.1
    aryDens(2, 2) = 0.3
    aryDens(3, 2) = 0.5
    aryDens(4, 2) = 0.1
    Call RandGenDiscrete(intSize, aryDens, ary)
    Call TM6_PlotFreq(ary, 4, Range("B" & 2 * intBins + 8), 200, 15 * 5 + 15 * (2 * intBins + 1))
End Sub


'' Create a freq. plot
'
' @param ary Array with values.
' @param intBinSize Number of bins to create.
' @param rngUL Upper left cell to plot the results.
' @param intLeft Position left for plot (pixles).
' @param intTop Position top for plot (pixles).
Sub TM6_PlotFreq(ary() As Double, intBinSize As Integer, rngUL As Range, intLeft As Integer, intTop As Integer)
    Dim i As Integer, j As Integer
    Dim dblMin As Double, dblMax As Double
    Dim dblInv As Double
    Dim rngFreq As Range
    Dim rngBins As Range
    
    Set rngBins = Range(rngUL, Cells(rngUL.Rows(1).row + intBinSize - 1, rngUL.Columns(1).Column))
    Set rngFreq = Range(rngUL.Offset(0, 1), Cells(rngUL.Rows(1).row + intBinSize - 1, rngUL.Columns(1).Column + 1))
    
    '' Find min and max
    dblMin = Application.WorksheetFunction.Min(ary)
    dblMax = Application.WorksheetFunction.Max(ary)
    
    '' Calculate upper bound of bins
    dblInv = (dblMax - dblMin) / intBinSize ' interval of each bin
    For i = 1 To intBinSize
        rngBins(i) = dblMin + i * dblInv
    Next
    
    '' Add numbers to bins
    For i = LBound(ary) To UBound(ary)
        If ary(i) <= rngBins(1) Then   ' if in first bin
            rngFreq(1) = rngFreq(1) + 1
        Else
            For j = 2 To intBinSize  ' note we consider row j + 1
                If ary(i) > rngBins(j - 1) And ary(i) <= rngBins(j) Then
                    rngFreq(j) = rngFreq(j) + 1
                    Exit For    ' don't have to search further
                End If
            Next
        End If
    Next
    
    rngBins(1).Offset(-1, 0) = "UB bin"
    rngFreq(1).Offset(-1, 0) = "Freq."

    ' make the chart (use the macro recorder to get the code)
    Dim cht As ChartObject
    Set cht = ActiveSheet.ChartObjects.Add(intLeft, intTop, 300, 200)
    With cht.Chart
        .ChartType = xlColumnClustered
        .HasTitle = True
        .SetSourceData Source:=rngFreq
        .SeriesCollection(1).XValues = rngBins
        .HasTitle = False
    End With
End Sub

