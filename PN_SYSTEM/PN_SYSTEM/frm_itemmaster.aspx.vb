
Public Class frm_itemmaster
    Inherits System.Web.UI.Page
    Dim itemtable As DataTable
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Call load_grid_detail("", 10)
        End If

    End Sub
    Private Sub load_grid_detail(ByVal TopLv_item As String, num_row_item As Integer)
        If TopLv_item <> "" Then
            itemtable = mdSQLCommand.load_AV_ITEM(TopLv_item, num_row_item)
        Else
            itemtable = mdSQLCommand.load_AV_ITEM("", num_row_item)
        End If

        gv_detail.DataSource = itemtable
        gv_detail.DataBind()
    End Sub

    Protected Sub DropDownList1_TextChanged(sender As Object, e As EventArgs) Handles DropDownList2.TextChanged
        load_grid_detail("", DropDownList2.SelectedItem.Text)
    End Sub

    Protected Sub btn_search_Click(sender As Object, e As EventArgs) Handles btn_search.Click
        If txt_search.Text <> "" Then
            Call load_grid_detail(txt_search.Text.Trim, DropDownList2.SelectedItem.Text)
        Else
            Call load_grid_detail("", DropDownList2.SelectedItem.Text)
        End If
    End Sub

    Protected Sub btn_import_Click(sender As Object, e As EventArgs) Handles btn_import.Click

    End Sub

    'Protected Sub OnPageIndexChanging(sender As Object, e As GridViewPageEventArgs)
    '    gv_detail.PageIndex = e.NewPageIndex
    '    Call load_grid_detail()
    'End Sub
End Class