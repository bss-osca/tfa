Attribute VB_Name = "TM6_ex"
'''' Examples for Teaching Module 6

Option Explicit


'' Generate a single random number of different distributions
Sub TM6_RandDistEx()
    Dim aryDens As Variant

    Randomize    ' initialize random-number generator
    MsgBox ("Normal: " & RandInvNormal(100, 20))
    ' Cont. uniform [10,500[
    MsgBox ("Uniform (continuous): " & RandInvUniformCont(10, 500))
    ' Discrete uniform 10,...,500
    MsgBox ("Uniform (discrete): " & RandInvUniformDisc(10, 500))
    ' Binomial 100 trials, pr = 0.2
    MsgBox ("Binomial: " & RandInvBinomial(100, 0.2))
    ' Poisson lambda = 5
    MsgBox ("Poisson: " & RandInvPoisson(5))
    ' Custom discrete
    ReDim aryDens(1 To 4, 1 To 2)
    aryDens(1, 1) = "A"
    aryDens(2, 1) = "B"
    aryDens(3, 1) = "C"
    aryDens(4, 1) = "D"
    aryDens(1, 2) = 0.1
    aryDens(2, 2) = 0.3
    aryDens(3, 2) = 0.5
    aryDens(4, 2) = 0.1
    MsgBox ("Custom (discrete): " & RandInvDiscrete(aryDens))
End Sub


'' Generate random numbers for different distributions which are stored in an array
' Note sheet is only updated when rerun VBA code!
Sub TM6_RandDistAryEx()
    Dim ary() As Double
    Dim ary1 As Variant
    Dim aryDens As Variant
    Dim intSize As Integer
    
    ThisWorkbook.Worksheets("TM6").Activate
    Call TM6_ClearTestTM6
    Randomize    ' initialize random-number generator
    intSize = 20 ' generate 20 numbers for each distribution
    ' Normal
    Call RandGenNormal(intSize, 100, 20, ary)
    Range("A1") = "Normal"
    Call AryPaste(ary, Range("A2"), False)
    ' Cont. uniform [10,500[
    Call RandGenUniformCont(intSize, 10, 500, ary)
    Range("B1") = "Uniform"
    Call AryPaste(ary, Range("B2"), False)
    ' Discrete uniform 10,...,500
    Call RandGenUniformDisc(intSize, 10, 500, ary)
    Range("B1") = "Uniform"
    Call AryPaste(ary, Range("B2"), False)
    ' Binomial 100 trials, pr = 0.2
    Call RandGenBinomial(intSize, 100, 0.2, ary)
    Range("C1") = "Binomial"
    Call AryPaste(ary, Range("C2"), False)
    ' Poisson lambda = 5
    Call RandGenPoisson(intSize, 5, ary)
    Range("D1") = "Poisson"
    Call AryPaste(ary, Range("D2"), False)
    ' Custom discrete
    ReDim aryDens(1 To 4, 1 To 2)
    aryDens(1, 1) = "A"
    aryDens(2, 1) = "B"
    aryDens(3, 1) = "C"
    aryDens(4, 1) = "D"
    aryDens(1, 2) = 0.1
    aryDens(2, 2) = 0.3
    aryDens(3, 2) = 0.5
    aryDens(4, 2) = 0.1
    Call RandGenDiscrete(intSize, aryDens, ary1)
    Range("E1") = "Custom"
    Call AryPaste(ary1, Range("E2"), False)
    Range("G3") = "Custom distribution:"
    Range("G4") = "Value"
    Range("H4") = "Prob."
    Call AryPaste(aryDens, Range("G5"))
End Sub


'' Simulate function values 1000 times and calculate mean and std. dev.
Sub TM6_SimFunc()
    Dim ary() As Double
    Dim i As Integer
    Dim dblX As Double
    
    Randomize    ' initialize random-number generator
    Call RandGenNormal(1000, 100, 20, ary)
    For i = 1 To 1000
      dblX = ary(i)
      ary(i) = 2 * dblX * dblX + 5 * dblX + 123
    Next
    MsgBox ("Mean: " & WorksheetFunction.Average(ary))
    MsgBox ("Std. dev.: " & WorksheetFunction.StDev_S(ary))
End Sub




'''' Example - Traveling salesman problem

