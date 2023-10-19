<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="WebForm6.aspx.vb" Inherits="PN_SYSTEM.WebForm6" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="row">

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:TemplateField HeaderText="Name" ItemStyle-Width="150">
                        <ItemTemplate>
                            <asp:Label ID="lblName" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                            <%--<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>--%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Country" HeaderText="Country" ItemStyle-Width="150px" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button Text="Select" runat="server" CommandName="Select" CommandArgument="<%# Container.DataItemIndex %>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

        </div>
        <div class="row">

            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:TemplateField HeaderText="Name" ItemStyle-Width="150">
                        <ItemTemplate>
                            <asp:Label ID="lblName" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                            <%--<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>--%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Country" HeaderText="Country" ItemStyle-Width="150px" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button Text="Select" runat="server" CommandName="Select" CommandArgument="<%# Container.DataItemIndex %>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

        </div>
    </form>
</body>
</html>
