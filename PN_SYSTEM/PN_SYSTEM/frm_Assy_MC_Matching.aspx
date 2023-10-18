<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Main.Master" CodeBehind="frm_Assy_MC_Matching.aspx.vb" Inherits="PN_SYSTEM.frm_Assy_MC_Matching" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form2" runat="server">
        <!-- page content -->
        <div class="">
            <div class="page-title">
                <div class="title_left">
                    <h3>Assy Machine Matching</h3>
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
                                                <asp:BoundField DataField="For_Link_Cap_to_Routing" HeaderText="For link Cap to routing" />
                                                <asp:BoundField DataField="MFG_by_Item" HeaderText="MFG by item">
                                                    <ItemStyle Width="120px" Wrap="False" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="MFG_No_by_package" HeaderText="MFG No. by package">
                                                    <ItemStyle Width="120px" Wrap="False" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="IFS_code_by_item" HeaderText="IFS code by item">
                                                    <HeaderStyle Wrap="False" />
                                                    <ItemStyle Width="120px" Wrap="False" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="IFS_code_by_package" HeaderText="IFS code by package" />
                                                <asp:BoundField DataField="IFS_code_X_by_package" HeaderText="IFS code x by package" />
                                                <asp:BoundField DataField="Process" HeaderText="Process" />
                                                <asp:BoundField DataField="CT_Assembly_time" HeaderText="Cycle Time Assembly" />
                                                <asp:BoundField DataField="Assembly_Cap" HeaderText="Assembly cap" />
                                                <asp:BoundField DataField="Resource_M_C" HeaderText="Resource Machine" />
                                                <asp:BoundField DataField="M_C_description" HeaderText="Machine Description" />
                                                <asp:BoundField DataField="Main_M_C" HeaderText="Main Machine" />
                                                <asp:BoundField DataField="Support_M_C" HeaderText="Support Machine" />
                                                <asp:BoundField DataField="Priority" HeaderText="Priority" />
                                                <asp:BoundField DataField="LastUpdate" HeaderText="Last Update" />
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
