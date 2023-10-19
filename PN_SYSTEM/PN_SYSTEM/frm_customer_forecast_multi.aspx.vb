Imports System.Data.OleDb
Imports System.Data.SqlClient
Imports System.IO
Imports System.Windows.Controls
Imports Org.BouncyCastle.Utilities

Public Class frm_customer_forecast_multi
    Inherits System.Web.UI.Page
    Dim itemtable As DataTable
    Dim file_import_new As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack = False Then
            Call show_year()
            Call show_yearImp()
            Call load_grid_detail("", "0", 10)
        End If
    End Sub
    'Sub show_year()
    '    Dim start_year As Integer = 2022
    '    Dim year As Integer = Date.Now.Year
    '    ddlYear.Items.Clear()
    '    For i As Integer = start_year To year
    '        ddlYear.Items.Add(New ListItem(i))
    '        ddlYear.Items.FindByValue(year)
    '        ddlYear.SelectedIndex = ddlYear.Items.IndexOf(ddlYear.Items.FindByText(year))
    '    Next
    'End Sub

    Protected Sub btn_search_Click(sender As Object, e As EventArgs) Handles btn_search.Click
        show_data()
    End Sub

    Private Sub load_grid_detail(ByVal txt_search As String, ddlplant As String, ddl_countrow As Integer)

        itemtable = mdSQLCommand.load_cusforecast(txt_search, ddlplant, ddl_countrow)
        gv_detail.DataSource = itemtable
        gv_detail.DataBind()

    End Sub

    Sub show_year()
        Dim default_year As String = String.Format("{0:yyyy}", Now)
        Dim sql As String
        Dim DTYear As DataTable
        sql = "SELECT left(month,4) as year_group FROM tblCustomersForecast WHERE flag='1' AND import_type='MULTI' GROUP BY left(month,4) order by  left(month,4) ASC "
        DTYear = TokaiwsSQL.SelectSQL(sql).Tables(0)
        If DTYear.Rows.Count <> 0 Then
            ddlYear.Items.Clear()
            ddlYear.Items.Add(New ListItem("Select"))
            For i = 0 To DTYear.Rows.Count - 1
                ddlYear.Items.Add(New ListItem(DTYear.Rows(i).Item("year_group")))
                ddlYear.SelectedIndex = ddlYear.Items.IndexOf(ddlYear.Items.FindByText(default_year))
            Next
        End If
    End Sub

    Sub show_yearImp()
        Dim start_year As Integer = 2022
        Dim year As Integer = Date.Now.Year
        ddlYearImp.Items.Clear()
        For i As Integer = start_year To year + 1
            ddlYearImp.Items.Add(New ListItem(i))
            ddlYearImp.Items.FindByValue(year)
            ddlYearImp.SelectedIndex = ddlYearImp.Items.IndexOf(ddlYearImp.Items.FindByText(year))
        Next
    End Sub

    Protected Sub btn_import_Click(sender As Object, e As EventArgs) Handles btn_import.Click

    End Sub

    Function Insertforecast() As String


        Dim SaveLocation As String = ""
        If Fileupload_cusforecast.HasFiles Then

            If Not System.IO.Directory.Exists(Server.MapPath("file_upload/Customer Forecast")) Then
                System.IO.Directory.CreateDirectory(Server.MapPath("file_upload/Customer Forecast"))
            End If

            Dim extension As String = LCase(System.IO.Path.GetExtension(Fileupload_cusforecast.PostedFile.FileName))
            If extension <> ".csv" Then
                'lblError.Text = "นามสกุลไฟล์ไม่ถูกต้อง (.csv)"
                Exit Function
            Else
                ''lblError.Text = ""
            End If

            Dim file_import As String = ""
            file_import_new = ""
            file_import = "CUSTOMER_FC_" & Date.Now.ToString("yyyyMMddHHmmss").ToString & extension
            If Not Fileupload_cusforecast.PostedFile Is Nothing And Fileupload_cusforecast.PostedFile.ContentLength > 0 Then
                SaveLocation = Server.MapPath("file_upload/Customer Forecast/" & file_import)
                Fileupload_cusforecast.PostedFile.SaveAs(SaveLocation)
                load_grid_detail(Now.Year, "ALL", "")
            End If
            file_import_new = file_import
        Else

        End If

        Return SaveLocation

    End Function

    Private Function CSVToDataTable(path As String) As DataTable
        Dim dt As DataTable = New DataTable()
        Dim csvData As String
        Using sr As StreamReader = New StreamReader(path)
            csvData = sr.ReadToEnd().ToString()
            Dim row As String() = csvData.Split(vbLf)
            For i As Integer = 0 To row.Count() - 1 - 1
                Dim rowData As String() = row(i).Split(","c)
                If True Then
                    If i = 0 Then
                        For j As Integer = 0 To rowData.Count() - 1
                            dt.Columns.Add(rowData(j).Trim())
                        Next
                    Else
                        Dim dr As DataRow = dt.NewRow()
                        For k As Integer = 0 To rowData.Count() - 1
                            dr(k) = rowData(k).ToString()
                        Next

                        dt.Rows.Add(dr)
                    End If
                End If
            Next

            Return dt
        End Using

    End Function

    Protected Sub btn_browse_Click(sender As Object, e As EventArgs) Handles btn_browse.Click
        Dim sql As String
        If Fileupload_cusforecast.HasFile Then
            Dim connectionstring As String = ""
            lblFileName.Text = System.IO.Path.GetFileName(Fileupload_cusforecast.PostedFile.FileName)
            Dim file_name As String = System.IO.Path.GetFileName(Fileupload_cusforecast.PostedFile.FileName)
            Dim DTCheck As DataTable
            sql = "SELECT file_import FROM tblCustomersForecast WHERE flag='1' and file_import = '" & lblFileName.Text & "' "
            DTCheck = mdSQLCommand.TokaiwsSQL.SelectSQL(sql).Tables(0)
            If DTCheck.Rows.Count <> 0 Then
                alert_status("Alert", "Dupplicate file import !!!")
                Exit Sub
            End If
            'Dim filename As String = Path.GetFileName(FileUpload1.PostedFile.FileName)
            Dim filename As String = "Customer_FC_" & String.Format("{0:yyyyMMddHHmmss}", Now) & ".xlsx"
            Dim fileextension As String = Path.GetExtension(Fileupload_cusforecast.FileName)
            Dim filelocation As String = "D:\attach_data\TEST\" + filename
            Fileupload_cusforecast.SaveAs(filelocation)
            If fileextension = ".xlsx" Then
                connectionstring = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + filelocation + ";Extended Properties='Excel 12.0;HDR=YES;IMEX=2'"

                Dim conn As OleDbConnection = New OleDbConnection(connectionstring)
                Dim cmd As OleDbCommand = New OleDbCommand()
                cmd.CommandType = System.Data.CommandType.Text
                cmd.CommandText = "select * from [Sheet1$]"
                cmd.Connection = conn
                Dim oleDbDataAdapter As OleDbDataAdapter = New OleDbDataAdapter(cmd)
                Dim dataTable As DataTable = New DataTable()
                oleDbDataAdapter.Fill(dataTable)
                gvdata.DataSource = dataTable
                gvdata.DataBind()
            End If
        Else
            gvdata.DataSource = Nothing
            gvdata.DataBind()
            Fileupload_cusforecast.Attributes.Clear()
        End If
    End Sub

    Function alert_status(ByVal status As String, text As String) As Boolean
        Select Case status
            Case "Alert"
                div_alert.Visible = True
                lb_alert.Text = text
                Return True
            Case "Success"
                div_sucess.Visible = True
                lb_sucess.Text = text
                Return True
            Case "Warning"
                div_warning.Visible = True
                lb_warning.Text = text
                Return True
            Case Else
                Return False
        End Select

    End Function

    Protected Sub btn_clear_Click(sender As Object, e As EventArgs) Handles btn_clear.Click
        gvdata.DataSource = Nothing
        gvdata.DataBind()
        Fileupload_cusforecast.Attributes.Clear()
    End Sub

    'Protected Sub gvdata_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvdata.RowCommand
    '    If e.CommandName = "Select" Then

    '        'Determine the RowIndex of the Row whose Button was clicked.
    '        Dim rowIndex As Integer = Convert.ToInt32(e.CommandArgument)

    '        'Reference the GridView Row.
    '        Dim row As GridViewRow = gvdata.Rows(rowIndex)

    '        'Fetch value of Name.
    '        'Dim name As String = TryCast(row.FindControl("txtName"), Label).Text

    '        'Fetch value of Country.
    '        Dim country As String = row.Cells(1).Text

    '        'ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Name: " & name & "\nCountry: " & country + "');", True)

    '    End If
    'End Sub

    Protected Sub gvdata_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvdata.RowCommand
        'If e.CommandName = "Select" Then
        '    'Determine the RowIndex of the Row whose Button was clicked.
        '    Dim rowIndex As Integer = Convert.ToInt32(e.CommandArgument)



        '    'Reference the GridView Row.
        '    Dim row As GridViewRow = gvdata.Rows(rowIndex)



        '    'Fetch value of Name.
        '    Dim name As String = TryCast(row.FindControl("lblName"), Label).Text



        '    'Fetch value of Country.
        '    Dim country As String = row.Cells(1).Text



        '    ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Name: " & name & "\nCountry: " & country + "');", True)
        'End If
    End Sub

    Sub show_data()
        Dim sql As String

        Dim DTData As DataTable
        sql = "SELECT  month,file_import,update_by,record_date FROM tblCustomersForecast "
        sql &= " WHERE flag='1' "
        sql &= " AND  left(month,4) = '" & ddlYear.SelectedValue & "' "
        If ddlmonth.SelectedIndex <> 0 Then
            sql &= " AND month = '" & ddlmonth.SelectedValue & "' "
        End If
        If txt_search.Text <> "" Then
            sql &= " AND (customer_no like '%" & txt_search.Text & "%' OR customer_name like '%" & txt_search.Text & "%' OR part_no like '%" & txt_search.Text & "%' OR MFG_NO like '%" & txt_search.Text & "%') "
        End If
        If ddl_plant.SelectedIndex <> 0 Then
            sql &= " AND plant = '" & ddl_plant.SelectedValue & "' "
        End If
        sql &= " AND import_type = 'MULTI' "
        sql &= " GROUP BY month,file_import,update_by,record_date"
        DTData = mdSQLCommand.TokaiwsSQL.SelectSQL(sql).Tables(0)
        If DTData.Rows.Count > 0 Then
            gv_detail.DataSource = DTData
            gv_detail.DataBind()
        Else
            DTData.Rows.Add(DTData.NewRow())
            gv_detail.DataSource = DTData
            gv_detail.DataBind()
            Dim columnCount As Integer = gv_detail.Rows(0).Cells.Count
            gv_detail.Rows(0).Cells.Clear()
            gv_detail.Rows(0).Cells.Add(New TableCell)
            gv_detail.Rows(0).Cells(0).ColumnSpan = columnCount
            gv_detail.Rows(0).Cells(0).HorizontalAlign = HorizontalAlign.Center
            gv_detail.Rows(0).Cells(0).CssClass = "txt-red-13"
            gv_detail.Rows(0).Cells(0).Text = "No Records Found."
        End If
    End Sub

End Class