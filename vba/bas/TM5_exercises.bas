Attribute VB_Name = "TM5_exercises"
'''' Exercises for Teaching Module 5

Option Explicit


'''' Exercise - Equal entries

'' Find equal entries
Sub TM5_Equal()
    Dim r As Integer, c As Integer
    Dim numbers() As Integer
    Dim equal() As Integer
    Dim rng As Range
   
    ThisWorkbook.Worksheets("TM5_Equal").Activate
    Set rng = RngCurRegion(Cells(4, Range("C1")))  ' current region
    Call AryRead(numbers, rng)  ' read into array
    ' Set values in equal array
    ReDim equal(LBound(numbers) To UBound(numbers), LBound(numbers) To UBound(numbers))
    For r = LBound(numbers) To UBound(numbers)
        For c = LBound(numbers) To UBound(numbers)
            If numbers(r) = numbers(c) Then
                equal(r, c) = 1
            End If
        Next
    Next
    '' If want to check (paste array equal)
    Call RngClear(Range("O:BA"))
    Call AryPaste(equal, Range("O4"))
End Sub


'' Find equal entries using named range
Sub TM5_EqualNamedRange()
    Dim r As Integer, c As Integer
    Dim numbers() As Integer
    Dim equal() As Integer
    Dim rng As Range
   
    ThisWorkbook.Worksheets("TM5_Equal").Activate
    Set rng = Range("Numbers")
    Call AryRead(numbers, rng)  ' read into array
    ' Set values in equal array
    ReDim equal(LBound(numbers) To UBound(numbers), LBound(numbers) To UBound(numbers))
    For r = LBound(numbers) To UBound(numbers)
        For c = LBound(numbers) To UBound(numbers)
            If numbers(r) = numbers(c) Then
                equal(r, c) = 1
            End If
        Next
    Next
    '' If want to check (paste array equal)
    Call RngClear(Range("O:BA"))
    Call AryPaste(equal, Range("O4"))
End Sub




'''' Exercise - Product search

'' Search the sheet Products for a product code and give the price
Sub TM5_FindProduct()
    Dim code() As String
    Dim price() As Double
    Dim intLastRow As Integer
    Dim i As Integer
    Dim strPCode As String
    Dim rng As Range
    
    ThisWorkbook.Worksheets("TM5_Products").Activate  ' now we know what is active
    ' Read values into arrays
    intLastRow = RngGetCurRegionLastRow(Range("A3"))
    Set rng = Range(Cells(4, 1), Cells(intLastRow, 1))
    Call AryRead(code, rng)
    Set rng = Range(Cells(4, 2), Cells(intLastRow, 2))
    Call AryRead(price, rng)
    ' Ask for a product code
    strPCode = UCase(InputBox("Please enter a product code:"))
    ' Search the code array
    For i = LBound(code) To UBound(code)
        If code(i) = strPCode Then
            MsgBox ("The price of product " & strPCode & " is " & price(i))
            Exit Sub
        End If
    Next
    MsgBox ("Product not found!")
End Sub




'''' Exercise - Read collections

'' Collection without keys
Sub TM5_ColNoKeys()
    Dim col As New Collection   ' declare and create
    Dim colC As New Collection
    Dim r As Integer
    
    ThisWorkbook.Worksheets("TM5_Col").Activate  ' now we know what is active
    For r = 2 To RngGetCurRegionLastRow(Range("A1"))
        Call col.Add(Cells(r, 1))
    Next
    MsgBox ("The collection contains: " & Col2Str(col))
    
    ' Copy all items with value below 5
    For r = 1 To col.Count
        If col(r) < 5 Then Call colC.Add(col(r))
    Next
    MsgBox ("The collection contains: " & Col2Str(colC))
End Sub


'' Collection with keys
Sub TM5_ColKeys()
    Dim col As New Collection   ' declare and create
    Dim r As Integer
    
    ThisWorkbook.Worksheets("TM5_Col").Activate  ' now we know what is active
    For r = 2 To RngGetCurRegionLastRow(Range("C1"))
        Call col.Add(Cells(r, 4), Cells(r, 3)) ' value, key
    Next
    MsgBox ("The collection contains: " & Col2Str(col))
    
    MsgBox ("The price of product with ID92011 is: " & col("ID92011"))
    ' MsgBox ("The price of product with ID92 is: " & col("ID92"))    ' error since the key doesn't exists
