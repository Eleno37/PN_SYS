Imports System.Data
Imports GemBox.Spreadsheet
Imports System
Imports Microsoft.Office.Interop
Imports DocumentFormat.OpenXml.Office

Module md_export_excel

    Sub export_excel(ByVal file_name As String, dt As DataTable)

        ' If you are using the Professional version, enter your serial key below.
        SpreadsheetInfo.SetLicense("FREE-LIMITED-KEY")

        Dim workbook = New ExcelFile
        Dim worksheet = workbook.Worksheets.Add("DataTable to Sheet")


        worksheet.Cells(0, 0).Value = "DataTable insert example:"

        ' Insert DataTable to an Excel worksheet.
        worksheet.InsertDataTable(dt,
            New InsertDataTableOptions() With
            {
                .ColumnHeaders = True,
                .StartRow = 2
            })

        workbook.Save("D:/output/" & file_name & ".xlsx")

        open_excel(file_name)
    End Sub

    Private Sub open_excel(ByVal file_name As String)
        Dim oxl As Excel.Application
        Dim owbs As Excel.Workbooks
        Dim owb As Excel.Workbook
        Dim osheets As Excel.Worksheets
        Dim osheet As Excel.Worksheet

        'Sub Main(args As String())
        oxl = CreateObject("Excel.Application")
        'oxl.DisplayAlerts = True
        oxl.Visible = True
        owb = oxl.Workbooks.Open("D:/output/" & file_name & ".xlsx")
        'End Sub
    End Sub
End Module
