<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Main.Master" CodeBehind="frm_MoldList.aspx.vb" Inherits="PN_SYSTEM.frm_MoldList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form2" runat="server">
        <!-- page content -->
        <div class="">
            <div class="page-title">
                <div class="title_left">
                    <h3>Mold List</h3>
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
                                                <asp:BoundField DataField="ML_PART_NO" HeaderText="ML Part No.">
                                                    <ItemStyle Width="150px" Wrap="False" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="ML_PART_NAME" HeaderText="ML Part Name">
                                                    <ItemStyle Width="150px" Wrap="False" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="ML_MFG_NO" HeaderText="ML MFG No.">
                                                    <ItemStyle Width="150px" Wrap="False" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="ML_NO_Parent" HeaderText="ML No. parent">
                                                    <HeaderStyle Wrap="False" />
                                                    <ItemStyle Width="120px" Wrap="False" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="ML_MOLD_NO" HeaderText="ML Mold No." />
                                                <asp:BoundField DataField="ML_PROCESS" HeaderText="ML Process" />
                                                <asp:BoundField DataField="ML_CAVITY" HeaderText="ML Cavity" />
                                                <asp:BoundField DataField="ML_CAVITY_PER_MOLD" HeaderText="ML Cavity per mold" />
                                                <asp:BoundField DataField="ML_WIEGHT_KG" HeaderText="ML Wight KG" />
                                                <asp:BoundField DataField="ML_PRODUCT_FROM" HeaderText="ML Product From" />
                                                <asp:BoundField DataField="ML_CLEANING_PERIOD_DAY" HeaderText="ML Cleaning Period day" />
                                                <asp:BoundField DataField="ML_CUSTOMER" HeaderText="ML Customer" />
                                                <asp:BoundField DataField="ML_RECIVED_DATE" HeaderText="ML Recived Date" />
                                                <asp:BoundField DataField="ML_MC_SETTING" HeaderText="ML Matchine Setting" />
                                                <asp:BoundField DataField="ML_WC_CODE" HeaderText="ML Workcenter Code" />
                                                <asp:BoundField DataField="ML_STATUS" HeaderText="ML Status" />
                                                <asp:BoundField DataField="ML_ASSET" HeaderText="ML Asset" />
                                                <asp:BoundField DataField="ML_BOI" HeaderText="ML BOI" />
                                                <asp:BoundField DataField="ML_LASTUPDATE" HeaderText="MI Lastupdate" />
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
