Imports System.Runtime.Serialization

Public Class frm_BOM
    Inherits System.Web.UI.Page
    Dim itemtable As DataTable
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Call load_grid_detail("", 10)
        End If
    End Sub
    Private Sub load_grid_detail(ByVal TopLv As String, num_row As Integer)
        If TopLv <> "" Then
            itemtable = mdSQLCommand.load_AVBOM(TopLv, num_row)
        Else
            itemtable = mdSQLCommand.load_AVBOM("", num_row)
        End If

        gv_detail.DataSource = itemtable
        gv_detail.DataBind()
    End Sub

    'Protected Sub OnPageIndexChanging(sender As Object, e As GridViewPageEventArgs)
    '    gv_detail.PageIndex = e.NewPageIndex
    '    Call load_grid_detail("",)
    'End Sub

    Protected Sub btn_search_Click(sender As Object, e As EventArgs) Handles btn_search.Click
        If txt_serch.Text <> "" Then
            Call load_grid_detail(txt_serch.Text.Trim, DropDownList1.SelectedItem.Text)
        Else
            Call load_grid_detail("", DropDownList1.SelectedItem.Text)
        End If
    End Sub

    Protected Sub DropDownList1_TextChanged(sender As Object, e As EventArgs) Handles DropDownList1.TextChanged
        load_grid_detail("", DropDownList1.SelectedItem.Text)
    End Sub
End Class