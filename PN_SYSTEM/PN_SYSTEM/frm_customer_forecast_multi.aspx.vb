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


    Private Sub load_grid_detail(ByVal txt_search As String, ddlplant As String, ddl_countrow As Integer)

        itemtable = mdSQLCommand.load_cusforecast(txt_search, ddlplant, ddl_countrow)
        gv_detail.DataSource = itemtable
        gv_detail.DataBind()

    End Sub
End Class