Sub ExtractNonBlankLines()

    Dim cnt As Long, i As Long, j As Long
    
    cnt = Worksheets("log").UsedRange.Rows.Count
    j = 1
    For i = 1 To cnt
        If Worksheets("log").Cells(i, 15).Value <> "" Then
            Worksheets("result").Range(Worksheets("result").Cells(j, 1), Worksheets("result").Cells(j, 5)).Value = _
                Worksheets("log").Range(Worksheets("log").Cells(i, 15), Worksheets("log").Cells(i, 19)).Value
            j = j + 1
        End If
    Next i
    
End Sub
