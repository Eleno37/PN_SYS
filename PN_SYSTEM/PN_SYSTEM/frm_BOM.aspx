﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Main.Master" CodeBehind="frm_BOM.aspx.vb" Inherits="PN_SYSTEM.frm_BOM" %>

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
                    <h3>BOM MASTER</h3>
                </div>

                <div class="title_right">
                    <div class="col-md-5 col-sm-5   form-group pull-right top_search">
                        <div class="input-group">
                            <%--<input type="text" class="form-control" placeholder="Search for...">--%>
                            <asp:TextBox ID="txt_serch" placeholder="Search for..." runat="server" CssClass="form-control"></asp:TextBox>
                            <span class="input-group-btn">
                                <asp:Button ID="btn_search" runat="server" type="button" Text="Search" class="btn btn-default" />
                                <%--<button class="btn btn-default" type="button">Go!</button>--%>

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
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" CssClass="form-control">
                        <%--<asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>25</asp:ListItem>
                        <asp:ListItem>50</asp:ListItem>--%>
                        <asp:ListItem>100</asp:ListItem>
                        <asp:ListItem>200</asp:ListItem>
                        <asp:ListItem>250</asp:ListItem>
                        <asp:ListItem>250</asp:ListItem>
                        <asp:ListItem>250</asp:ListItem>
                        <asp:ListItem>250</asp:ListItem>
                        <asp:ListItem>250</asp:ListItem>
                        <asp:ListItem>250</asp:ListItem>
                        <asp:ListItem>250</asp:ListItem>
                        <asp:ListItem>250</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="center" style="vertical-align: central; padding-top: 5px">
                    <label>Entries</label>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="row">
                <div class="col-md-12 col-sm-12  ">
                    <div class="x_panel">
                        <div class="row">
                            <div class="x_content">
                                <div class="col-sm-12">
                                    <div class="card-box table-responsive">
                                        <asp:GridView ID="gv_detail" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered" AllowSorting="True">
                                            <Columns>
                                                <asp:BoundField DataField="Top_Level_Part_IFS_Code_X" HeaderText="TopLevel" />
                                                <asp:BoundField DataField="Contract" HeaderText="contract" />
                                                <asp:BoundField DataField="Lv" HeaderText="Level">
                                                    <ItemStyle Width="120px" Wrap="False" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Parent_Part_IFS_Code_X" HeaderText="ParentsPart" />
                                                <asp:BoundField DataField="Child_Part_Code_X" HeaderText="ChildPart" />
                                                <asp:BoundField DataField="QTY" HeaderText="Qty" />
                                                <asp:BoundField DataField="Unit" HeaderText="UNIT" />
                                                <asp:BoundField DataField="Product_fam" HeaderText="Product Family">
                                                    <ItemStyle Width="120px" Wrap="False" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Operation_no" HeaderText="Operation" />
                                                <asp:BoundField DataField="Process_Group" HeaderText="Process Group" />
                                                <asp:BoundField DataField="Process_Descript" HeaderText="Process Description" />
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
        </form>
    </div>
    <!-- /page content -->
</asp:Content>
