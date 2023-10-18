Imports System.Data.SqlClient
Imports System.Drawing
Imports System.IO
Imports System.Web.Services.Description

Public Class frm_working_calendar
    Inherits System.Web.UI.Page
    Dim itemtable As DataTable
    Private objFields As Object
    Dim file_import_new As String
    Dim export_class As New clsToExcel()
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        div_warning.Visible = False
        div_sucess.Visible = False
        div_alert.Visible = False
        If Page.IsPostBack = False Then
            Call show_year()
            'Call show_ddlYYYYMM()
            Call load_grid_detail(Now.Year, "ALL", "")
        End If

    End Sub

    Private Sub load_grid_detail(ByVal ddlyear As String, ddlyyyymm As String, txt_search As String)

        itemtable = mdSQLCommand.load_cuscalendar(ddlyear, ddlyyyymm, txt_search)
        gv_detail.DataSource = itemtable
        gv_detail.DataBind()
        read_data()
    End Sub

    Function check_color(ByVal value As String) As Color
        Dim tb_color As Color
        Select Case value
            Case "0"
                tb_color = Color.FromArgb(255, 105, 105)
            Case "1"
                tb_color = Color.FromArgb(150, 194, 145)
        End Select
        'If value = "0" Then
        '    tb_color = Color.Red
        'ElseIf value = "1" Then
        '    tb_color = Color.Orange
        'Else
        '    tb_color = Color.Green
        'End If
        Return tb_color
    End Function
    'Sub show_ddlYYYYMM()
    '    Dim deault_month As String = String.Format("{0:yyyMM}", Now)
    '    ddlYYYYMM.Items.Clear()
    '    ddlYYYYMM.Items.Add(New ListItem("ALL"))

    '    'ddlYYYYMM.Items.Add(DateTime.Now.AddMonths(-1).ToString("yyyyMM"))
    '    For i = 1 To 12
    '        ddlYYYYMM.Items.Add(New ListItem(ddlYear.SelectedValue & String.Format("{0:00}", i)))
    '        ddlYYYYMM.SelectedIndex = ddlYYYYMM.Items.IndexOf(ddlYYYYMM.Items.FindByText(deault_month))
    '        'ddlYYYYMM.Items.Add(DateTime.Now.AddYears(+i).ToString("yyyyMM"))
    '        'ddlYYYYMM.Items.Add(DateTime.Now.AddMonths(+i).ToString("yyyyMM"))
    '        'ddlYYYYMM.SelectedValue = DateTime.Now.ToString("yyyyMM")
    '    Next i
    'End Sub

    Sub show_year()
        Dim start_year As Integer = 2022
        Dim year As Integer = Date.Now.Year
        ddlYear.Items.Clear()
        For i As Integer = start_year To year
            ddlYear.Items.Add(New ListItem(i))
            ddlYear.Items.FindByValue(year)
            ddlYear.SelectedIndex = ddlYear.Items.IndexOf(ddlYear.Items.FindByText(year))
        Next

    End Sub

    Sub read_data()
        If gv_detail.Rows.Count > 0 Then
            For i = 0 To gv_detail.Rows.Count - 1
                For j = 5 To 35
                    gv_detail.Rows(i).Cells(j).BackColor = check_color(gv_detail.Rows(i).Cells(j).Text)
                    gv_detail.Rows(i).Cells(j).ForeColor = Color.White

                    'gv_detail.Rows(i).Cells(j).BackColor = Color.Green
                Next
            Next
        End If
    End Sub
    Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        Call load_grid_detail(ddlYear.SelectedItem.ToString, ddlYYYYMM.SelectedItem.ToString, txtSearch.Text)
    End Sub

    Private Sub gv_detail_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gv_detail.RowCommand
        If e.CommandName = "DeleteRec" Then
            Dim img As ImageButton = DirectCast(e.CommandSource, ImageButton)
            Dim row As GridViewRow = TryCast(img.NamingContainer, GridViewRow)
            'Dim project_name As LinkButton = DirectCast(row.FindControl("project_name"), LinkButton)
            Dim lblCust As Label = DirectCast(row.FindControl("lblCust"), Label)
            'project_no = e.CommandArgument
            'lblFileProNo.Text = project_no & "-" & project_name.Text
            'lblFProNo.Text = project_no
            'lblFileProID.Text = lblId.Text
            Dim sql As String
            Dim confirmValue As String = Request.Form("confirm_value")
            Dim strClientIP As String = Request.ServerVariables("REMOTE_ADDR")
            If confirmValue = "Yes" Then
                sql = "UPDATE tblCustomersCalendar SET flag='0' WHERE month='" & e.CommandArgument & "' AND customer_no='" & lblCust.Text & "' "
                TokaiwsSQL.RunSQL(sql)
                load_grid_detail(Now.Year, "ALL", "")
            End If
        End If
    End Sub

    Protected Sub btn_import_Click(sender As Object, e As EventArgs) Handles btn_import.Click
        If InsertCalendar() = "" Then  'Check File Import
            alert_status("Alert", "Please browse file!!")
            Exit Sub
        End If
        If CSVToDataTable(InsertCalendar()).Rows.Count = 0 Then
            alert_status("Warning", "Please Import Again!!")
            Exit Sub
        End If
        insert_db(CSVToDataTable(InsertCalendar()))


    End Sub

    Function InsertCalendar() As String


        Dim SaveLocation As String = ""
        If FileUpload1.HasFiles Then

            If Not System.IO.Directory.Exists(Server.MapPath("file_upload/")) Then
                System.IO.Directory.CreateDirectory(Server.MapPath("file_upload/"))
            End If

            Dim extension As String = LCase(System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName))
            If extension <> ".csv" Then
                'lblError.Text = "นามสกุลไฟล์ไม่ถูกต้อง (.csv)"
                Exit Function
            Else
                ''lblError.Text = ""
            End If

            Dim file_import As String = ""
            file_import_new = ""
            file_import = "CALENDAR_" & Date.Now.ToString("yyyyMMddHHmmss").ToString & extension
            If Not FileUpload1.PostedFile Is Nothing And FileUpload1.PostedFile.ContentLength > 0 Then
                SaveLocation = Server.MapPath("file_upload/" & file_import)
                FileUpload1.PostedFile.SaveAs(SaveLocation)
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

    Sub insert_db(ByVal dt As DataTable)
        Dim month, customer_no As String

        If dt.Rows.Count <> 0 Then
            For i = 0 To dt.Rows.Count - 1
                Dim strBuider As String = String.Empty
                month = dt.Rows(i).Item("MONTH").ToString
                customer_no = dt.Rows(i).Item("Customer").ToString
                If check_calendar_exist(month, customer_no) = "None" Then
                    Dim Sql As String

                    Sql = "INSERT INTO tblCustomersCalendar "
                    Sql &= " ( [flag]"
                    Sql &= " ,[plant]"
                    Sql &= " ,[month] "
                    Sql &= " ,[customer_no]"
                    Sql &= " ,[customer_name]"
                    Sql &= " ,[TOTAL_DAY]"
                    Sql &= " ,[D1] "
                    Sql &= " ,[D2] "
                    Sql &= " ,[D3] "
                    Sql &= " ,[D4] "
                    Sql &= " ,[D5] "
                    Sql &= " ,[D6] "
                    Sql &= " ,[D7] "
                    Sql &= " ,[D8] "
                    Sql &= " ,[D9] "
                    Sql &= " ,[D10]"
                    Sql &= " ,[D11]"
                    Sql &= " ,[D12]"
                    Sql &= " ,[D13]"
                    Sql &= " ,[D14]"
                    Sql &= " ,[D15]"
                    Sql &= " ,[D16]"
                    Sql &= " ,[D17]"
                    Sql &= " ,[D18]"
                    Sql &= " ,[D19]"
                    Sql &= " ,[D20]"
                    Sql &= " ,[D21]"
                    Sql &= " ,[D22]"
                    Sql &= " ,[D23]"
                    Sql &= " ,[D24]"
                    Sql &= " ,[D25]"
                    Sql &= " ,[D26]"
                    Sql &= " ,[D27]"
                    Sql &= " ,[D28]"
                    Sql &= " ,[D29]"
                    Sql &= " ,[D30]"
                    Sql &= " ,[D31]"
                    Sql &= " ,[file_import]"
                    Sql &= " ,[update_by])"
                    Sql &= " VALUES ( 1 ,'','" & month & "', '" & customer_no & "', '" & dt.Rows(i).Item("Customer Short Name").ToString & "',"
                    Sql &= "" & dt.Rows(i).Item("TOTAL_DAY").ToString & ","
                    Sql &= "'" & dt.Rows(i).Item("D1").ToString & "',"
                    Sql &= "'" & dt.Rows(i).Item("D2").ToString & "',"
                    Sql &= "'" & dt.Rows(i).Item("D3").ToString & "',"
                    Sql &= "'" & dt.Rows(i).Item("D4").ToString & "',"
                    Sql &= "'" & dt.Rows(i).Item("D5").ToString & "',"
                    Sql &= "'" & dt.Rows(i).Item("D6").ToString & "',"
                    Sql &= "'" & dt.Rows(i).Item("D7").ToString & "',"
                    Sql &= "'" & dt.Rows(i).Item("D8").ToString & "',"
                    Sql &= "'" & dt.Rows(i).Item("D9").ToString & "',"
                    Sql &= "'" & dt.Rows(i).Item("D10").ToString & "',"
                    Sql &= "'" & dt.Rows(i).Item("D11").ToString & "',"
                    Sql &= "'" & dt.Rows(i).Item("D12").ToString & "',"
                    Sql &= "'" & dt.Rows(i).Item("D13").ToString & "',"
                    Sql &= "'" & dt.Rows(i).Item("D14").ToString & "',"
                    Sql &= "'" & dt.Rows(i).Item("D15").ToString & "',"
                    Sql &= "'" & dt.Rows(i).Item("D16").ToString & "',"
                    Sql &= "'" & dt.Rows(i).Item("D17").ToString & "',"
                    Sql &= "'" & dt.Rows(i).Item("D18").ToString & "',"
                    Sql &= "'" & dt.Rows(i).Item("D19").ToString & "',"
                    Sql &= "'" & dt.Rows(i).Item("D20").ToString & "',"
                    Sql &= "'" & dt.Rows(i).Item("D21").ToString & "',"
                    Sql &= "'" & dt.Rows(i).Item("D22").ToString & "',"
                    Sql &= "'" & dt.Rows(i).Item("D23").ToString & "',"
                    Sql &= "'" & dt.Rows(i).Item("D24").ToString & "',"
                    Sql &= "'" & dt.Rows(i).Item("D25").ToString & "',"
                    Sql &= "'" & dt.Rows(i).Item("D26").ToString & "',"
                    Sql &= "'" & dt.Rows(i).Item("D27").ToString & "',"
                    Sql &= "'" & dt.Rows(i).Item("D28").ToString & "',"
                    Sql &= "'" & dt.Rows(i).Item("D29").ToString & "',"
                    Sql &= "'" & dt.Rows(i).Item("D30").ToString & "',"
                    Sql &= "'" & dt.Rows(i).Item("D31").ToString & "',"
                    Sql &= "'" & file_import_new.ToString & "',"
                    Sql &= "'')"
                    If TokaiwsSQL.RunSQL(Sql) = True Then
                        alert_status("Success", "Import Sucess!")
                    Else
                        alert_status("Warning", "Please Import Again!")
                    End If

                Else
                    Dim current_day As Integer = 1
                    For a = 3 To 33
                        If dt.Rows(i).Item(a).ToString = "1" Then
                            strBuider &= "D" & current_day & "='1',"
                        Else
                            strBuider &= "D" & current_day & "='0',"
                        End If
                        current_day += 1
                    Next
                    Dim Sql As String
                    Sql = "UPDATE tblCustomersCalendar SET"
                    'Sql &= " month = '" & month & "',"
                    'Sql &= " customer_no = '" & cust_no & "',"
                    Sql &= " customer_name = '" & dt.Rows(i).Item("Customer Short Name").ToString & "',"
                    Sql &= strBuider
                    Sql &= " TOTAL_DAY = " & dt.Rows(i).Item("TOTAL_DAY") & ","
                    Sql &= " file_import = '" & file_import_new & "'"
                    'Sql &= " update_by = '" & Session("pn_signature") & "',"
                    'Sql &= " update_time = '" & String.Format("{0:yyyy-MM-dd hh:mm:ss}", Now) & "'"
                    Sql &= " WHERE Id='" & check_calendar_exist(month, customer_no) & "' "
                    TokaiwsSQL.RunSQL(Sql)

                End If
            Next

        End If

    End Sub
    Public Function check_calendar_exist(ByVal month As String, ByVal cust_code As String) As String
        Dim sql As String
        Dim DTChkCar As DataTable
        sql = "SELECT Id FROM tblCustomersCalendar WHERE month='" & month & "' AND customer_no='" & cust_code & "' AND flag='1'"
        DTChkCar = TokaiwsSQL.SelectSQL(sql).Tables(0)
        If DTChkCar.Rows.Count > 0 Then
            Return DTChkCar.Rows(0).Item("Id")
        Else
            Return "None"

        End If
    End Function

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

    Protected Sub btn_export_Click(sender As Object, e As EventArgs) Handles btn_export.Click
        Dim dat_now As String = Date.Now.ToString("dd_MM_yyyy")
        'Call md_export_excel.export_excel("CustomerData_Export " & dat_now, mdSQLCommand.load_customerdata("", 100))

        export_class.TableToExcel("EXPORT_calendar_" & dat_now, mdSQLCommand.load_cuscalendar(ddlYear.SelectedItem.ToString, ddlYYYYMM.SelectedItem.ToString, txtSearch.Text))

    End Sub
End Class