<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Main.Master" CodeBehind="frm_customer_forecast_multi.aspx.vb" Inherits="PN_SYSTEM.frm_customer_forecast_multi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form2" runat="server">
        <!-- page content -->
        <div class="">
            <div class="clearfix"></div>
            <div class="row">
                <div class="page-title">

                    <h3>Customer Forecast</h3>
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
                                            <label class="col-form-label col-md-1 col-sm-3 ">Search: </label>
                                            <div class="col-md-10 col-sm-3 ">
                                                <asp:TextBox ID="txt_search" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-form-label col-md-1 col-sm-1 ">Year :</label>
                                            <div class="col-md-2 col-sm-1 ">
                                                <asp:DropDownList ID="ddlYear" runat="server" CssClass="form-control" Height="30px"></asp:DropDownList>
                                            </div>
                                            <label class="col-form-label col-md-1 col-sm-1 ">Month :</label>
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
                                            <label class="col-form-label col-md-1 col-sm-3 ">Plant :</label>
                                            <div class="col-md-2 col-sm-1 ">
                                                <asp:DropDownList ID="ddl_custexport" runat="server" CssClass="form-control" Height="30px">
                                                    <asp:ListItem Value="0">ALL</asp:ListItem>
                                                    <asp:ListItem>ESIE</asp:ListItem>
                                                    <asp:ListItem>IPP</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <label class="col-form-label col-md-1 col-sm-3 ">Customer:</label>
                                            <div class="col-md-2 col-sm-3 ">
                                                <asp:DropDownList ID="dll_customer" runat="server" CssClass="form-control" Height="30px">
                                                    <asp:ListItem>ALL</asp:ListItem>
                                                    <asp:ListItem>Other</asp:ListItem>
                                                    <asp:ListItem>FTM</asp:ListItem>
                                                </asp:DropDownList>
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
                                            NavigateUrl="~/Template/Template_Customer.csv" CssClass="txt_candara_16" Font-Size="Medium">
                                            > > Download Template (.CSV) < <</asp:HyperLink>
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
                <asp:DropDownList ID="ddl_countrow" runat="server" AutoPostBack="True" CssClass="form-control">
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
                                        <columns>
                                            <asp:BoundField DataField="month" HeaderText="month" />
                                            <asp:BoundField DataField="file_import" HeaderText="file_import" />
                                            <asp:BoundField DataField="update_by" HeaderText="update_by" />
                                            <asp:BoundField DataField="record_date" HeaderText="record_date">
                                                <headerstyle wrap="False" />
                                                <itemstyle width="120px" wrap="False" />
                                            </asp:BoundField>

                                        </columns>
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
