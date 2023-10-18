Imports System.IO
Imports Org.BouncyCastle.Utilities

Public Class frm_customer_forecast_multi
    Inherits System.Web.UI.Page
    Dim itemtable As DataTable
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack = False Then
            Call show_year()
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
End Class