<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Main.Master" CodeBehind="frm_mc_losstime_monitor.aspx.vb" Inherits="PN_SYSTEM.frm_mc_losstime_monitor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form2" runat="server">
        <!-- page content -->
        <div class="">
            <div class="clearfix"></div>
            <div class="row">
                <div class="page-title" style="margin: 0px 0px 0px 10px;">

                    <h3>MC Loss time</h3>
                </div>
                <div class="col-md-6 col-sm-12 ">
                    <div class="x_panel">
                        <%--<div class="x_title">
                            <h2>Search</h2>

                            <div class="clearfix"></div>
                        </div>--%>
                        <div class="x_content">

                            <div class="form-horizontal form-label-left">

                                <div class="form-group row">

                                    <div class="col-sm-12">

                                        <div class="form-group row">
                                            <div class="col-md-2 col-sm-3 ">
                                                <label class="col-form-label col-md-1 col-sm-3 ">Search</label>
                                            </div>
                                            <div class="col-md-10 col-sm-3 ">
                                                <asp:TextBox ID="txt_search" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <div class="col-md-2 col-sm-3 ">
                                                <label class="col-form-label col-md-1 col-sm-1 ">Year</label>
                                            </div>
                                            <div class="col-md-3 col-sm-3 ">
                                                <asp:DropDownList ID="ddlYear" runat="server" CssClass="form-control" Height="30px"></asp:DropDownList>
                                            </div>
                                            <div class="col-md-2 col-sm-3 ">
                                                <label class="col-form-label col-md-1 col-sm-1 ">Month</label>
                                            </div>
                                            <div class="col-md-2 col-sm-1 ">
                                                <asp:DropDownList ID="ddlmonth" runat="server" CssClass="form-control" Height="30px">
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
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                                    <div class="form-group row">
                                        <div class="col-md-1 col-sm-1  offset-md-4">
                                            <asp:Button ID="btn_search" runat="server" Text="Search" CssClass="btn btn-primary" />
                                        </div>
                                        <div class="col-md-1 col-sm-1  offset-md-1">
                                            <asp:Button ID="btn_export" runat="server" Text="Export to csv" CssClass="btn" Style="background-color: #DC7E0E;" ForeColor="White" />
                                            <%--<button class="btn btn-default" type="button">Go!</button>--%>
                                        </div>
                                    </div>
                    </div>
                </div>
            </div>
            <div class="item form-group">
                <label
                    class="col-form-label col-md-1 col-sm-1 label-align"
                    for="first-name">
                    Show row
                </label>
                <div class="col-md-1 col-sm-1">
                    <asp:DropDownList ID="ddl_countrow" runat="server" AutoPostBack="True" CssClass="form-control">
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>25</asp:ListItem>
                        <asp:ListItem>50</asp:ListItem>
                        <asp:ListItem>100</asp:ListItem>
                        <asp:ListItem>200</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
        </div>

        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12  ">
                <div class="x_panel">
                    <div class="x_content">
                        <%--  <div class="row">
                                <div class="col-sm-12">--%>
                        <div class="card-box table-responsive">

                            <asp:GridView ID="gv_detail" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered" AllowSorting="True">
                                <Columns>
                                    <asp:BoundField DataField="month_year" HeaderText="month_year" />
                                    <asp:BoundField DataField="ltmc" HeaderText="ltmc" />
                                    <asp:BoundField DataField="ltcode" HeaderText="ltcode" />
                                    <asp:BoundField DataField="ltshift" HeaderText="ltshift">
                                        <HeaderStyle Wrap="False" />
                                        <ItemStyle Width="120px" Wrap="False" />
                                    </asp:BoundField>

                                    <asp:BoundField DataField="description" HeaderText="description" />
                                    <asp:BoundField DataField="Line" HeaderText="Line" />
                                    <asp:BoundField DataField="Pro_Group" HeaderText="Pro_Group" />
                                    <asp:BoundField DataField="Work_Center" HeaderText="Work_Center" />
                                    <asp:BoundField DataField="Len" HeaderText="Len" />
                                    <asp:BoundField DataField="Work_Des" HeaderText="Work_Des" />
                                    <asp:BoundField DataField="LossTimeName" HeaderText="LossTimeName" />
                                    <asp:BoundField DataField="Loss_Time_Min" HeaderText="Loss_Time_Min" />
                                    <asp:BoundField DataField="Loss_Time_HR" HeaderText="Loss_Time_HR" />

                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
