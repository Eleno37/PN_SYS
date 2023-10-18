Public Class clsToExcel
    Public Function TableToExcel(_SheetName As String, _data As DataTable) As Boolean

        Dim dataarray(_data.Rows.Count + 1, _data.Columns.Count - 1) As String
        For i = 0 To _data.Columns.Count - 1
            dataarray(0, i) = _data.Columns(i).ColumnName
        Next
        For iR = 0 To _data.Rows.Count - 1
            For iH = 0 To _data.Columns.Count - 1
                dataarray(iR + 1, iH) = IIf(IsDBNull(_data.Rows(iR).Item(iH)), "", _data.Rows(iR).Item(iH))
            Next
        Next

        TableToExcel = False
        Dim ex As Object
        ex = CreateObject("Excel.Application")
        ex.Workbooks.Add()
        CType(ex.Workbooks(1).Worksheets("Sheet1"), Microsoft.Office.Interop.Excel.Worksheet).Name = _SheetName
        With ex
            .Range("A1").Resize(_data.Rows.Count + 2, _data.Columns.Count).Value = dataarray
            .Rows("1:1").Font.FontStyle = "Bold"
            .Rows("1:1").Font.Size = 10
            .Cells.Columns.AutoFit()
            .Cells.Select()
            .Cells.EntireColumn.AutoFit()
            .Cells(1, 1).Select()
        End With

        ex.visible = True
        Return True
    End Function

    Public Function Table2ToExcel(_SheetName As String, _data As DataTable, _SheetName1 As String, _data1 As DataTable) As Boolean

        Dim dataarray(_data.Rows.Count + 1, _data.Columns.Count - 1) As String
        For i = 0 To _data.Columns.Count - 1
            dataarray(0, i) = _data.Columns(i).ColumnName
        Next
        For iR = 0 To _data.Rows.Count - 1
            For iH = 0 To _data.Columns.Count - 1
                dataarray(iR + 1, iH) = IIf(IsDBNull(_data.Rows(iR).Item(iH)), "", _data.Rows(iR).Item(iH))
            Next
        Next


        Dim dataarray1(_data1.Rows.Count + 1, _data1.Columns.Count - 1) As String
        For i = 0 To _data1.Columns.Count - 1
            dataarray1(0, i) = _data1.Columns(i).ColumnName
        Next
        For iR = 0 To _data1.Rows.Count - 1
            For iH = 0 To _data1.Columns.Count - 1
                dataarray1(iR + 1, iH) = IIf(IsDBNull(_data1.Rows(iR).Item(iH)), "", _data1.Rows(iR).Item(iH))
            Next
        Next

        Table2ToExcel = False
        Dim ex As Object
        ex = CreateObject("Excel.Application")
        ex.Workbooks.Add()
        CType(ex.Workbooks(1).Worksheets("Sheet1"), Microsoft.Office.Interop.Excel.Worksheet).Name = _SheetName
        With ex
            .Range("A1").Resize(_data.Rows.Count + 1, _data.Columns.Count).Value = dataarray
            .Rows("1:1").Font.FontStyle = "Bold"
            .Rows("1:1").Font.Size = 10
            .Cells.Columns.AutoFit()
            .Cells.Select()
            .Cells.EntireColumn.AutoFit()
            .Cells(1, 1).Select()
        End With

        ex.Worksheets.Add()
        CType(ex.Workbooks(1).Worksheets("Sheet2"), Microsoft.Office.Interop.Excel.Worksheet).Name = _SheetName1
        With ex
            .Range("A1").Resize(_data1.Rows.Count + 1, _data1.Columns.Count).Value = dataarray1
            .Rows("1:1").Font.FontStyle = "Bold"
            .Rows("1:1").Font.Size = 10
            .Cells.Columns.AutoFit()
            .Cells.Select()
            .Cells.EntireColumn.AutoFit()
            .Cells(1, 1).Select()
        End With

        ex.visible = True
        Return True
    End Function


    Public Function Table3ToExcel(_SheetName As String, _data As DataTable, _SheetName1 As String, _data1 As DataTable, _SheetName2 As String, _data2 As DataTable) As Boolean

        Dim dataarray(_data.Rows.Count + 1, _data.Columns.Count - 1) As String
        For i = 0 To _data.Columns.Count - 1
            dataarray(0, i) = _data.Columns(i).ColumnName
        Next
        For iR = 0 To _data.Rows.Count - 1
            For iH = 0 To _data.Columns.Count - 1
                dataarray(iR + 1, iH) = IIf(IsDBNull(_data.Rows(iR).Item(iH)), "", _data.Rows(iR).Item(iH))
            Next
        Next


        Dim dataarray1(_data1.Rows.Count + 1, _data1.Columns.Count - 1) As String
        For i = 0 To _data1.Columns.Count - 1
            dataarray1(0, i) = _data1.Columns(i).ColumnName
        Next
        For iR = 0 To _data1.Rows.Count - 1
            For iH = 0 To _data1.Columns.Count - 1
                dataarray1(iR + 1, iH) = IIf(IsDBNull(_data1.Rows(iR).Item(iH)), "", _data1.Rows(iR).Item(iH))
            Next
        Next


        Dim dataarray2(_data2.Rows.Count + 1, _data2.Columns.Count - 1) As String
        For i = 0 To _data2.Columns.Count - 1
            dataarray2(0, i) = _data2.Columns(i).ColumnName
        Next
        For iR = 0 To _data2.Rows.Count - 1
            For iH = 0 To _data2.Columns.Count - 1
                dataarray2(iR + 1, iH) = IIf(IsDBNull(_data2.Rows(iR).Item(iH)), "", _data2.Rows(iR).Item(iH))
            Next
        Next




        Table3ToExcel = False
        Dim ex As Object
        ex = CreateObject("Excel.Application")
        ex.Workbooks.Add()
        CType(ex.Workbooks(1).Worksheets("Sheet1"), Microsoft.Office.Interop.Excel.Worksheet).Name = _SheetName
        With ex
            .Range("A1").Resize(_data.Rows.Count + 1, _data.Columns.Count).Value = dataarray
            .Rows("1:1").Font.FontStyle = "Bold"
            .Rows("1:1").Font.Size = 10
            .Cells.Columns.AutoFit()
            .Cells.Select()
            .Cells.EntireColumn.AutoFit()
            .Cells(1, 1).Select()
        End With

        ex.Worksheets.Add()
        CType(ex.Workbooks(1).Worksheets("Sheet2"), Microsoft.Office.Interop.Excel.Worksheet).Name = _SheetName1
        With ex
            .Range("A1").Resize(_data1.Rows.Count + 1, _data1.Columns.Count).Value = dataarray1
            .Rows("1:1").Font.FontStyle = "Bold"
            .Rows("1:1").Font.Size = 10
            .Cells.Columns.AutoFit()
            .Cells.Select()
            .Cells.EntireColumn.AutoFit()
            .Cells(1, 1).Select()
        End With

        ex.Worksheets.Add()
        CType(ex.Workbooks(1).Worksheets("Sheet3"), Microsoft.Office.Interop.Excel.Worksheet).Name = _SheetName2
        With ex
            .Range("A1").Resize(_data2.Rows.Count + 1, _data2.Columns.Count).Value = dataarray2
            .Rows("1:1").Font.FontStyle = "Bold"
            .Rows("1:1").Font.Size = 10
            .Cells.Columns.AutoFit()
            .Cells.Select()
            .Cells.EntireColumn.AutoFit()
            .Cells(1, 1).Select()
        End With



        ex.visible = True
        Return True
    End Function

    Public Function Table4ToExcel(_SheetName1 As String, _data1 As DataTable, _SheetName2 As String, _data2 As DataTable, _SheetName3 As String, _data3 As DataTable, _SheetName4 As String, _data4 As DataTable) As Boolean

        Dim dataarray1(_data1.Rows.Count + 1, _data1.Columns.Count - 1) As String
        For i = 0 To _data1.Columns.Count - 1
            dataarray1(0, i) = _data1.Columns(i).ColumnName
        Next
        For iR = 0 To _data1.Rows.Count - 1
            For iH = 0 To _data1.Columns.Count - 1
                dataarray1(iR + 1, iH) = IIf(IsDBNull(_data1.Rows(iR).Item(iH).ToString()), "", _data1.Rows(iR).Item(iH).ToString())
            Next
        Next


        Dim dataarray2(_data2.Rows.Count + 1, _data2.Columns.Count - 1) As String
        For i = 0 To _data2.Columns.Count - 1
            dataarray2(0, i) = _data2.Columns(i).ColumnName
        Next
        For iR = 0 To _data2.Rows.Count - 1
            For iH = 0 To _data2.Columns.Count - 1
                dataarray2(iR + 1, iH) = IIf(IsDBNull(_data2.Rows(iR).Item(iH).ToString()), "", _data2.Rows(iR).Item(iH).ToString())
            Next
        Next


        Dim dataarray3(_data3.Rows.Count + 1, _data3.Columns.Count - 1) As String
        For i = 0 To _data3.Columns.Count - 1
            dataarray3(0, i) = _data3.Columns(i).ColumnName
        Next
        For iR = 0 To _data3.Rows.Count - 1
            For iH = 0 To _data3.Columns.Count - 1
                dataarray3(iR + 1, iH) = IIf(IsDBNull(_data3.Rows(iR).Item(iH).ToString()), "", _data3.Rows(iR).Item(iH).ToString())
            Next
        Next

        Dim dataarray4(_data4.Rows.Count + 1, _data4.Columns.Count - 1) As String
        For i = 0 To _data4.Columns.Count - 1
            dataarray4(0, i) = _data4.Columns(i).ColumnName
        Next
        For iR = 0 To _data4.Rows.Count - 1
            For iH = 0 To _data4.Columns.Count - 1
                dataarray4(iR + 1, iH) = IIf(IsDBNull(_data4.Rows(iR).Item(iH).ToString()), "", _data4.Rows(iR).Item(iH).ToString())
            Next
        Next


        Table4ToExcel = False

        Dim ex As Object
        ex = CreateObject("Excel.Application")
        ex.Workbooks.Add()
        CType(ex.Workbooks(1).Worksheets("Sheet1"), Microsoft.Office.Interop.Excel.Worksheet).Name = _SheetName1
        With ex
            .Range("A1").Resize(_data1.Rows.Count + 1, _data1.Columns.Count).Value = dataarray1
            .Rows("1:1").Font.FontStyle = "Bold"
            .Rows("1:1").Font.Size = 10
            .Cells.Columns.AutoFit()
            .Cells.Select()
            .Cells.EntireColumn.AutoFit()
            .Cells(1, 1).Select()
        End With

        ex.Worksheets.Add()
        CType(ex.Workbooks(1).Worksheets("Sheet2"), Microsoft.Office.Interop.Excel.Worksheet).Name = _SheetName2
        With ex
            .Range("A1").Resize(_data2.Rows.Count + 1, _data2.Columns.Count).Value = dataarray2
            .Rows("1:1").Font.FontStyle = "Bold"
            .Rows("1:1").Font.Size = 10
            .Cells.Columns.AutoFit()
            .Cells.Select()
            .Cells.EntireColumn.AutoFit()
            .Cells(1, 1).Select()
        End With

        ex.Worksheets.Add()
        CType(ex.Workbooks(1).Worksheets("Sheet3"), Microsoft.Office.Interop.Excel.Worksheet).Name = _SheetName3
        With ex
            .Range("A1").Resize(_data3.Rows.Count + 1, _data3.Columns.Count).Value = dataarray3
            .Rows("1:1").Font.FontStyle = "Bold"
            .Rows("1:1").Font.Size = 10
            .Cells.Columns.AutoFit()
            .Cells.Select()
            .Cells.EntireColumn.AutoFit()
            .Cells(1, 1).Select()
        End With

        ex.Worksheets.Add()
        CType(ex.Workbooks(1).Worksheets("Sheet4"), Microsoft.Office.Interop.Excel.Worksheet).Name = _SheetName4
        With ex
            .Range("A1").Resize(_data4.Rows.Count + 1, _data4.Columns.Count).Value = dataarray4
            .Rows("1:1").Font.FontStyle = "Bold"
            .Rows("1:1").Font.Size = 10
            .Cells.Columns.AutoFit()
            .Cells.Select()
            .Cells.EntireColumn.AutoFit()
            .Cells(1, 1).Select()
        End With


        ex.visible = True
        Return True
    End Function

    Public Function ArrayToExcel(_SheetName As String, _data() As String) As Boolean

        Dim _Columns As Integer
        Dim _Rows As Integer

        Try
            For i = 0 To 1000000000000
                _Columns = i
            Next
        Catch exxx As Exception

        End Try

        Try
            For i = 0 To 1000000000000
                _Rows = i
            Next
        Catch exx As Exception

        End Try

        ArrayToExcel = False
        Dim ex As Object
        ex = CreateObject("Excel.Application")
        ex.Workbooks.Add()
        CType(ex.Workbooks(1).Worksheets("Sheet1"), Microsoft.Office.Interop.Excel.Worksheet).Name = _SheetName
        With ex
            .Range("A1").Resize(_Columns, _Rows).Value = _data
            .Rows("1:1").Font.FontStyle = "Bold"
            .Rows("1:1").Font.Size = 10
            .Cells.Columns.AutoFit()
            .Cells.Select()
            .Cells.EntireColumn.AutoFit()
            .Cells(1, 1).Select()
        End With
        ex.visible = True
        Return True
    End Function

    'Public Function DGVToExcel(_SheetName As String, _data As DataGridView) As Boolean

    '    Dim dataarray(_data.Rows.Count, _data.Columns.Count - 1) As String
    '    For i = 0 To _data.Columns.Count - 1
    '        dataarray(0, i) = _data.Columns(i).HeaderText
    '    Next
    '    For iR = 0 To _data.Rows.Count - 1
    '        For iH = 0 To _data.Columns.Count - 1
    '            dataarray(iR + 1, iH) = IIf(IsDBNull(_data.Item(iH, iR).Value), "-", _data.Item(iH, iR).Value)
    '        Next
    '    Next
    '    DGVToExcel = False
    '    Dim ex As Object
    '    ex = CreateObject("Excel.Application")
    '    ex.Workbooks.Add()
    '    CType(ex.Workbooks(1).Worksheets("Sheet1"), Microsoft.Office.Interop.Excel.Worksheet).Name = _SheetName
    '    With ex
    '        .Range("A1").Resize(_data.Rows.Count + 1, _data.Columns.Count).Value = dataarray
    '        .Rows("1:1").Font.FontStyle = "Bold"
    '        .Rows("1:1").Font.Size = 10
    '        .Cells.Columns.AutoFit()
    '        .Cells.Select()
    '        .Cells.EntireColumn.AutoFit()
    '        .Cells(1, 1).Select()
    '    End With

    '    ex.visible = True

    '    Return True
    'End Function

    'Public Function DGV2ToExcel(_SheetName As String, _data As DataGridView, _SheetName1 As String, _data1 As DataGridView) As Boolean

    '    Dim dataarray(_data.Rows.Count, _data.Columns.Count - 1) As String
    '    For i = 0 To _data.Columns.Count - 1
    '        dataarray(0, i) = _data.Columns(i).HeaderText
    '    Next
    '    For iR = 0 To _data.Rows.Count - 1
    '        For iH = 0 To _data.Columns.Count - 1
    '            dataarray(iR + 1, iH) = IIf(IsDBNull(_data.Item(iH, iR).Value), "-", _data.Item(iH, iR).Value)
    '        Next
    '    Next

    '    Dim dataarray1(_data1.Rows.Count, _data1.Columns.Count - 1) As String
    '    For i = 0 To _data1.Columns.Count - 1
    '        dataarray1(0, i) = _data1.Columns(i).HeaderText
    '    Next
    '    For iR = 0 To _data1.Rows.Count - 1
    '        For iH = 0 To _data1.Columns.Count - 1
    '            dataarray1(iR + 1, iH) = IIf(IsDBNull(_data1.Item(iH, iR).Value), "-", _data1.Item(iH, iR).Value)
    '        Next
    '    Next

    '    DGV2ToExcel = False
    '    Dim ex As Object
    '    ex = CreateObject("Excel.Application")
    '    ex.Workbooks.Add()
    '    CType(ex.Workbooks(1).Worksheets("Sheet1"), Microsoft.Office.Interop.Excel.Worksheet).Name = _SheetName
    '    With ex
    '        .Range("A1").Resize(_data.Rows.Count + 1, _data.Columns.Count).Value = dataarray
    '        .Rows("1:1").Font.FontStyle = "Bold"
    '        .Rows("1:1").Font.Size = 10
    '        .Cells.Columns.AutoFit()
    '        .Cells.Select()
    '        .Cells.EntireColumn.AutoFit()
    '        .Cells(1, 1).Select()
    '    End With

    '    ex.Worksheets.Add()
    '    CType(ex.Workbooks(1).Worksheets("Sheet2"), Microsoft.Office.Interop.Excel.Worksheet).Name = _SheetName1
    '    With ex
    '        .Range("A1").Resize(_data1.Rows.Count + 1, _data1.Columns.Count).Value = dataarray1
    '        .Rows("1:1").Font.FontStyle = "Bold"
    '        .Rows("1:1").Font.Size = 10
    '        .Cells.Columns.AutoFit()
    '        .Cells.Select()
    '        .Cells.EntireColumn.AutoFit()
    '        .Cells(1, 1).Select()
    '    End With

    '    ex.visible = True






    '    Return True
    'End Function

End Class
