Sub GroupByTask()

    Dim orderedByDateRange As Range
    Set orderedByDateRange = Columns(1).Resize(, 3)
    
    Dim groupedByTaskRange As Range
    Set groupedByTaskRange = Columns(6).Resize(, 3)

    orderedByDateRange.Copy Destination:=groupedByTaskRange
    
    Columns(6).Resize(, 3).Sort Header:=xlYes, _
        Key1:=Columns(7), Order1:=xlAscending, DataOption1:=xlSortNormal, _
        Key2:=Columns(6), Order2:=xlAscending, DataOption2:=xlSortNormal
    
End Sub
