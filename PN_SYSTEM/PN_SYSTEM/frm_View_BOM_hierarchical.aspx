<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Main.Master" CodeBehind="frm_View_BOM_hierarchical.aspx.vb" Inherits="PN_SYSTEM.frm_View_BOM_hierarchical" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- page content -->

    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3>BOM Hierarchical</h3>
            </div>
        </div>

        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12 ">
                <div class="x_panel">
                    <div class="x_title">
                        <%--<h2>Form Design <small>different form elements</small></h2>--%>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a class="dropdown-item" href="#">Settings 1</a>
                                    </li>
                                    <li><a class="dropdown-item" href="#">Settings 2</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a class="close-link"><i class="fa fa-close"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <br />
                        <form id="demo-form2" class="form-horizontal form-label-left">

                            <div class="item form-group">
                                <label class="col-form-label col-md-3 col-sm-3 label-align" for="first-name">
                                    MFG NO. <span class="required">(xx0000)</span>
                                </label>
                                <div class="col-md-6 col-sm-6 ">
                                    <input type="text" id="first-name" required="required" class="form-control ">
                                </div>
                            </div>
                            <div class="ln_solid"></div>
                            <div class="item form-group">
                                <div class="col-md-6 col-sm-6 offset-md-3">
                                    <%--<button class="btn btn-primary" type="button">Cancel</button>--%>
                                    <button type="submit" class="btn btn-success">Submit</button>
                                    <button class="btn btn-primary" type="reset">Reset</button>
                                </div>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-12 col-sm-12 ">
            <form runat="server">
                <div class="x_panel">
                    <%-- <div class="x_title">--%>
                    <h2>Responsive example<small>Users</small></h2>
                    <div class="clearfix"></div>
                </div>
                <div class="card-box table-responsive">
                    <asp:GridView ID="gv_detail" runat="server" AutoGenerateColumns="False"
                        GridLines="None">
                        <Columns>
                            <asp:TemplateField HeaderText="TopLv">
                                <ItemTemplate>
                                    <%#Eval("TopLv") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Lv" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <%#Eval("Lv") %>
                                </ItemTemplate>

                                <HeaderStyle Width="100px"></HeaderStyle>

                                <ItemStyle Width="100px"></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Name" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <%#Eval("Name") %>
                                </ItemTemplate>

                                <HeaderStyle Width="100px"></HeaderStyle>

                                <ItemStyle Width="100px"></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Contract" HeaderStyle-Width="250px" ItemStyle-Width="250px">
                                <ItemTemplate>
                                    <%#Eval("Contract") %>
                                </ItemTemplate>

                                <HeaderStyle Width="250px"></HeaderStyle>

                                <ItemStyle Width="250px"></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="AV_ParentsPartByItemIFS" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <%#Eval("AV_ParentsPartByItemIFS") %>
                                </ItemTemplate>

                                <HeaderStyle Width="100px"></HeaderStyle>

                                <ItemStyle Width="100px"></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="AV_ChildPart" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <%#Eval("AV_ChildPart") %>
                                </ItemTemplate>

                                <HeaderStyle Width="100px"></HeaderStyle>

                                <ItemStyle Width="100px"></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="AV_QtyUsege" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <%#Eval("AV_QtyUsege") %>
                                </ItemTemplate>

                                <HeaderStyle Width="100px"></HeaderStyle>

                                <ItemStyle Width="100px"></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="AV_UNIT_MEAS" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <%#Eval("AV_UNIT_MEAS") %>
                                </ItemTemplate>

                                <HeaderStyle Width="100px"></HeaderStyle>

                                <ItemStyle Width="100px"></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="IF_DESCRIPTION_BY_ITEM" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <%#Eval("IF_DESCRIPTION") %>
                                </ItemTemplate>

                                <HeaderStyle Width="100px"></HeaderStyle>

                                <ItemStyle Width="100px"></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="IF_PART_PRODUCT_FAMILY" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <%#Eval("IF_PART_PRODUCT_FAMILY") %>
                                </ItemTemplate>

                                <HeaderStyle Width="100px"></HeaderStyle>

                                <ItemStyle Width="100px"></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="IF_PLANNER_BUYER" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <%#Eval("IF_PLANNER_BUYER") %>
                                </ItemTemplate>

                                <HeaderStyle Width="100px"></HeaderStyle>

                                <ItemStyle Width="100px"></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="IF_TYPE_DESIGNATION" HeaderStyle-Width="50px" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <%#Eval("IF_TYPE_DESIGNATION") %>
                                </ItemTemplate>

                                <HeaderStyle Width="50px"></HeaderStyle>

                                <ItemStyle Width="100px"></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="[10]" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <%#Eval("10") %>
                                </ItemTemplate>
                                <HeaderStyle Width="100px"></HeaderStyle>
                                <ItemStyle Width="100px"></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="[20]" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <%#Eval("20") %>
                                </ItemTemplate>

                                <HeaderStyle Width="100px"></HeaderStyle>

                                <ItemStyle Width="100px"></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="[30]" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <%#Eval("30") %>
                                </ItemTemplate>

                                <HeaderStyle Width="100px"></HeaderStyle>

                                <ItemStyle Width="100px"></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="[40]" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <%#Eval("40") %>
                                </ItemTemplate>

                                <HeaderStyle Width="100px"></HeaderStyle>

                                <ItemStyle Width="100px"></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="[50]" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <%#Eval("50") %>
                                </ItemTemplate>

                                <HeaderStyle Width="100px"></HeaderStyle>

                                <ItemStyle Width="100px"></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="[60]" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <%#Eval("60") %>
                                </ItemTemplate>

                                <HeaderStyle Width="100px"></HeaderStyle>

                                <ItemStyle Width="100px"></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="[70]" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <%#Eval("70") %>
                                </ItemTemplate>

                                <HeaderStyle Width="100px"></HeaderStyle>

                                <ItemStyle Width="100px"></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="[80]" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <%#Eval("80") %>
                                </ItemTemplate>

                                <HeaderStyle Width="100px"></HeaderStyle>

                                <ItemStyle Width="100px"></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="[90]" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <%#Eval("90") %>
                                </ItemTemplate>

                                <HeaderStyle Width="100px"></HeaderStyle>

                                <ItemStyle Width="100px"></ItemStyle>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>


                <%--                <h3>Vehicle Details</h3>
                <hr />
                <asp:TreeView ID="TreeView1" runat="server" ImageSet="XPFileExplorer" NodeIndent="15">
                    <HoverNodeStyle Font-Underline="True" ForeColor="#6666AA" />
                    <NodeStyle Font-Names="Tahoma" Font-Size="8pt" ForeColor="Black" HorizontalPadding="2px"
                        NodeSpacing="0px" VerticalPadding="2px"></NodeStyle>
                    <ParentNodeStyle Font-Bold="False" />
                    <SelectedNodeStyle BackColor="#B5B5B5" Font-Underline="False" HorizontalPadding="0px"
                        VerticalPadding="0px" />
                </asp:TreeView>--%>
            </form>
        </div>
    </div>
    <!-- /page content -->


    <%-- <div class="x_content">
                      <div class="row">
                          <div class="col-sm-12">
                            <div class="card-box table-responsive">
                    <p class="text-muted font-13 m-b-30">
                      The Buttons extension for DataTables provides a common set of options, API methods and styling to display buttons on a page that will interact with a DataTable. The core library provides the based framework upon which plug-ins can built.
                    </p>
                    <table id="datatable-buttons" class="table table-striped table-bordered" style="width:100%">
                      <thead>
                        <tr>
                          <th>Name</th>
                          <th>Position</th>
                          <th>Office</th>
                          <th>Age</th>
                          <th>Start date</th>
                          <th>Salary</th>
                        </tr>
                      </thead>
                        <tbody>
                        <tr>
                          <td>Donna Snider</td>
                          <td>Customer Support</td>
                          <td>New York</td>
                          <td>27</td>
                          <td>2011/01/25</td>
                          <td>$112,000</td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>--%>
</asp:Content>
