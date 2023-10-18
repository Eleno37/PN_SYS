<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Main.Master" CodeBehind="WebForm3.aspx.vb" Inherits="PN_SYSTEM.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div align="center">
        <asp:Panel ID="pnImport" Width="99%" runat="server" GroupingText="Import Calendar"
            BackColor="White" CssClass="txt-gray-14-bold">
            <table align="center" width="95%">
                <tr valign="top">
                    <td align="right" class="button_gray_light">&nbsp;
                    </td>

                </tr>
                <tr>
                    <td colspan="2" align="center" height="30px">
                        <asp:Label ID="lblError" runat="server" CssClass="txt-red-13"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </div>
    <div>
        <table align="center" width="99%">
            <tr>
                <td>&nbsp;
                </td>
            </tr>
            <tr>
                <td class="txt-gray-12">Year :
                    <asp:DropDownList ID="ddlYear" runat="server" CssClass="txt-gray-12" Height="26px"
                        AutoPostBack="true">
                    </asp:DropDownList>
                    &nbsp; Month :
                    <asp:DropDownList ID="ddlYYYYMM" runat="server" CssClass="txt-gray-12" Height="26px">
                    </asp:DropDownList>
                    <%--&nbsp; Plant :
                    <asp:DropDownList ID="ddlPlant" runat="server" CssClass="txt-gray-12" Height="26px">
                        <asp:ListItem>ALL</asp:ListItem>
                        <asp:ListItem>IPP</asp:ListItem>
                        <asp:ListItem>ESIE</asp:ListItem>
                    </asp:DropDownList>--%>
                    &nbsp;<asp:TextBox ID="txtSearch" runat="server" CssClass="input-login" Width="250px"></asp:TextBox>
                    &nbsp;<asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="button-balck"
                        Height="26px" />
                    &nbsp;
                    <asp:Button ID="btnExportPecent" runat="server" CssClass="button-blue" Text="Export CSV"
                        Width="90PX" Height="26px" />
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" CssClass="txt-gray-11" Width="100%" BackColor="White"
                        BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" EnableModelValidation="True">
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <HeaderStyle ForeColor="White" BackColor="#6d7fcc" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                        <RowStyle Height="30px" ForeColor="#000066"></RowStyle>

                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                    <asp:GridView ID="gvImport" runat="server" Visible="false">
                    </asp:GridView>
                    <asp:GridView ID="gvExport" runat="server" Visible="false">
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </div>


</asp:Content>
