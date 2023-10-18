Public Class frm_Metal_MC
    Inherits System.Web.UI.Page
    Dim itemtable As DataTable
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Call load_grid_detail("", 10)
        End If
    End Sub
    Private Sub load_grid_detail(ByVal TopLv_metalmc As String, num_row_metalmc As Integer)
        If TopLv_metalmc <> "" Then
            itemtable = mdSQLCommand.load_metal_mc(TopLv_metalmc, num_row_metalmc)
        Else
            itemtable = mdSQLCommand.load_metal_mc("", num_row_metalmc)
        End If

        gv_detail.DataSource = itemtable
        gv_detail.DataBind()
    End Sub
    Protected Sub btn_search_Click(sender As Object, e As EventArgs) Handles btn_search.Click
        If txt_search.Text <> "" Then
            Call load_grid_detail(txt_search.Text.Trim, DropDownList1.SelectedItem.Text)
        Else
            Call load_grid_detail("", DropDownList1.SelectedItem.Text)
        End If
    End Sub

    Protected Sub DropDownList1_TextChanged(sender As Object, e As EventArgs) Handles DropDownList1.TextChanged
        load_grid_detail("", DropDownList1.SelectedItem.Text)
    End Sub
End Class