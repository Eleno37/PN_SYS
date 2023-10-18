<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Main.Master" CodeBehind="frm_itemmaster.aspx.vb" Inherits="PN_SYSTEM.frm_itemmaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- page content -->
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3>ITEM MASTER</h3>
            </div>

            <div class="title_right">
                <div class="col-md-5 col-sm-5   form-group pull-right top_search">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search for...">
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="button">Go!</button>
                        </span>
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
                                    <form id="form1" runat="server">
                                        <asp:GridView ID="gv_detail" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered" AllowPaging="True" PageSize="14" OnPageIndexChanging="OnPageIndexChanging" AllowSorting="True">
                                            <Columns>
                                                <asp:BoundField DataField="IF_ID" HeaderText="IF_ID" />
                                                <asp:BoundField DataField="IF_PART_NO" HeaderText="IF_PART_NO" />
                                                <asp:BoundField DataField="IF_DESCRIPTION" HeaderText="IF_DESCRIPTION">
                                                    <HeaderStyle Wrap="False" />
                                                    <ItemStyle Width="120px" Wrap="False" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="IF_CONTRACT" HeaderText="IF_CONTRACT" />
                                                <asp:BoundField DataField="IF_TYPE_CODE" HeaderText="IF_TYPE_CODE" />
                                                <asp:BoundField DataField="IF_PART_PRODUCT_FAMILY" HeaderText="IF_PART_PRODUCT_FAMILY" />
                                                <asp:BoundField DataField="IF_PLANNER_BUYER" HeaderText="IF_PLANNER_BUYER" />
                                                <asp:BoundField DataField="IF_UNIT_MEAS" HeaderText="IF_UNIT_MEAS" />
                                                <asp:BoundField DataField="IF_TYPE_DESIGNATION" HeaderText="IF_TYPE_DESIGNATION" />
                                                <asp:BoundField DataField="IF_LEAD_TIME_CODE" HeaderText="IF_LEAD_TIME_CODE" />
                                                <asp:BoundField DataField="IF_LOT_SIZE" HeaderText="IF_LOT_SIZE" />
                                                <asp:BoundField DataField="IF_MAX_ORDER_QTY" HeaderText="IF_MAX_ORDER_QTY" />
                                                <asp:BoundField DataField="IF_MIN_ORDER_QTY" HeaderText="IF_MIN_ORDER_QTY" />
                                                <asp:BoundField DataField="IF_SAFETY_STOCK" HeaderText="IF_SAFETY_STOCK" />
                                                <asp:BoundField DataField="IF_PART_STATUS" HeaderText="IF_PART_STATUS" />
                                                <asp:BoundField DataField="IF_STANDARD_PACK" HeaderText="IF_STANDARD_PACK" />
                                                <asp:BoundField DataField="IF_PACKING_STANDARD" HeaderText="IF_PACKING_STANDARD" />
                                            </Columns>
                                        </asp:GridView>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /page content -->
</asp:Content>