'' Generate cities for the TSP (a TSP problem instance)
'
' @param dblCoord A (cities x 3) array to store the generated id and coordinates in (output ByRef).
' @param intCities Number of cities to generate. If 0 then ask.
' @param blnPrint If true then print out the data in columns A:C in the TM6_TSP sheet.
'
' @post Generated data stored in dblCoord.
Sub TM6_GenTSPData(dblCoord() As Double, Optional intCities As Integer = 0, _
                       Optional blnPrint As Boolean = False)
    Dim dblMin As Double
    Dim dblMax As Double
    Dim i As Integer
    Dim ary1() As Double, ary2() As Double
    
    Randomize
    ' Min and max values for uniform distribution
    dblMin = 0
    dblMax = 10
    ' Reallocate
    If intCities = 0 Then intCities = InputBox("How many points should I generate?")
    ReDim dblCoord(1 To intCities, 1 To 3)
    ' Generate random numbers
    Call RandGenUniformCont(intCities, dblMin, dblMax, ary1)
    Call RandGenUniformCont(intCities, dblMin, dblMax, ary2)
    For i = 1 To intCities
        dblCoord(i, 1) = i
        dblCoord(i, 2) = ary1(i)
        dblCoord(i, 3) = ary2(i)
    Next
    '' Print data
    If blnPrint Then
        ThisWorkbook.Worksheets("TM6_TSP").Activate
        Call TM6_ClearTestTSP
        Cells(1, 1).value = "City"
        Cells(1, 2).value = "x-coord"
        Cells(1, 3).value = "y-coord"
        For i = 1 To intCities
            Cells(i + 1, 1).value = dblCoord(i, 1)
            Cells(i + 1, 2).value = dblCoord(i, 2)
            Cells(i + 1, 3).value = dblCoord(i, 3)
        Next
    End If
End Sub


'' Generate data
Sub TM6_BtnGenTSPData()
    Dim dblCoord() As Double

    Call TM6_GenTSPData(dblCoord, 0, True)
End Sub


'' Calculate distance matrix
'
' @param dblDist The distance matrix to store distances (output ByRef).
' @param dblCoord A (cities x 3) array with id and coordinates.
'
' @pre Assume that dblCoord has not been sorted yet!
' @post Distances stored in dblDist.
Sub TM6_CalcDistArray(ByRef dblDist() As Double, dblCoord() As Double)
    Dim i As Integer, j As Integer
    Dim dblDiffX As Double, dblDiffY As Double
    Dim intCities As Integer
    
    intCities = UBound(dblCoord, 1)
    ReDim dblDist(intCities, intCities)
    For i = 1 To intCities
        For j = i + 1 To intCities
            dblDiffX = dblCoord(i, 2) - dblCoord(j, 2)
            dblDiffY = dblCoord(i, 3) - dblCoord(j, 3)
            dblDist(i, j) = Sqr((dblDiffX * dblDiffX) + (dblDiffY * dblDiffY))
            dblDist(j, i) = dblDist(i, j)  ' assume symetric
        Next
    Next
End Sub


'' Calculate visiting sequence based on increasing x-coord
'
' @param dblCoord A (cities x 3) array with id and coordinates.
' @param dblDist The distance matrix.
' @param dblCost Total cost (output ByRef).
' @param intSeq The visiting sequence (output ByRef).
'
' @post The total cost and sequence returned.
 Sub TM6_SolveTSPIncX(dblCoord() As Double, dblDist() As Double, _
                      dblCost As Double, intSeq() As Integer)
    Dim j As Integer
    Dim intCities As Integer
    
    ' Sort
    intCities = UBound(dblDist, 1)
    ReDim intSeq(intCities)
    Call AryQuickSort(dblCoord, 2)
    ' Store visiting sequence
    For j = 1 To intCities
        intSeq(j) = dblCoord(j, 1)
    Next
    dblCost = TM6_CalcCost(dblDist, intSeq)
End Sub


'' Calculate the cost of a route
'
' @param dblDist The distance matrix.
' @param intSeq The visiting sequence (output ByRef).
'
' @return The cost of a route.
Function TM6_CalcCost(dblDist() As Double, intSeq() As Integer) As Double
    Dim dblCost As Double
    Dim intCities As Integer
    Dim j As Integer
    
    intCities = UBound(intSeq)
    dblCost = 0
    For j = 1 To intCities - 1
        dblCost = dblCost + dblDist(intSeq(j), intSeq(j + 1))
    Next
    TM6_CalcCost = dblCost + dblDist(intSeq(intCities), intSeq(1))   ' cost + cost of returning to start
End Function


'' Read the coordinates into an 2D array
'
' @param dblCoord A (cities x 3) array to store the generated id and coordinates in.
'
' @post Generated data stored in dblCoord.
Sub TM6_ReadCoord(dblCoord() As Double)
    Dim rng As Range
    
    ThisWorkbook.Worksheets("TM6_TSP").Activate
    Set rng = RngGetCurRegionRange(Range("A1"), 2) 'current region except the header
    Call AryRead(dblCoord, rng)
