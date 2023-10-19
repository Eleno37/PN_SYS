<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Main.Master" CodeBehind="frm_working_calendar.aspx.vb" Inherits="PN_SYSTEM.frm_working_calendar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form2" runat="server">
        <!-- page content -->
        <div class="">
            <div class="clearfix"></div>
            <div class="row">

                <div class="alert alert-success alert-dismissible " style="width: 100%" id="div_sucess" visible="false" role="alert" runat="server">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                    <strong>Success!</strong>
                    <asp:Label ID="lb_sucess" runat="server" Text="..."></asp:Label>
                </div>

                <div class="alert alert-danger alert-dismissible " style="width: 100%" id="div_alert" visible="false" role="alert" runat="server">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                    <strong>Alert!</strong>
                    <asp:Label ID="lb_alert" runat="server" Text="..."></asp:Label>
                </div>

                <div class="alert alert-warning alert-dismissible " style="width: 100%" id="div_warning" visible="false" role="alert" runat="server">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                    <strong>Alert!</strong>
                    <asp:Label ID="lb_warning" runat="server" Text="..."></asp:Label>
                </div>

                <div class="page-title">

                    <h3>Working Calendar</h3>

                </div>

                <%--<table>
                <tr>
                    <td>Year:
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" CssClass="form-control" Height="26px">
                        </asp:DropDownList>
                        &nbsp;
                        Month:
                        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" CssClass="form-control" Height="26px">
                        </asp:DropDownList>

                    </td>
                </tr>
            </table>--%>
                <div class="col-md-6 col-sm-12 ">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>Search</h2>

                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">

                            <div class="form-horizontal form-label-left">

                                <div class="form-group row">
                                    <label class="col-sm-1 col-form-label">Year:</label>

                                    <div class="col-sm-10">
                                        <div class="input-group">
                                            <asp:DropDownList ID="ddlYear" runat="server" CssClass="form-control" Height="30px">
                                            </asp:DropDownList>
                                            <label class="col-sm-2 col-form-label">Month:</label>
                                            <asp:DropDownList ID="ddlYYYYMM" runat="server" AutoPostBack="False" CssClass="form-control" Height="29px" Width="100">
                                                <asp:ListItem>ALL</asp:ListItem>
                                                <asp:ListItem>01</asp:ListItem>
                                                <asp:ListItem>02</asp:ListItem>
                                                <asp:ListItem>03</asp:ListItem>
                                                <asp:ListItem>04</asp:ListItem>
                                                <asp:ListItem>05</asp:ListItem>
                                                <asp:ListItem>06</asp:ListItem>
                                                <asp:ListItem>07</asp:ListItem>
                                                <asp:ListItem>08</asp:ListItem>
                                                <asp:ListItem>09</asp:ListItem>
                                                <asp:ListItem>10</asp:ListItem>
                                                <asp:ListItem>11</asp:ListItem>
                                                <asp:ListItem>12</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>

                                        <div class="input-group">
                                            <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control"></asp:TextBox>
                                            <span class="input-group-btn">
                                                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary" />
                                                <asp:Button ID="btn_export" runat="server" Text="Export to csv" CssClass="btn" Style="background-color: #DC7E0E;" ForeColor="White" />
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-6 col-sm-12 ">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>Import Calendar</h2>

                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">

                            <div class="form-horizontal form-label-left">

                                <div class="form-group row ">
                                    <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" ForeColor="#006600"
                                        NavigateUrl="~/Template/Working_Calendar_Template.csv" CssClass="txt_candara_16" Font-Size="Medium">> > Download Template (.CSV) < <</asp:HyperLink>

                                    <div class="col-sm-10">
                                        <div class="input-group">
                                            <asp:FileUpload CssClass="form-control" ID="FileUpload1" runat="server" />


                                        </div>
                                        <div class="input-group">

                                            <span class="input-group-btn">

                                                <asp:Button ID="btn_import" runat="server" Text="Import" CssClass="btn btn-success" Height="35px" />
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12  ">
                <div class="x_panel">
                    <div class="x_content">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="card-box table-responsive">

                                    <asp:GridView ID="gv_detail" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered" AllowSorting="True">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Delete">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCust" runat="server" Text='<%# Eval("customer_no") %>' Visible="false"></asp:Label>
                                                    <asp:ImageButton ID="ImgDel" runat="server" CommandArgument='<%# Eval("month") %>'
                                                        CommandName="DeleteRec" ImageUrl="~/image/delete.png" OnClientClick="return DelRecord()" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Month" HeaderText="Month" />
                                            <asp:BoundField DataField="customer_no" HeaderText="Customer No." />
                                            <asp:BoundField DataField="Customer_name" HeaderText="Customer Name" />
                                            <asp:BoundField DataField="TOTAL_DAY" HeaderText="Total Day" ItemStyle-BackColor="#9ED3FF" FooterStyle-VerticalAlign="Middle">
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Width="120px" Wrap="False" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="D1" HeaderText="D1" />
                                            <asp:BoundField DataField="D2" HeaderText="D2" />
                                            <asp:BoundField DataField="D3" HeaderText="D3" />
                                            <asp:BoundField DataField="D4" HeaderText="D4" />
                                            <asp:BoundField DataField="D5" HeaderText="D5" />
                                            <asp:BoundField DataField="D6" HeaderText="D6" />
                                            <asp:BoundField DataField="D7" HeaderText="D7" />
                                            <asp:BoundField DataField="D8" HeaderText="D8" />
                                            <asp:BoundField DataField="D9" HeaderText="D9" />
                                            <asp:BoundField DataField="D10" HeaderText="D10" />
                                            <asp:BoundField DataField="D11" HeaderText="D11" />
                                            <asp:BoundField DataField="D12" HeaderText="D12" />
                                            <asp:BoundField DataField="D13" HeaderText="D13" />
                                            <asp:BoundField DataField="D14" HeaderText="D14" />
                                            <asp:BoundField DataField="D15" HeaderText="D15" />
                                            <asp:BoundField DataField="D16" HeaderText="D16" />
                                            <asp:BoundField DataField="D17" HeaderText="D17" />
                                            <asp:BoundField DataField="D18" HeaderText="D18" />
                                            <asp:BoundField DataField="D19" HeaderText="D19" />
                                            <asp:BoundField DataField="D20" HeaderText="D20" />
                                            <asp:BoundField DataField="D21" HeaderText="D21" />
                                            <asp:BoundField DataField="D22" HeaderText="D22" />
                                            <asp:BoundField DataField="D23" HeaderText="D23" />
                                            <asp:BoundField DataField="D24" HeaderText="D24" />
                                            <asp:BoundField DataField="D25" HeaderText="D25" />
                                            <asp:BoundField DataField="D26" HeaderText="D26" />
                                            <asp:BoundField DataField="D27" HeaderText="D27" />
                                            <asp:BoundField DataField="D28" HeaderText="D28" />
                                            <asp:BoundField DataField="D29" HeaderText="D29" />
                                            <asp:BoundField DataField="D30" HeaderText="D30" />
                                            <asp:BoundField DataField="D31" HeaderText="D31" />
                                        </Columns>
                                    </asp:GridView>
                                    <asp:GridView ID="gvImport" runat="server" Visible="false">
                                    </asp:GridView>
                                    <asp:GridView ID="gvExport" runat="server" Visible="false">
                                    </asp:GridView>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </form>
    <script type="text/javascript">

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
