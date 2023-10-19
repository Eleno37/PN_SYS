Imports System.Data
Imports Org.BouncyCastle.Utilities

Public Class WebForm6
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            '    Dim dt As New DataTable()
            '    dt.Columns.AddRange(New DataColumn(2) {New DataColumn("Id"), New DataColumn("Name"), New DataColumn("Country")})
            '    dt.Rows.Add(1, "John Hammond", "United States")
            '    dt.Rows.Add(2, "Mudassar Khan", "India")
            '    dt.Rows.Add(3, "Suzanne Mathews", "France")
            '    dt.Rows.Add(4, "Robert Schidner", "Russia")
            '    GridView1.DataSource = dt
            '    GridView1.DataBind()

            If Page.IsPostBack = False Then
                'Call show_year()
                'Call show_yearImp()
                Call load_grid_detail("", "0", 10)
            End If
        End If
    End Sub

    Protected Sub GridView1_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GridView1.RowCommand
        If e.CommandName = "Select" Then
            'Determine the RowIndex of the Row whose Button was clicked.
            Dim rowIndex As Integer = Convert.ToInt32(e.CommandArgument)

            'Reference the GridView Row.
            Dim row As GridViewRow = GridView1.Rows(rowIndex)

            'Fetch value of Name.
            Dim name As String = TryCast(row.FindControl("lblName"), Label).Text
            'Fetch value of Country.
            Dim country As String = row.Cells(1).Text

        End If
    End Sub
    Private Sub load_grid_detail(ByVal txt_search As String, ddlplant As String, ddl_countrow As Integer)
        'itemtable = mdSQLCommand.load_cusforecast(txt_search, ddlplant, ddl_countrow)
        'gv_detail.DataSource = itemtable
        'gv_detail.DataBind()
        GridView1.DataSource = mdSQLCommand.load_cusforecast(txt_search, ddlplant, ddl_countrow)
        GridView1.DataBind()

    End Sub
End Class