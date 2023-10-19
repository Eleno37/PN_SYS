Imports Org.BouncyCastle.Utilities

Public Class frm_mc_losstime_monitoring
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack = False Then
            Call show_year()
            'Call load_grid_detail("", "0", 10)
        End If
    End Sub

    Protected Sub btn_search_Click(sender As Object, e As EventArgs) Handles btn_search.Click
        Call load_grid_detail(ddlmonth.SelectedItem.ToString & "-" & ddlYear.SelectedItem.ToString)
    End Sub
    Private Sub load_grid_detail(ByVal year_month As String)
        gv_detail.DataSource = mdSQLCommand.load_mc_losstime(year_month)
        gv_detail.DataBind()
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
End Class