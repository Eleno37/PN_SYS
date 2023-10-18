<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Main.Master" CodeBehind="frm_Metal_MC.aspx.vb" Inherits="PN_SYSTEM.frm_Metal_MC" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form2" runat="server">
        <!-- page content -->
        <div class="">
            <div class="page-title">
                <div class="title_left">
                    <h3>Metal Part Machine Machching</h3>
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
                                                <asp:BoundField DataField="MFG_No" HeaderText="MFG No.">
                                                    <ItemStyle Width="200px" Wrap="False" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="IFS_Code_no" HeaderText="IFS Code" />
                                                <asp:BoundField DataField="IFS_Code_X_no" HeaderText="IFS code x" />
                                                <asp:BoundField DataField="For_link_capto_Riouting" HeaderText="link Rounting">
                                                    <HeaderStyle Wrap="False" />
                                                    <ItemStyle Width="120px" Wrap="False" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Type_part" HeaderText="Type Part" />
                                                <asp:BoundField DataField="MC" HeaderText="Machine" />
                                                <asp:BoundField DataField="Supplier_PcsBox" HeaderText="Supplier Piece/Box" />
                                                <asp:BoundField DataField="Shot" HeaderText="Shot" />
                                                <asp:BoundField DataField="SecShot" HeaderText="SecShot" />
                                                <asp:BoundField DataField="SecPcs" HeaderText="Sec Piece" />
                                                <asp:BoundField DataField="IFS_Code_X_no_ori" HeaderText="IFS Code x" />
                                                <asp:BoundField DataField="For_link_capto_Riouting_ori" HeaderText="For link Routing" />
                                                <asp:BoundField DataField="AdhProcess_MC_No" HeaderText="AdhProcess_MC_No" />
                                                <asp:BoundField DataField="Resouce_Code" HeaderText="Resouce Code" />
                                                <asp:BoundField DataField="Resource_description" HeaderText="Resource Description" />
                                                <asp:BoundField DataField="AdhProcess1" HeaderText="Adhesive Process" />
                                                <asp:BoundField DataField="Adhesive_Type" HeaderText="Adhesive Type" />
                                                <asp:BoundField DataField="Ahd_PcsBox" HeaderText="Adhesive Piece/box" />
                                                <asp:BoundField DataField="Pcsshot_of_Adh" HeaderText="Adhesive Piece/box" />
                                                <asp:BoundField DataField="CT_Sec" HeaderText="Cycle Time" />
                                                <asp:BoundField DataField="MCsecPerpcs" HeaderText="Machine (second/piece)" />
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
