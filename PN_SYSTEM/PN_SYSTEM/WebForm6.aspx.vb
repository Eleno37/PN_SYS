Imports System.Data
Public Class WebForm6
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            Dim dt As New DataTable()
            dt.Columns.AddRange(New DataColumn(2) {New DataColumn("Id"), New DataColumn("Name"), New DataColumn("Country")})
            dt.Rows.Add(1, "John Hammond", "United States")
            dt.Rows.Add(2, "Mudassar Khan", "India")
            dt.Rows.Add(3, "Suzanne Mathews", "France")
            dt.Rows.Add(4, "Robert Schidner", "Russia")
            GridView1.DataSource = dt
            GridView1.DataBind()
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

            ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Name: " & name & "\nCountry: " & country + "');", True)
        End If
    End Sub
End Class