End Sub




'''' Exercise - Read arrays

'' Read three arrays (use the debuger to have a look at them)
Sub TM5_ReadArrays()
   Dim ary1D() As Integer
   Dim ary2D() As Integer
   Dim ary4D() As Integer
   Dim rng As Range
   
   ThisWorkbook.Worksheets("TM5_Array").Activate  ' now we know what is active
   ' Read 1D array
   Set rng = Range(Cells(4, 1), Cells(RngGetCurRegionLastRow(Range("A4")), 2)) ' range with index and values
   Call AryReadLong(ary1D, rng, 10)
   ' Read 4D array
   Set rng = Range(Range("D4"), RngGetCurRegionLowerRight(Range("D4")))  ' range with index and values
   Call AryReadLong(ary4D, rng, 5)
   ' Read 2D array
   Set rng = RngCurRegion(Range("J4")) ' range with values
   Call AryRead(ary2D, rng, 3, 5)
End Sub




'''' Exercise - Process numbers

'' Process numbers
Sub TM5_Process()
    Dim r As Integer, c As Integer
    Dim rng As Range
    Dim wstTo As Worksheet, wstFrom As Worksheet
    
    Set wstTo = ThisWorkbook.Worksheets("TM5_Process")
    Set wstFrom = ThisWorkbook.Worksheets("TM5_ProcessData")
    Call WstClear("TM5_Process")
    Call RngPaste(RngCurRegion(wstFrom.Range("A1")), wstTo.Range("A1"))
    ThisWorkbook.Worksheets("TM5_Process").Activate
    Set rng = RngCurRegion(Range("A1"))
    ' scan range
    For r = 1 To rng.Rows.Count
        For c = 1 To rng.Columns.Count
            If rng(r, c) < 0 Then rng(r, c).Clear
            If rng(r, c) > 20 Then rng(r, c).Interior.ColorIndex = 37
        Next
    Next
End Sub


'' Statistics of numbers
Sub TM5_Stat()
    Dim r As Integer, c As Integer
    Dim rng As Range
    Dim dblM As Double, dblS As Double, dblCtr As Double
    
    Worksheets("TM5_ProcessData").Activate
    Set rng = RngCurRegion(Range("A1"))

    For r = 1 To rng.Rows.Count
        For c = 1 To rng.Columns.Count
            If rng(r, c) > 0 Then dblS = dblS + rng(r, c)
            If rng(r, c) < 0 Then
                dblM = dblM + rng(r, c)
                dblCtr = dblCtr + 1
            End If
        Next
    Next
    dblM = dblM / dblCtr
    MsgBox ("Sum of non-negative numbers = " & dblS & ". Mean of negative numbers = " & dblM & ".")
End Sub