End Sub


'' Find solution based on increasing x-coord
Sub TM6_BtnSolveTSPIncX()
    Dim dblCoord() As Double
    Dim dblDist() As Double
    Dim intSeq() As Integer
    Dim dblCost As Double
    
    Call TM6_ReadCoord(dblCoord)
    Call AryQuickSort(dblCoord, 1)  ' so sure sorted by id
    Call TM6_CalcDistArray(dblDist, dblCoord)
    Call TM6_SolveTSPIncX(dblCoord, dblDist, dblCost, intSeq)
    Range("H3") = "Cost:"
    Range("H5") = dblCost
End Sub


'' Find solution based on increasing y-coord
Sub TM6_BtnSolveTSPIncY()
    Dim dblCoord() As Double
    Dim dblDist() As Double
    Dim intSeq() As Integer
    Dim dblCost As Double
    
    Call TM6_ReadCoord(dblCoord)
    Call AryQuickSort(dblCoord, 1)
    Call TM6_CalcDistArray(dblDist, dblCoord)
    Call TM6_SolveTSPIncY(dblCoord, dblDist, dblCost, intSeq)
    Range("H3") = "Cost:"
    Range("H8") = dblCost
End Sub


'' Calculate visiting sequence based on increasing y-coord
'
' @param dblCoord A (cities x 3) array with id and coordinates.
' @param dblDist The distance matrix.
' @param dblCost Total cost.
' @param intSeq The visiting sequence.
'
' @post The total cost and sequence returned.
 Sub TM6_SolveTSPIncY(dblCoord() As Double, dblDist() As Double, ByRef dblCost As Double, ByRef intSeq() As Integer)
    Dim j As Integer
    Dim intCities As Integer
    
    intCities = UBound(dblDist, 1)
    ReDim intSeq(intCities)
    Call AryQuickSort(dblCoord, 3)
    ' Store visiting sequence
    For j = 1 To intCities
        intSeq(j) = dblCoord(j, 1)
    Next
    dblCost = TM6_CalcCost(dblDist, intSeq)
End Sub


'' Find solution based on increasing city id (random since (x,y) generated random)
Sub TM6_BtnSolveTSPRand()
    Dim dblCoord() As Double
    Dim dblDist() As Double
    Dim intSeq() As Integer
    Dim dblCost As Double
    
    Call TM6_ReadCoord(dblCoord)
    Call AryQuickSort(dblCoord, 1)
    Call TM6_CalcDistArray(dblDist, dblCoord)
    Call TM6_SolveTSPRand(dblCoord, dblDist, dblCost, intSeq)
    Range("H3") = "Cost:"
    Range("H11") = dblCost
End Sub


'' Calculate visiting sequence based on increasing city id (random since (x,y) generated random)
'
' @param dblCoord A (cities x 3) array with id and coordinates.
' @param dblDist The distance matrix.
' @param dblCost Total cost.
' @param intSeq The visiting sequence.
'
' @post The total cost and sequence returned.
 Sub TM6_SolveTSPRand(dblCoord() As Double, dblDist() As Double, ByRef dblCost As Double, ByRef intSeq() As Integer)
    Dim j As Integer
    Dim intCities As Integer
    
    intCities = UBound(dblDist, 1)
    ReDim intSeq(intCities)
    ' Store visiting sequence
    For j = 1 To intCities
        intSeq(j) = dblCoord(j, 1)
    Next
    dblCost = TM6_CalcCost(dblDist, intSeq)
End Sub


'' Find solution based on nearest neighbour
Sub TM6_BtnSolveTSPNN()
    Dim dblCoord() As Double
    Dim dblDist() As Double
    Dim intSeq() As Integer
    Dim dblCost As Double
    
    Call TM6_ReadCoord(dblCoord)
    Call AryQuickSort(dblCoord, 1)
    Call TM6_CalcDistArray(dblDist, dblCoord)
    Call TM6_SolveTSPNN(dblCoord, dblDist, dblCost, intSeq)
    Range("H3") = "Cost:"
    Range("H14") = dblCost
End Sub


