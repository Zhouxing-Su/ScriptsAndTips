' http://www.excel-easy.com/vba/examples/import-sheets.html
' https://trumpexcel.com/combine-multiple-workbooks-one-excel-workbooks/
' https://stackoverflow.com/questions/579797/open-excel-file-for-reading-with-vba-without-display
Sub ConsolidateWorkbooks()
    Application.ScreenUpdating = False
    Call AppendWorkbook("D:\workspace\cpp\InventoryRoutingProblem\Deploy\Doc\7 Analysis\", "2.16.CorrelationBetweenObjAndCost.xlsx", "2.16")
    Call AppendWorkbook("D:\workspace\cpp\InventoryRoutingProblem\Deploy\Doc\7 Analysis\", "2.18.CorrelationBetweenObjAndCost.xlsx", "2.18")
    Call AppendWorkbook("D:\workspace\cpp\InventoryRoutingProblem\Deploy\Doc\7 Analysis\", "2.20.CorrelationBetweenObjAndCost.xlsx", "2.20")
    Call AppendWorkbook("D:\workspace\cpp\InventoryRoutingProblem\Deploy\Doc\7 Analysis\", "2.26.CorrelationBetweenObjAndCost.xlsx", "2.26")
    Application.ScreenUpdating = True

    ThisWorkbook.Worksheets(1).Activate
End Sub

Sub AppendWorkbook(fileDir As String, filename As String, sheetNamePrefix As String)
    Dim sheet As Worksheet
    
    Workbooks.Open Filename:=fileDir & filename, ReadOnly:=True
    ActiveWindow.Visible = False
    For Each sheet In Workbooks(filename).Sheets
        sheet.Copy After:=ThisWorkbook.Sheets(ThisWorkbook.Sheets.Count)
        ActiveSheet.Name = sheetNamePrefix '& sheet.Name
    Next sheet
    Workbooks(filename).Close False
End Sub
