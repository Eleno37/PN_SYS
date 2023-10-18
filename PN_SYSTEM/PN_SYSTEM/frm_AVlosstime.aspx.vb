Public Class frm_AVlosstime
    Inherits System.Web.UI.Page
    Dim itemtable As DataTable
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Call load_grid_detail("", 10)
        End If
    End Sub
    Private Sub load_grid_detail(ByVal TopLv_losstime As String, num_row_losstime As Integer)
        If TopLv_losstime <> "" Then
            itemtable = mdSQLCommand.load_AV_losstime(TopLv_losstime, num_row_losstime)
        Else
            itemtable = mdSQLCommand.load_AV_losstime("", num_row_losstime)
        End If

        gv_detail.DataSource = itemtable
        gv_detail.DataBind()
    End Sub
    Protected Sub btn_search_Click(sender As Object, e As EventArgs) Handles btn_search.Click
        If txtDate.Text <> "" Then
            'Call load_grid_detail(txt_search.Text.ToString("yyyy-MM-dd"), DropDownList1.SelectedItem.Text)
        Else
            Call load_grid_detail("", DropDownList1.SelectedItem.Text)
        End If
    End Sub
    Protected Sub DropDownList1_TextChanged(sender As Object, e As EventArgs) Handles DropDownList1.TextChanged
        load_grid_detail("", DropDownList1.SelectedItem.Text)
    End Sub



End Class