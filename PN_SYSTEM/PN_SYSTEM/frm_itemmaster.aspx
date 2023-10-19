<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Main.Master" CodeBehind="frm_itemmaster.aspx.vb" Inherits="PN_SYSTEM.frm_itemmaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .table-bordered {
            margin-top: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- page content -->
    <div class="">
        <form id="form1" runat="server">
            <div class="page-title">
                <div class="title_left">
                    <h3>ITEM MASTER</h3>
                </div>

                <div class="title_right">
                    <div class="col-md-5 col-sm-5   form-group pull-right top_search">
                        <div class="input-group">
                            <%--<input type="text" class="form-control" placeholder="Search for...">--%>
                            <asp:TextBox ID="txt_search" runat="server" CssClass="form-control"></asp:TextBox>
                            <span class="input-group-btn">
                                <asp:Button ID="btn_search" runat="server" Text="Go!" class="btn btn-default" />
                                <%-- <button class="btn btn-default" type="button">Go!</button>--%>
                                <br>
                            </span>
                        </div>
                    </div>
                </div>

            </div>

            <div class="row" style="margin-bottom: 10px;">
                <div class="center" style="padding-top: 5px; text-align: center;">
                    <label>Show</label>
                </div>
                <div class="col-sm-1">
                    <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" CssClass="form-control">
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>25</asp:ListItem>
                        <asp:ListItem>50</asp:ListItem>
                        <asp:ListItem>100</asp:ListItem>
                        <asp:ListItem>200</asp:ListItem>

                    </asp:DropDownList>
                </div>
                <div class="center" style="vertical-align: central; padding-top: 5px">
                    <label>Entries</label>
                </div>
                <div class="col-md-5 col-sm-5   form-group pull-right">
                    <asp:Button ID="btn_import" runat="server" Text="IMPORT" class="btn btn-success" Visible="false" />
                    <asp:Button ID="btn_export" runat="server" Text="EXPORT" class="btn btn-info" Visible="false" />

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
                                                <asp:BoundField DataField="IF_ID" HeaderText="ID" />
                                                <asp:BoundField DataField="IF_PART_NO" HeaderText="PART NO" />
                                                <asp:BoundField DataField="IF_DESCRIPTION" HeaderText="DESCRIPTION">
                                                    <HeaderStyle Wrap="False" />
                                                    <ItemStyle Width="120px" Wrap="False" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="IF_CONTRACT" HeaderText="CONTRACT" />
                                                <asp:BoundField DataField="IF_TYPE_CODE" HeaderText="TYPE CODE" />
                                                <asp:BoundField DataField="IF_PART_PRODUCT_FAMILY" HeaderText="PART PRODUCT FAMILY" />
                                                <asp:BoundField DataField="IF_PLANNER_BUYER" HeaderText="PLANNER BUYER" />
                                                <asp:BoundField DataField="IF_UNIT_MEAS" HeaderText="UNIT MEAS" />
                                                <asp:BoundField DataField="IF_TYPE_DESIGNATION" HeaderText="TYPE DESIGNATION" />
                                                <asp:BoundField DataField="IF_LEAD_TIME_CODE" HeaderText="LEAD TIME CODE" />
                                                <asp:BoundField DataField="IF_LOT_SIZE" HeaderText="LOT SIZE" />
                                                <asp:BoundField DataField="IF_MAX_ORDER_QTY" HeaderText="MAX ORDER QTY" />
                                                <asp:BoundField DataField="IF_MIN_ORDER_QTY" HeaderText="MIN ORDER QTY" />
                                                <asp:BoundField DataField="IF_SAFETY_STOCK" HeaderText="SAFETY STOCK" />
                                                <asp:BoundField DataField="IF_PART_STATUS" HeaderText="PART STATUS" />
                                                <asp:BoundField DataField="IF_STANDARD_PACK" HeaderText="STANDARD PACK" />
                                                <asp:BoundField DataField="IF_PACKING_STANDARD" HeaderText="PACKING STANDARD" />
                                            </Columns>
                                        </asp:GridView>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <!-- /page content -->
</asp:Content>
