<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Main.Master" CodeBehind="frm_curing_mold.aspx.vb" Inherits="PN_SYSTEM.frm_curing_mold" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form2" runat="server">
        <!-- page content -->
        <div class="">
            <div class="page-title">
                <div class="title_left">
                    <h3>Curing Mold Matching</h3>
                </div>

                <div class="title_right">
                    <div class="col-md-5 col-sm-5   form-group pull-right top_search">
                        <div class="input-group">
                            <%--<input type="text" class="form-control" placeholder="Search for...">--%>
                            <asp:TextBox ID="txt_search" runat="server" CssClass="form-control"></asp:TextBox>
                            <span class="input-group-btn">
                                <asp:Button ID="btn_search" runat="server" Text="Go!" class="btn btn-default" />
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
                                                <asp:BoundField DataField="List_Part_by_Item_or_link_Capacity" HeaderText="Part by item" />
                                                <asp:BoundField DataField="Part_Curing_by_Item_MFGno" HeaderText="Part curing by itemMFG" />
                                                <asp:BoundField DataField="Part_Curing_by_ItemIFS_no" HeaderText="Part Curing by itemIFS" />
                                                <asp:BoundField DataField="AVGroup" HeaderText="AV Group">
                                                    <HeaderStyle Wrap="False" />
                                                    <ItemStyle Width="120px" Wrap="False" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Mold_Type_set_no" HeaderText="Mold Type" />
                                                <asp:BoundField DataField="Resource_name" HeaderText="Resource Name" />
                                                <asp:BoundField DataField="Mold_Qty" HeaderText="Mold Quantity" />
                                                <asp:BoundField DataField="Cav" HeaderText="Cav" />
                                                <asp:BoundField DataField="Priority" HeaderText="Priority" />
                                                <asp:BoundField DataField="Size_mold" HeaderText="Size Mold" />
                                                <asp:BoundField DataField="Volumn_Rubber" HeaderText="Volumn Rubber" />
                                                <asp:BoundField DataField="Pressure" HeaderText="Pressure" />
                                                <asp:BoundField DataField="Molds_type" HeaderText="Mold Type" />
                                                <asp:BoundField DataField="TYPE_MC" HeaderText="Type Machine" />
                                                <asp:BoundField DataField="Secshot" HeaderText="Secshot" />
                                                <asp:BoundField DataField="Cleaning_Moldshift" HeaderText="Cleaning Mold Shift" />
                                                <asp:BoundField DataField="Time_for_Cleaninghr" HeaderText="Time for Cleaning (Hr)" />
                                                <asp:BoundField DataField="LastUpdate" HeaderText="Lastupdate" />
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