'''' Exercise - Search payments

'' Search payments based on payment and grouping
Sub TM5_SearchPayments()
    Dim blnPay As Boolean
    Dim strG As String
    Dim intSize As Integer
    Dim rng As Range
    Dim ary() As Integer
    Dim r As Integer, j As Integer, i As Integer
    Dim intCMin As Integer, intCMax As Integer
    Dim intYMin As Integer, intYMax As Integer, intY As Integer
    
    ' Read boolean and grouping
    ThisWorkbook.Worksheets("TM5_Payments").Activate
    blnPay = Range("B1")
    strG = Range("B2")
    '' Find min and max client id
    ThisWorkbook.Worksheets("TM5_PaymentsData").Activate
    Set rng = Range("B2:B" & RngGetCurRegionLastRow(Range("A1")))
    intCMin = Application.WorksheetFunction.Min(rng)
    intCMax = Application.WorksheetFunction.Max(rng)
    
    If strG = "None" Then  ' no grouping
        ReDim ary(intCMin To intCMax)  ' use array to store count for each client
        For r = 2 To RngGetCurRegionLastRow(Range("A1"))  ' scan clients
            If Cells(r, 3) = blnPay Then
                ary(Cells(r, 2)) = ary(Cells(r, 2)) + 1
            End If
        Next
        ' Output results
        ThisWorkbook.Worksheets("TM5_Payments").Activate
        Call RngClear(Range("A5:C10000"))
        Cells(5, 1) = "Client"
        Cells(5, 2) = "Count"
        r = 6
        For j = LBound(ary) To UBound(ary)
           Cells(r, 1) = j
           Cells(r, 2) = ary(j)
           r = r + 1
        Next
    ElseIf strG = "Year" Then  ' group by year
        ' Find min and max year
        intYMin = 3000
        For r = 2 To RngGetCurRegionLastRow(Range("A1"))
            intY = Year(Cells(r, 1))
            If intYMin > intY Then
                intYMin = intY
            End If
            If intYMax < intY Then
                intYMax = intY
            End If
        Next
        ReDim ary(intCMin To intCMax, intYMin To intYMax)  ' use array to store count for each client and year
        For r = 2 To RngGetCurRegionLastRow(Range("A1"))   ' scan clients
            If Cells(r, 3) = blnPay Then
                ary(Cells(r, 2), Year(Cells(r, 1))) = ary(Cells(r, 2), Year(Cells(r, 1))) + 1
            End If
        Next
        ' Output results
        ThisWorkbook.Worksheets("TM5_Payments").Activate
        Call RngClear(Range("A5:C10000"))
        Cells(5, 1) = "Client"
        Cells(5, 2) = "Year"
        Cells(5, 3) = "Count"
        r = 6
        For j = LBound(ary, 1) To UBound(ary, 1)
            For i = LBound(ary, 2) To UBound(ary, 2)
                Cells(r, 1) = j
                Cells(r, 2) = i
                Cells(r, 3) = ary(j, i)
                r = r + 1
            Next
        Next
    Else
        MsgBox ("Error")
    End If
End Sub




'''' Exercise - Flight search

'' Clear search results
Public Sub TM5_ClearSearch()
    Dim rng As Range
    
    ThisWorkbook.Worksheets("TM5_Flight").Activate  ' activate so know work in this sheet
    Set rng = Range("D4:F" & RngGetCurRegionLastRow(Range("D4")))  ' rng to clear
    Call RngClear(rng)
    Cells(3, 4) = "Search result:"
    Cells(4, 4).value = "Origin"
    Cells(4, 5).value = "Destination"
    Cells(4, 6).value = "Flight Number"
    Call RngFormat(Range("D4:F4"), color:="yellow")
End Sub


'' Search flights
Sub TM5_SearchFlights()
    Dim intOrigins As Integer
    Dim intDestinations As Integer
    Dim origin() As String
    Dim destination() As String
    Dim flight() As String
    Dim intFlights As Integer   ' number of flights
    Dim i As Integer
    Dim o As Integer
    Dim d As Integer
    Dim intCurRow As Integer
    Dim rng As Range
    
    Call TM5_ClearSearch
    
    ' Part 1: store the flight information:
    ThisWorkbook.Worksheets("TM5_FlightData").Activate
    Set rng = Range("A2:A" & RngGetCurRegionLastRow(Range("A2")))
    Call AryRead(origin, rng)
    Set rng = Range("B2:B" & RngGetCurRegionLastRow(Range("A2")))
    Call AryRead(destination, rng)
    Set rng = Range("C2:C" & RngGetCurRegionLastRow(Range("A2")))
    Call AryRead(flight, rng)
    ' you may try to stop the code here using a breakpoint to check values
    
    ' Part 2: search for matching origin-destination pairs
    ThisWorkbook.Worksheets("TM5_Flight").Activate
    intOrigins = Cells(5, 1)
    intDestinations = Cells(5, 2)
    intCurRow = 5 ' the next row to write a match in
    For o = 1 To intOrigins  ' scan origins to search for
        ' search for matching origin:
        For i = LBound(origin) To UBound(origin)
            If Cells(5 + o, 1) = origin(i) Then ' origin match found
                ' search to find matching destination:
                For d = 1 To intDestinations
                    If Cells(5 + d, 2) = destination(i) Then
                        ' Complete match is found - write to list:
                        Cells(intCurRow, 4) = origin(i)
                        Cells(intCurRow, 5) = destination(i)
                        Cells(intCurRow, 6) = flight(i)
                        intCurRow = intCurRow + 1
                    End If ' matching destination found
                Next ' d
            End If
        Next ' i
    Next ' o
    Call RngFormat(Range("D5:F" & RngGetCurRegionLastRow(Range("D5"))), color:="orange")
