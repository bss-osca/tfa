Attribute VB_Name = "ModRand"
'''' Course procedures related to random number generation
' May be used "as is" during the course and the exam.
' All procedures start with Gen so you can use auto complete to find them easy.
' See the documentation for each procedure for further info.
' If you want to use the procedure in another Excel file, then copy the whole module.
' @author Lars Relund <lars@relund.dk>

Option Explicit
Option Base 1


'' Generate random numbers from a normal distribution
'
' @param intSize Random numbers generated
' @param dblMean Mean.
' @param dblSD Standard deviation.
' @param ary Array to store the values in.
' @example
'    Dim ary() As Double
'    Dim aryDens() As Double
'    Dim intSize As Integer
'
'    ThisWorkbook.Worksheets("TM6").Activate
'    Randomize    ' initialize random-number generator
'    intSize = 20 ' generate 20 numbers for each distribution
'    ' Normal
'    Call RandGenNormal(intSize, 100, 20, ary)
'    Range("A1") = "Normal"
'    Call AryPaste(ary, Range("A2"), False)
'    ' Cont. uniform [10,500[
'    Call RandGenUniformCont(intSize, 10, 500, ary)
'    Range("B1") = "Uniform"
'    Call AryPaste(ary, Range("B2"), False)
'    ' Discrete uniform 10,...,500
'    Call RandGenUniformDisc(intSize, 10, 500, ary)
'    Range("B1") = "Uniform"
'    Call AryPaste(ary, Range("B2"), False)
'    ' Binomial 100 trials, pr = 0.2
'    Call RandGenBinomial(intSize, 100, 0.2, ary)
'    Range("C1") = "Binomial"
'    Call AryPaste(ary, Range("C2"), False)
'    ' Poisson lambda = 5
'    Call RandGenPoisson(intSize, 5, ary)
'    Range("D1") = "Poisson"
'    Call AryPaste(ary, Range("D2"), False)
'    ' Custom discrete
'    ReDim aryDens(1 To 4, 1 To 2)
'    aryDens(1, 1) = 3
'    aryDens(2, 1) = 4
'    aryDens(3, 1) = 5
'    aryDens(4, 1) = 6
'    aryDens(1, 2) = 0.1
'    aryDens(2, 2) = 0.3
'    aryDens(3, 2) = 0.5
'    aryDens(4, 2) = 0.1
'    Call RandGenDiscrete(intSize, aryDens, ary)
'    Range("E1") = "Custom"
'    Call AryPaste(ary, Range("E2"), False)
'    Range("G3") = "Custom distribution:"
'    Range("G4") = "Value"
'    Range("H4") = "Prob."
'    Call AryPaste(aryDens, Range("G5"))
Sub RandGenNormal(intSize As Integer, dblMean As Double, dblSD As Double, ary() As Double)
    Dim i As Integer
    ReDim ary(intSize) As Double
    
    For i = 1 To intSize
        ary(i) = Application.WorksheetFunction.NormInv(Rnd, dblMean, dblSD)
    Next
End Sub


'' Generate a random number from a normal distribution
'
' @param dblMean Mean.
' @param dblSD Standard deviation.
' @example
'    MsgBox ("Normal: " & RandInvNormal(100, 20))
Function RandInvNormal(dblMean As Double, dblSD As Double) As Double
    RandInvNormal = Application.WorksheetFunction.NormInv(Rnd, dblMean, dblSD)
End Function


'' Generate random numbers from a continuous uniform distribution
'
' @param intSize Random numbers generated
' @param dblMin Minimum number.
' @param dblMax Maximum number (not included).
' @param ary Array to store the values in.
' @example
'    Dim ary() As Double
'    Dim aryDens() As Double
'    Dim intSize As Integer
'
'    ThisWorkbook.Worksheets("TM6").Activate
'    Randomize    ' initialize random-number generator
'    intSize = 20 ' generate 20 numbers for each distribution
'    ' Normal
'    Call RandGenNormal(intSize, 100, 20, ary)
'    Range("A1") = "Normal"
'    Call AryPaste(ary, Range("A2"), False)
'    ' Cont. uniform [10,500[
'    Call RandGenUniformCont(intSize, 10, 500, ary)
'    Range("B1") = "Uniform"
'    Call AryPaste(ary, Range("B2"), False)
'    ' Discrete uniform 10,...,500
'    Call RandGenUniformDisc(intSize, 10, 500, ary)
'    Range("B1") = "Uniform"
'    Call AryPaste(ary, Range("B2"), False)
'    ' Binomial 100 trials, pr = 0.2
'    Call RandGenBinomial(intSize, 100, 0.2, ary)
'    Range("C1") = "Binomial"
'    Call AryPaste(ary, Range("C2"), False)
'    ' Poisson lambda = 5
'    Call RandGenPoisson(intSize, 5, ary)
'    Range("D1") = "Poisson"
'    Call AryPaste(ary, Range("D2"), False)
'    ' Custom discrete
'    ReDim aryDens(1 To 4, 1 To 2)
'    aryDens(1, 1) = 3
'    aryDens(2, 1) = 4
'    aryDens(3, 1) = 5
'    aryDens(4, 1) = 6
'    aryDens(1, 2) = 0.1
'    aryDens(2, 2) = 0.3
'    aryDens(3, 2) = 0.5
'    aryDens(4, 2) = 0.1
'    Call RandGenDiscrete(intSize, aryDens, ary)
'    Range("E1") = "Custom"
'    Call AryPaste(ary, Range("E2"), False)
'    Range("G3") = "Custom distribution:"
'    Range("G4") = "Value"
'    Range("H4") = "Prob."
'    Call AryPaste(aryDens, Range("G5"))
Sub RandGenUniformCont(intSize As Integer, dblMin As Double, dblMax As Double, ary() As Double)
    Dim i As Integer
    ReDim ary(intSize) As Double
    
    For i = 1 To intSize
        ary(i) = dblMin + (dblMax - dblMin) * Rnd()
    Next
End Sub


'' Generate a random number from a continuous uniform distribution
'
' @param dblMin Minimum number.
' @param dblMax Maximum number (not included).
' @example
'    ' Cont. uniform [10,500[
'    MsgBox ("Uniform (continuous): " & RandInvUniformCont(10, 500))
Function RandInvUniformCont(dblMin As Double, dblMax As Double) As Double
    RandInvUniformCont = dblMin + (dblMax - dblMin) * Rnd()
End Function


'' Generate random numbers from a discrete uniform distribution
'
' @param intSize Random numbers generated
' @param vntMin Minimum number.
' @param vntMax Maximum number.
' @param ary Array to store the values in.
' @example
'    Dim ary() As Double
'    Dim aryDens() As Double
'    Dim intSize As Integer
'
'    ThisWorkbook.Worksheets("TM6").Activate
'    Randomize    ' initialize random-number generator
'    intSize = 20 ' generate 20 numbers for each distribution
'    ' Normal
'    Call RandGenNormal(intSize, 100, 20, ary)
'    Range("A1") = "Normal"
'    Call AryPaste(ary, Range("A2"), False)
'    ' Cont. uniform [10,500[
'    Call RandGenUniformCont(intSize, 10, 500, ary)
'    Range("B1") = "Uniform"
'    Call AryPaste(ary, Range("B2"), False)
'    ' Discrete uniform 10,...,500
'    Call RandGenUniformDisc(intSize, 10, 500, ary)
'    Range("B1") = "Uniform"
'    Call AryPaste(ary, Range("B2"), False)
'    ' Binomial 100 trials, pr = 0.2
'    Call RandGenBinomial(intSize, 100, 0.2, ary)
'    Range("C1") = "Binomial"
'    Call AryPaste(ary, Range("C2"), False)
'    ' Poisson lambda = 5
'    Call RandGenPoisson(intSize, 5, ary)
'    Range("D1") = "Poisson"
'    Call AryPaste(ary, Range("D2"), False)
'    ' Custom discrete
'    ReDim aryDens(1 To 4, 1 To 2)
'    aryDens(1, 1) = 3
'    aryDens(2, 1) = 4
'    aryDens(3, 1) = 5
'    aryDens(4, 1) = 6
'    aryDens(1, 2) = 0.1
'    aryDens(2, 2) = 0.3
'    aryDens(3, 2) = 0.5
'    aryDens(4, 2) = 0.1
'    Call RandGenDiscrete(intSize, aryDens, ary)
'    Range("E1") = "Custom"
'    Call AryPaste(ary, Range("E2"), False)
'    Range("G3") = "Custom distribution:"
'    Range("G4") = "Value"
'    Range("H4") = "Prob."
'    Call AryPaste(aryDens, Range("G5"))
Sub RandGenUniformDisc(intSize As Integer, vntMin As Variant, vntMax As Variant, ary As Variant)
    Dim i As Integer
    ReDim ary(intSize) As Double
    
    For i = 1 To intSize
        ary(i) = WorksheetFunction.RandBetween(vntMin, vntMax)
    Next
End Sub



'' Generate a random number from a discrete uniform distribution
'
' @param vntMin Minimum number.
' @param vntMax Maximum number.
' @example
'    ' Discrete uniform 10,...,500
'    MsgBox ("Uniform (discrete): " & RandInvUniformDisc(10, 500))
Function RandInvUniformDisc(vntMin As Variant, vntMax As Variant) As Variant
    RandInvUniformDisc = WorksheetFunction.RandBetween(vntMin, vntMax)
End Function


'' Generate random numbers from a binomial distribution
'
' @param intSize Random numbers generated
' @param intTrials Number of trials.
' @param dblPr Probability of success.
' @param ary Array to store the values in.
' @example
'    Dim ary() As Double
'    Dim aryDens() As Double
'    Dim intSize As Integer
'
'    ThisWorkbook.Worksheets("TM6").Activate
'    Randomize    ' initialize random-number generator
'    intSize = 20 ' generate 20 numbers for each distribution
'    ' Normal
'    Call RandGenNormal(intSize, 100, 20, ary)
'    Range("A1") = "Normal"
'    Call AryPaste(ary, Range("A2"), False)
'    ' Cont. uniform [10,500[
'    Call RandGenUniformCont(intSize, 10, 500, ary)
'    Range("B1") = "Uniform"
'    Call AryPaste(ary, Range("B2"), False)
'    ' Discrete uniform 10,...,500
'    Call RandGenUniformDisc(intSize, 10, 500, ary)
'    Range("B1") = "Uniform"
'    Call AryPaste(ary, Range("B2"), False)
'    ' Binomial 100 trials, pr = 0.2
'    Call RandGenBinomial(intSize, 100, 0.2, ary)
'    Range("C1") = "Binomial"
'    Call AryPaste(ary, Range("C2"), False)
'    ' Poisson lambda = 5
'    Call RandGenPoisson(intSize, 5, ary)
'    Range("D1") = "Poisson"
'    Call AryPaste(ary, Range("D2"), False)
'    ' Custom discrete
'    ReDim aryDens(1 To 4, 1 To 2)
'    aryDens(1, 1) = 3
'    aryDens(2, 1) = 4
'    aryDens(3, 1) = 5
'    aryDens(4, 1) = 6
'    aryDens(1, 2) = 0.1
'    aryDens(2, 2) = 0.3
'    aryDens(3, 2) = 0.5
'    aryDens(4, 2) = 0.1
'    Call RandGenDiscrete(intSize, aryDens, ary)
'    Range("E1") = "Custom"
'    Call AryPaste(ary, Range("E2"), False)
'    Range("G3") = "Custom distribution:"
'    Range("G4") = "Value"
'    Range("H4") = "Prob."
'    Call AryPaste(aryDens, Range("G5"))
Sub RandGenBinomial(intSize As Integer, intTrials As Integer, dblPr As Double, ary() As Double)
    Dim i As Integer
    ReDim ary(intSize) As Double
    
    For i = 1 To intSize
        ary(i) = Application.WorksheetFunction.Binom_Inv(intTrials, dblPr, Rnd())
    Next
End Sub


'' Generate a random number from a binomial distribution
'
' @param intTrials Number of trials.
' @param dblPr Probability of success.
' @example
'    ' Binomial 100 trials, pr = 0.2
'    MsgBox ("Binomial: " & RandInvBinomial(100, 0.2))
Function RandInvBinomial(intTrials As Integer, dblPr As Double) As Double
    RandInvBinomial = Application.WorksheetFunction.Binom_Inv(intTrials, dblPr, Rnd())
End Function


'' Generate random numbers from a poisson distribution
'
' @param intSize Random numbers generated
' @param dblLambda Mean.
' @param ary Array to store the values in.
' @note Algorithm suggested by D. Knuth.
' @example
'    Dim ary() As Double
'    Dim aryDens() As Double
'    Dim intSize As Integer
'
'    ThisWorkbook.Worksheets("TM6").Activate
'    Randomize    ' initialize random-number generator
'    intSize = 20 ' generate 20 numbers for each distribution
'    ' Normal
'    Call RandGenNormal(intSize, 100, 20, ary)
'    Range("A1") = "Normal"
'    Call AryPaste(ary, Range("A2"), False)
'    ' Cont. uniform [10,500[
'    Call RandGenUniformCont(intSize, 10, 500, ary)
'    Range("B1") = "Uniform"
'    Call AryPaste(ary, Range("B2"), False)
'    ' Discrete uniform 10,...,500
'    Call RandGenUniformDisc(intSize, 10, 500, ary)
'    Range("B1") = "Uniform"
'    Call AryPaste(ary, Range("B2"), False)
'    ' Binomial 100 trials, pr = 0.2
'    Call RandGenBinomial(intSize, 100, 0.2, ary)
'    Range("C1") = "Binomial"
'    Call AryPaste(ary, Range("C2"), False)
'    ' Poisson lambda = 5
'    Call RandGenPoisson(intSize, 5, ary)
'    Range("D1") = "Poisson"
'    Call AryPaste(ary, Range("D2"), False)
'    ' Custom discrete
'    ReDim aryDens(1 To 4, 1 To 2)
'    aryDens(1, 1) = 3
'    aryDens(2, 1) = 4
'    aryDens(3, 1) = 5
'    aryDens(4, 1) = 6
'    aryDens(1, 2) = 0.1
'    aryDens(2, 2) = 0.3
'    aryDens(3, 2) = 0.5
'    aryDens(4, 2) = 0.1
'    Call RandGenDiscrete(intSize, aryDens, ary)
'    Range("E1") = "Custom"
'    Call AryPaste(ary, Range("E2"), False)
'    Range("G3") = "Custom distribution:"
'    Range("G4") = "Value"
'    Range("H4") = "Prob."
'    Call AryPaste(aryDens, Range("G5"))
Sub RandGenPoisson(intSize As Integer, dblLambda As Double, ary() As Double)
    Dim i As Integer
    ReDim ary(intSize) As Double
    
    For i = 1 To intSize
        ary(i) = RandInvPoisson(dblLambda)
    Next
End Sub


'' Generate a random number from a Poisson distribution
'
' @param dblLambda Mean.
' @note Algorithm suggested by D. Knuth.
' @example
'    ' Poisson lambda = 5
'    MsgBox ("Poisson: " & RandInvPoisson(5))
Function RandInvPoisson(dblLambda As Double) As Long
    Dim dblL As Double, dblP As Double
    Dim k As Long
    
    dblL = Exp(-dblLambda)
    k = 0
    dblP = 1
    Do
         k = k + 1
         dblP = dblP * Rnd()
    Loop While dblP > dblL
    RandInvPoisson = k - 1
End Function

'' Generate random numbers from a custom discrete distribution
'
' @param intSize Random numbers generated
' @param dblDens The probability density. First column contains the outcome and the second the probability.
' @param ary Array to store the values in.
' @note Assume that the second column in aryDens sums to one.
' @example
'    Dim ary() As Double
'    Dim aryDens() As Double
'    Dim intSize As Integer
'
'    ThisWorkbook.Worksheets("TM6").Activate
'    Randomize    ' initialize random-number generator
'    intSize = 20 ' generate 20 numbers for each distribution
'    ' Normal
'    Call RandGenNormal(intSize, 100, 20, ary)
'    Range("A1") = "Normal"
'    Call AryPaste(ary, Range("A2"), False)
'    ' Cont. uniform [10,500[
'    Call RandGenUniformCont(intSize, 10, 500, ary)
'    Range("B1") = "Uniform"
'    Call AryPaste(ary, Range("B2"), False)
'    ' Discrete uniform 10,...,500
'    Call RandGenUniformDisc(intSize, 10, 500, ary)
'    Range("B1") = "Uniform"
'    Call AryPaste(ary, Range("B2"), False)
'    ' Binomial 100 trials, pr = 0.2
'    Call RandGenBinomial(intSize, 100, 0.2, ary)
'    Range("C1") = "Binomial"
'    Call AryPaste(ary, Range("C2"), False)
'    ' Poisson lambda = 5
'    Call RandGenPoisson(intSize, 5, ary)
'    Range("D1") = "Poisson"
'    Call AryPaste(ary, Range("D2"), False)
'    ' Custom discrete
'    ReDim aryDens(1 To 4, 1 To 2)
'    aryDens(1, 1) = 3
'    aryDens(2, 1) = 4
'    aryDens(3, 1) = 5
'    aryDens(4, 1) = 6
'    aryDens(1, 2) = 0.1
'    aryDens(2, 2) = 0.3
'    aryDens(3, 2) = 0.5
'    aryDens(4, 2) = 0.1
'    Call RandGenDiscrete(intSize, aryDens, ary)
'    Range("E1") = "Custom"
'    Call AryPaste(ary, Range("E2"), False)
'    Range("G3") = "Custom distribution:"
'    Range("G4") = "Value"
'    Range("H4") = "Prob."
'    Call AryPaste(aryDens, Range("G5"))
Sub RandGenDiscrete(intSize As Integer, dblDens As Variant, ary As Variant)
    Dim i As Integer
    ReDim ary(intSize)
    
    For i = 1 To intSize
        ary(i) = RandInvDiscrete(dblDens)
    Next
End Sub


'' Generate a random number from a custom discrete distribution
'
' @param aryDens The probability density. First column contains the outcome and the second the probability.
' @note Assume that the second column in aryDens sums to one.
' @example
'    Dim aryDens() As Double
'    ' Custom discrete
'    ReDim aryDens(1 To 4, 1 To 2)
'    aryDens(1, 1) = 3
'    aryDens(2, 1) = 4
'    aryDens(3, 1) = 5
'    aryDens(4, 1) = 6
'    aryDens(1, 2) = 0.1
'    aryDens(2, 2) = 0.3
'    aryDens(3, 2) = 0.5
'    aryDens(4, 2) = 0.1
'    MsgBox ("Custom (discrete): " & RandInvDiscrete(aryDens))
Function RandInvDiscrete(aryDens As Variant) As Variant
    Dim dblR As Double, dblP As Double
    Dim i As Long
    
    dblR = Rnd()
    dblP = 0
    For i = LBound(aryDens, 1) To UBound(aryDens, 1)
        dblP = dblP + aryDens(i, 2)
        If dblR < dblP Then
            RandInvDiscrete = aryDens(i, 1)
            Exit Function
        End If
    Next
    RandInvDiscrete = aryDens(i, 1)
End Function




