<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Main.Master" CodeBehind="working_calendar.aspx.vb" Inherits="PN_SYSTEM.working_calendar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div align="center">
        <asp:Panel ID="pnImport" Width="99%" runat="server" GroupingText="Import Calendar"
            BackColor="White" CssClass="txt-gray-14-bold">
            <table align="center" width="95%">
                <tr>
                    <td colspan="2" align="right">
                        <asp:LinkButton ID="lnkBtnFile" runat="server" ForeColor="#0066CC"> Download Template (.CSV)</asp:LinkButton>
                    </td>
                </tr>
                <tr valign="top">
                    <td align="right" class="txt-gray-12">Import .CSV File : &nbsp;
                    </td>
                    <td class="td_padding">
                        <asp:FileUpload ID="FileUpload1" runat="server" CssClass="txt_small" />
                    </td>
                </tr>
                <tr valign="top">
                    <td align="right" class="button_gray_light">&nbsp;
                    </td>
                    <td>
                        <asp:Button ID="btnImport" runat="server" Text="Import" CssClass="button-green" OnClientClick="showProgress()" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center" height="30px">
                        <div align="center">
                            <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                                <ProgressTemplate>
                                    <asp:Image ID="Image1" ImageUrl="~/Images/loading.gif" runat="server" Width="200px" /><br />
                                    <asp:Label ID="lblProgress" runat="server" Text="P r o c e s s i n g . . ." BackColor="#33CCCC"
                                        CssClass="txt_header"></asp:Label>
                                </ProgressTemplate>
                            </asp:UpdateProgress>
                        </div>
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
                        <Columns>
                            <asp:TemplateField HeaderText="Delete">
                                <ItemTemplate>
                                    <center>
                                        <asp:Label ID="lblCust" runat="server" Text='<%# Eval("customer_no") %>' Visible="false"></asp:Label>
                                        <asp:ImageButton ID="ImgDel" runat="server" CommandArgument='<%# Eval("month") %>'
                                            CommandName="DeleteRec" ImageUrl="~/Images/delete.png" OnClientClick="return DelRecord()" />
                                    </center>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="No." HeaderStyle-Width="50">
                                <ItemTemplate>
                                    <center>
                                        <%#Container.DisplayIndex+1 %>
                                    </center>
                                </ItemTemplate>
                                <HeaderStyle Width="50px"></HeaderStyle>
                            </asp:TemplateField>
                        </Columns>
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
    <script type="text/javascript">
        function showProgress() {
            var updateProgress = $get("<%= UpdateProgress1.ClientID %>");
            updateProgress.style.display = "block";
        }

        function Confirm() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("Confirm to Generate ???")) {
                confirm_value.value = "Yes";
            } else {
                confirm_value.value = "No";
            }
            document.forms[0].appendChild(confirm_value);
        }
        function DelRecord() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("Are you want to delete ?")) {
                confirm_value.value = "Yes";
            } else {
                confirm_value.value = "No";
            }
            document.forms[0].appendChild(confirm_value);
        }
    </script>
</asp:Content>
