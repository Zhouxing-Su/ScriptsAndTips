Attribute VB_Name = "ExportAllPages"
Sub ExportAllPagesToHighResolutionPng()

    Application.Settings.SetRasterExportResolution visRasterUsePrinterResolution, 600#, 600#, visRasterPixelsPerInch
    Application.Settings.SetRasterExportSize visRasterFitToSourceSize, 10.666667, 7.739583, visRasterInch
    Application.Settings.RasterExportDataFormat = visRasterInterlace
    Application.Settings.RasterExportColorFormat = visRaster24Bit
    Application.Settings.RasterExportRotation = visRasterNoRotation
    Application.Settings.RasterExportFlip = visRasterNoFlip
    Application.Settings.RasterExportBackgroundColor = 16777215
    Application.Settings.RasterExportTransparencyColor = 16777215
    Application.Settings.RasterExportUseTransparencyColor = False
    
    Dim page As page
    For Each page In ThisDocument.Pages
        page.Export (ThisDocument.Path & page.Name & ".png")
    Next
    
End Sub
