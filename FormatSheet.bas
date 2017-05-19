Attribute VB_Name = "FormatSheet"

Sub FormatTheSheet()
    Dim c1 As Integer
    Dim c2 As Integer
    c1 = 3
    c2 = 10
    
    Call ConditionalFormat(c1, c2)
    Call SortConfig(c1, c2)
    Call SetGeneralFormat(c1, c2)
End Sub

Sub ConditionalFormat(ByVal c1 As Integer, ByVal c2 As Integer)
    Cells.FormatConditions.Delete
    
    Dim r1 As Integer
    Dim r2 As Integer
    
    r1 = 5
    r2 = 15
    Call ConditionalFormatByLine(r1, r2, c1, c2)
    
    r1 = 23
    r2 = 33
    Call ConditionalFormatByLine(r1, r2, c1, c2)
End Sub

Sub ConditionalFormatByLine(ByVal r1 As Integer, ByVal r2 As Integer, ByVal c1 As Integer, ByVal c2 As Integer)
    Dim r As Integer
    For r = r1 To r2
        Range(Cells(r, c1), Cells(r, c2)).Select
        Selection.FormatConditions.AddTop10
        Selection.FormatConditions(Selection.FormatConditions.Count).SetFirstPriority
        With Selection.FormatConditions(1)
            .TopBottom = xlTop10Bottom
            .Rank = 3
            .Percent = False
        End With
        With Selection.FormatConditions(1).Font
            .Color = -16776961
            .TintAndShade = 0
        End With
        Selection.FormatConditions(1).StopIfTrue = False
        Range(Cells(r, c1), Cells(r, c2)).Select
        Selection.FormatConditions.AddTop10
        Selection.FormatConditions(Selection.FormatConditions.Count).SetFirstPriority
        With Selection.FormatConditions(1)
            .TopBottom = xlTop10Bottom
            .Rank = 2
            .Percent = False
        End With
        With Selection.FormatConditions(1).Font
            .Underline = xlUnderlineStyleSingle
            .TintAndShade = 0
        End With
        Selection.FormatConditions(1).StopIfTrue = False
        Range(Cells(r, c1), Cells(r, c2)).Select
        Selection.FormatConditions.AddTop10
        Selection.FormatConditions(Selection.FormatConditions.Count).SetFirstPriority
        With Selection.FormatConditions(1)
            .TopBottom = xlTop10Bottom
            .Rank = 1
            .Percent = False
        End With
        With Selection.FormatConditions(1).Font
            .Bold = True
            .Italic = False
            .TintAndShade = 0
        End With
        Selection.FormatConditions(1).StopIfTrue = False
    Next r
End Sub

Sub SetGeneralFormat(ByVal c1 As Integer, ByVal c2 As Integer)
    Cells.Select
    Selection.RowHeight = 16
    Selection.Columns.AutoFit
    With Selection
        .HorizontalAlignment = xlCenter
        .VerticalAlignment = xlCenter
        .WrapText = False
        .Orientation = 0
        .AddIndent = False
        .IndentLevel = 0
        .ShrinkToFit = False
        .ReadingOrder = xlContext
        .MergeCells = False
    End With
    
    Dim r1 As Integer
    Dim r2 As Integer
    
    r1 = 1
    r2 = 15
    Call AddLineBox(r1, r2, c1, c2)
    
    r1 = 19
    r2 = 33
    Call AddLineBox(r1, r2, c1, c2)
    
    Cells(1, 1).Select
End Sub

Sub AddLineBox(ByVal r1 As Integer, ByVal r2 As Integer, ByVal c1 As Integer, ByVal c2 As Integer)
    Range(Cells(r1, c1), Cells(r2, c2)).Select
    Selection.Borders(xlDiagonalDown).LineStyle = xlNone
    Selection.Borders(xlDiagonalUp).LineStyle = xlNone
    With Selection.Borders(xlEdgeLeft)
        .LineStyle = xlContinuous
        .ColorIndex = 0
        .TintAndShade = 0
        .Weight = xlThin
    End With
    With Selection.Borders(xlEdgeTop)
        .LineStyle = xlContinuous
        .ColorIndex = 0
        .TintAndShade = 0
        .Weight = xlThin
    End With
    With Selection.Borders(xlEdgeBottom)
        .LineStyle = xlContinuous
        .ColorIndex = 0
        .TintAndShade = 0
        .Weight = xlThin
    End With
    With Selection.Borders(xlEdgeRight)
        .LineStyle = xlContinuous
        .ColorIndex = 0
        .TintAndShade = 0
        .Weight = xlThin
    End With
    With Selection.Borders(xlInsideVertical)
        .LineStyle = xlContinuous
        .ColorIndex = 0
        .TintAndShade = 0
        .Weight = xlThin
    End With
End Sub

Sub SortConfig(ByVal c1 As Integer, ByVal c2 As Integer)
    Dim r1 As Integer
    Dim r2 As Integer
    Dim rKey As Integer
    
    r1 = 1
    r2 = 15
    rKey = 4
    Call SortConfigByAllInstAverage(r1, r2, c1, c2, rKey)
    
    r1 = 19
    r2 = 33
    rKey = 22
    Call SortConfigByAllInstAverage(r1, r2, c1, c2, rKey)
End Sub

Sub SortConfigByAllInstAverage(ByVal r1 As Integer, ByVal r2 As Integer, ByVal c1 As Integer, ByVal c2 As Integer, ByVal rKey As Integer)
    ActiveWorkbook.Worksheets("ConfigRank").Sort.SortFields.Clear
    ActiveWorkbook.Worksheets("ConfigRank").Sort.SortFields.Add Key:=Range(Cells(rKey, c1), Cells(rKey, c2)), SortOn:=xlSortOnValues, Order:=xlAscending, DataOption:=xlSortNormal
    With ActiveWorkbook.Worksheets("ConfigRank").Sort
        .SetRange Range(Cells(r1, c1), Cells(r2, c2))
        .Header = xlGuess
        .MatchCase = False
        .Orientation = xlLeftToRight
        .SortMethod = xlPinYin
        .Apply
    End With
End Sub
