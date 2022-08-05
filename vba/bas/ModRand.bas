Attribute VB_Name = "ModRand"
''' Course procedures related to random number generation
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
Function RandInvNormal(dblMean As Double, dblSD As Double) As Double
    RandInvNormal = Application.WorksheetFunction.NormInv(Rnd, dblMean, dblSD)
End Function


'' Generate random numbers from a continuous uniform distribution
'
' @param intSize Random numbers generated
' @param dblMin Minimum number.
' @param dblMax Maximum number (not included).
' @param ary Array to store the values in.
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
Function RandInvUniformCont(dblMin As Double, dblMax As Double) As Double
    Randomize
    RandInvUniformCont = dblMin + (dblMax - dblMin) * Rnd()
End Function


'' Generate random numbers from a discrete uniform distribution
'
' @param intSize Random numbers generated
' @param dblMin Minimum number.
' @param dblMax Maximum number.
' @param ary Array to store the values in.
Sub RandGenUniformDisc(intSize As Integer, dblMin As Double, dblMax As Double, ary() As Double)
    Dim i As Integer
    ReDim ary(intSize) As Double
    
    For i = 1 To intSize
        ary(i) = WorksheetFunction.RandBetween(dblMin, dblMax)
    Next
End Sub


'' Generate a random number from a discrete uniform distribution
'
' @param dblMin Minimum number.
' @param dblMax Maximum number.
Function RandInvUniformDisc(dblMin As Double, dblMax As Double) As Double
    RandInvUniformDisc = WorksheetFunction.RandBetween(dblMin, dblMax)
End Function


'' Generate random numbers from a binomial distribution
'
' @param intSize Random numbers generated
' @param intTrials Number of trials.
' @param dblPr Probability of success.
' @param ary Array to store the values in.
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
Function RandInvBinomial(intTrials As Integer, dblPr As Double) As Double
    RandInvBinomial = Application.WorksheetFunction.Binom_Inv(intTrials, dblPr, Rnd())
End Function


'' Generate random numbers from a poisson distribution
'
' @param intSize Random numbers generated
' @param dblLambda Mean.
' @param ary Array to store the values in.
Sub RandGenPoisson(intSize As Integer, dblLambda As Double, ary() As Double)
    Dim i As Integer
    ReDim ary(intSize) As Double
    
    For i = 1 To intSize
        ary(i) = RandInvPoisson(dblLambda)
    Next
End Sub


'' Generate a random number from a Poisson distribution
'
' @param dblMean Mean.
Function RandInvPoisson(dblLambda As Double) As Long  'Algorithm by Knuth
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

'' Generate a random number from a custom discrete distribution
'
' @param intSize Random numbers generated
' @param dblDens The probability density. First column contains the outcome and the second the probability.
' @param ary Array to store the values in.
Sub RandGenDiscrete(intSize As Integer, dblDens() As Double, ary() As Double)
    Dim i As Integer
    ReDim ary(intSize) As Double
    
    For i = 1 To intSize
        ary(i) = RandInvDiscrete(dblDens)
    Next
End Sub


'' Generate a random number from a custom discrete distribution
'
' @param ary The probability density. First column contains the outcome and the second the probability.
' @note Assume that the second column in ary sums to one.
Function RandInvDiscrete(ary() As Double) As Double
    Dim dblR As Double, dblP As Double
    Dim i As Long
    
    dblR = Rnd()
    dblP = 0
    For i = LBound(ary, 1) To UBound(ary, 1)
        dblP = dblP + ary(i, 2)
        If dblR < dblP Then
            RandInvDiscrete = ary(i, 1)
            Exit Function
        End If
    Next
    RandInvDiscrete = ary(i, 1)
End Function



