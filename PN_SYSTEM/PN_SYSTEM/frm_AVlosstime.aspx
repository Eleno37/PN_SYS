<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Main.Master" CodeBehind="frm_AVlosstime.aspx.vb" Inherits="PN_SYSTEM.frm_AVlosstime" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <!-- page content -->
    <form id="form3" runat="server">
        <div class="">
            <div class="page-title">
                <div class="title_left">
                    <h3>AV Losstime</h3>
                </div>

                <div class="title_right">
                    <div class="col-md-5 col-sm-5   form-group pull-right top_search">
                        <div class="input-group">

                            <script>
                                function timeFunctionLong(input) {
                                    setTimeout(function () {
                                        input.type = 'text';
                                    }, 60000);
                                }
                            </script>
                            <%--<input type="text" class="form-control" placeholder="Search for...">--%>
                            <asp:TextBox ID="txtDate" runat="server" class="date-picker form-control" placeholder="dd-mm-yyyy" type="text" required="required" onfocus="this.type='date'" onmouseover="this.type='date'" onclick="this.type='date'" onblur="this.type='text'" onmouseout="timeFunctionLong(this)"></asp:TextBox>
                            <span class="input-group-btn">
                                <asp:Button ID="btn_search" runat="server" Text="Search" class="btn btn-default" />
                                <%--<button class="btn btn-default" type="button">Go!</button>--%>
                            </span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row" style="margin-bottom: 10px;">
                <div class="Center" style="padding-top: 5px; text-align: center;">
                    <label>Show</label>
                </div>
                <div class="col-sm-1">
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" CssClass="form-control">
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>25</asp:ListItem>
                        <asp:ListItem>50</asp:ListItem>
                        <asp:ListItem>100</asp:ListItem>
                        <asp:ListItem>200</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="Center" style="vertical-align: central; padding-top: 5px">
                    <label>Entries</label>
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
                                                <asp:BoundField DataField="ltdate" HeaderText="ltdate" />
                                                <asp:BoundField DataField="ltmc" HeaderText="ltmc" />
                                                <asp:BoundField DataField="ltcode" HeaderText="ltcode" />
                                                <asp:BoundField DataField="ltshift" HeaderText="ltshift">
                                                    <HeaderStyle Wrap="False" />
                                                    <ItemStyle Width="120px" Wrap="False" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="ltdetail" HeaderText="ltdetail" />
                                                <asp:BoundField DataField="ltcreatby" HeaderText="ltcreatby" />
                                                <asp:BoundField DataField="ltlastupdate" HeaderText="ltlastupdate" />
                                            </Columns>
                                        </asp:GridView>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

</asp:Content>
