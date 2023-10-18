
Public Class frm_View_BOM_hierarchical
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            load_grid_detail()
            Me.PopulateTreeView(load_treeview(""), 0, Nothing)
        End If
    End Sub

    Private Sub load_grid_detail()
        Dim stable As DataTable = mdSQLCommand.load_review_BOM
        gv_detail.DataSource = stable
        gv_detail.DataBind()
    End Sub

    Private Sub PopulateTreeView(ByVal dtParent As DataTable, ByVal parentId As Integer, ByVal treeNode As TreeNode)
        'For Each row As DataRow In dtParent.Rows
        '    Dim child As TreeNode = New TreeNode With {
        '        .Text = row("AV_ChildPart").ToString(),
        '        .Value = row("Child_id").ToString()
        '    }
        '    If parentId = 0 Then
        '        TreeView1.Nodes.Add(child)
        '        Dim dtChild As DataTable = load_treeview(child.Value)
        '        PopulateTreeView(dtChild, Integer.Parse(child.Value), child)
        '    Else
        '        treeNode.ChildNodes.Add(child)
        '    End If
        'Next
    End Sub
End Class