'' Calculate visiting sequence based on nearest neighbour
'
' @param dblCoord A (cities x 3) array with id and coordinates.
' @param dblDist The distance matrix.
' @param dblCost Total cost.
' @param intSeq The visiting sequence.
'
' @post The total cost and sequence returned.
 Sub TM6_SolveTSPNN(dblCoord() As Double, dblDist() As Double, ByRef dblCost As Double, ByRef intSeq() As Integer)
    Dim i As Integer, id As Integer
    Dim intCities As Integer, intCurCity As Integer, intBestCity As Integer
    Dim dblMinDist As Double
    Dim intUsed() As Integer       ' intUsed(id) = 1 if city id have been used in sequence
    
    intCities = UBound(dblDist, 1)
    ReDim intSeq(intCities)
    ReDim intUsed(intCities)
    ' Find nearst neighbor
    id = 1
    intSeq(1) = id  ' start in city id = 1
    intUsed(id) = 1
    For i = 2 To intCities        ' find next city to add to intSeq(i)
        dblMinDist = 1000000      ' large number
        intCurCity = intSeq(i - 1)
        For id = 2 To intCities   ' scan for next candidate (id = 1 already used)
            If intUsed(id) = 0 And dblDist(intCurCity, id) < dblMinDist Then   ' shorter distance found
                intBestCity = id
                dblMinDist = dblDist(intCurCity, id)
            End If
        Next
        intSeq(i) = intBestCity
        intUsed(intBestCity) = 1
    Next
    dblCost = TM6_CalcCost(dblDist, intSeq)
End Sub


'' Run the solution algorithms on 100 instances and print the results in sheet Simulation.
Sub TM6_TSPSim()
    Dim intCities As Integer
    Dim s As Integer
    Dim dblCoord() As Double
    Dim dblDist() As Double
    Dim intSeq() As Integer
    Dim dblCost As Double
    Dim intRow As Integer
    
    ' Setup sheet
    ThisWorkbook.Worksheets("TM6_TSPSim").Activate
    Call RngClear(Range("A:F"))
    Cells(1, 1) = "Simulation results"
    Cells(3, 2) = "Min"
    Cells(4, 2) = "Mean"
    Cells(5, 2) = "Max"
    intRow = 7
    Cells(intRow, 1) = "Run"
    Cells(intRow, 2) = "Cities"
    Cells(intRow, 3) = "IncX"
    Cells(intRow, 4) = "IncY"
    Cells(intRow, 5) = "Random"
    Cells(intRow, 6) = "NN"
    ' Run simulation
    For s = 1 To 100
        Cells(s + intRow, 1) = s
        intCities = WorksheetFunction.RandBetween(10, 500) ' number of cities
        Cells(s + intRow, 2) = intCities
        Call TM6_GenTSPData(dblCoord, intCities, False)
        Call TM6_CalcDistArray(dblDist, dblCoord)
        Call TM6_SolveTSPIncX(dblCoord, dblDist, dblCost, intSeq)
        Cells(s + intRow, 3) = dblCost
        Call TM6_SolveTSPIncY(dblCoord, dblDist, dblCost, intSeq)
        Cells(s + intRow, 4) = dblCost
        Call TM6_SolveTSPRand(dblCoord, dblDist, dblCost, intSeq)
        Cells(s + intRow, 5) = dblCost
        Call TM6_SolveTSPNN(dblCoord, dblDist, dblCost, intSeq)
        Cells(s + intRow, 6) = dblCost
    Next
    ' Calc statistics
    For s = 3 To 6
        Cells(3, s) = WorksheetFunction.Min(Range(Cells(intRow + 1, s), Cells(intRow + 100, s)))
        Cells(4, s) = WorksheetFunction.Average(Range(Cells(intRow + 1, s), Cells(intRow + 100, s)))
        Cells(5, s) = WorksheetFunction.Max(Range(Cells(intRow + 1, s), Cells(intRow + 100, s)))
    Next
    ' Format cells
    Call RngFormat(Cells(3, 2).CurrentRegion, "green")
    Call RngFormat(Cells(intRow, 1).CurrentRegion, "orange", True)
End Sub








'''' Procedures used to clear tests

Sub TM6_ClearTestTM6()
   Call RngClear(ThisWorkbook.Worksheets("TM6").Range("A1:H21"))
   Call RngClear(ThisWorkbook.Worksheets("TM6").Range("D24:D25"), blnCells:=False, blnContents:=True)
End Sub

Sub TM6_ClearTestTSP()
   Call RngClear(ThisWorkbook.Worksheets("TM6_TSP").Range("A:E"))
   Call RngClear(ThisWorkbook.Worksheets("TM6_TSP").Range("H:H"))
End Sub


Sub TM6_ClearGenRand()
   Call WstClear("TM6_GenRand", blnObjects:=True)
End Sub


