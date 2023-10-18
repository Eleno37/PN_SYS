Public Class frm_customerdata
    Inherits System.Web.UI.Page
    Dim itemtable As DataTable
    Dim export_class As New clsToExcel()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Call load_grid_detail("", 10)
        End If
    End Sub
    Private Sub load_grid_detail(ByVal TopLv_cusdata As String, num_row_cusdata As Integer)
        If TopLv_cusdata <> "" Then
            itemtable = mdSQLCommand.load_customerdata(TopLv_cusdata, num_row_cusdata)
        Else
            itemtable = mdSQLCommand.load_customerdata("", num_row_cusdata)
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

    Protected Sub btn_export_Click(sender As Object, e As EventArgs) Handles btn_export.Click
        Dim dat_now As String = Date.Now.ToString("dd-MM-yyyy")
        'Call md_export_excel.export_excel("CustomerData_Export " & dat_now, mdSQLCommand.load_customerdata("", 100))

        export_class.TableToExcel("EXPORT_Customerdata_" & dat_now, mdSQLCommand.load_customerdata("", 2000))

    End Sub


End Class