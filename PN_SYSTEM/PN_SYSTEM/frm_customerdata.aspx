<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Main.Master" CodeBehind="frm_customerdata.aspx.vb" Inherits="PN_SYSTEM.frm_customerdata" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form2" runat="server">
        <!-- page content -->
        <div class="">
            <div class="clearfix"></div>
            <div class="row">
                <div class="page-title">

                    <h3>Customer Data</h3>
                </div>


                <div class="col-md-6 col-sm-12 ">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>Search</h2>

                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">

                            <div class="form-horizontal form-label-left">

                                <div class="form-group row">


                                    <div class="col-sm-12">

                                        <div class="form-group row">
                                            <label class="col-form-label col-md-4 col-sm-3 ">Search By Customer Code, Customer Name And Customer Short Name</label>
                                            <div class="col-md-8 col-sm-3 ">
                                                <asp:TextBox ID="txt_search" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <div class="col-md-9 col-sm-9  offset-md-3">
                                                <asp:Button ID="btn_search" runat="server" Text="Search" CssClass="btn btn-primary" />
                                                <asp:Button ID="btn_export" runat="server" Text="Export to csv" CssClass="btn" Style="background-color: #DC7E0E;" ForeColor="White" />
                                                <%--<button class="btn btn-default" type="button">Go!</button>--%>
                                            </div>
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
                            <h2>Import Customer Data</h2>

                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">

                            <div class="form-horizontal form-label-left">

                                <div class="form-group row ">
                                    <div class="col-md-9 col-sm-9  offset-md-3">
                                        <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" ForeColor="#337CCF"
                                            NavigateUrl="~/Template/Template_Customer.csv" CssClass="txt_candara_16" Font-Size="Medium">> > Download Template (.CSV) < <</asp:HyperLink>
                                    </div>
                                    <div class="col-sm-12">
                                        <div class="input-group">
                                            <asp:FileUpload CssClass="form-control" ID="Fileupload_customerdata" runat="server" />


                                        </div>

                                        <div class="col-md-9 col-sm-9  offset-md-5">
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
                    <asp:ListItem>250</asp:ListItem>
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
                                            <asp:BoundField DataField="customer_code" HeaderText="Customer Code" />
                                            <asp:BoundField DataField="customer_name" HeaderText="Customer Name" />
                                            <asp:BoundField DataField="customer_short_name" HeaderText="Customer Short Name" />
                                            <asp:BoundField DataField="file_import" HeaderText="File Import">
                                                <HeaderStyle Wrap="False" />
                                                <ItemStyle Width="120px" Wrap="False" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="update_by" HeaderText="Update By" />
                                            <asp:BoundField DataField="record_date" HeaderText="Record Date" />
                                            <asp:BoundField DataField="created_by" HeaderText="Created By" />
                                            <asp:BoundField DataField="update_time" HeaderText="Update Time" />
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
</asp:Content>