End Sub





'''' Exercise - Search table

'' Search table
Sub TM5_Search1()
    Dim strName As String
    Dim dblAmount As Double
    Dim r As Integer       ' row in sheet
    Dim rO As Integer      ' row in output sheet
    Dim wst As Worksheet
    
    ' prepare sheet
    Worksheets("TM5_Search").Activate
    Call WstClear("TM5_SearchOutput")        ' clean output sheet
    Set wst = Worksheets("TM5_SearchOutput")       ' set reference to output sheet
    Call RngPaste(Range("A1:C1"), wst.Range("A1")) ' paste the header
    ' ask for input
    strName = ""
    dblAmount = -1000000
    If MsgBox("Search for a name?", vbYesNo) = vbYes Then
        strName = InputBox("Type the name")
    End If
    If MsgBox("Search for an amount?", vbYesNo) = vbYes Then
        dblAmount = InputBox("Type the amount")
    End If
    ' search for matches
    rO = 2
    For r = 2 To RngGetCurRegionLastRow(Range("A1"))
        If Cells(r, 1) = strName Or strName = "" Then
            If Cells(r, 3) >= dblAmount Then
                Call RngPaste(Range("A" & r & ":C" & r), wst.Range("A" & rO))
                rO = rO + 1
            End If
        End If
    Next
    wst.Activate
End Sub


'' Copy and sort table
Sub TM5_Search2()
    Dim dblAmount As Double
    Dim r As Integer
    Dim wst As Worksheet
    Dim rng As Range
    
    ' prepare and copy
    Worksheets("TM5_Search").Activate
    Set rng = RngCurRegion(Range("A1"))
    Call WstClear("TM5_SearchOutput")        ' clean output sheet
    Set wst = Worksheets("TM5_SearchOutput") ' set reference to output sheet
    Set rng = RngPaste(rng, wst.Range("A1"), withFormat:=True)  ' paste rng to other sheet and set it to that range
    Call RngFormat(rng, color:="none", fit:=True)
    wst.Activate
    ' sort
    Call rng.Sort(Key1:=rng.Columns(3), Order1:=xlDescending, Key2:=rng.Columns(2))
    ' highlight
    dblAmount = InputBox("Type the amount")
    For r = 2 To RngGetLastRow(rng)
        If Cells(r, 3) < dblAmount Then
            Call RngFormat(Range("A" & r & ":C" & r), "orange")
        End If
    Next
End Sub





'''' Exercise - Next task

'' Find next task
Sub TM5_NextTask()
   
    Dim id As Integer, idB As Integer, idBest As Integer
    Dim rng As Range
    Dim blnFound As Boolean    ' true if we have found one that works
    
    ThisWorkbook.Worksheets("Tm5_Tasks").Activate
    Set rng = RngGetCurRegionRange(Range("A1"), row:=2)
    idBest = 1  ' set best to id = 1 since attrativeness = 0
    For id = 1 To RngGetRows(rng)  ' looping through all rows
        If rng(id, 5) <> 1 Then     ' id is not started
            ' check if id can start:
            idB = rng(id, 3)    ' most start before idB
            If rng(idB, 5) = 1 Then ' check that idB has started => id can start
                If rng(id, 4) > rng(idBest, 4) Then ' check if id is better
                    idBest = id
                End If
            End If
        End If
    Next
    rng(idBest, 5) = 1
    MsgBox ("Best next task is " & idBest)
End Sub




'''' Exercise - Seat reservation (see the template file for this exercise)
