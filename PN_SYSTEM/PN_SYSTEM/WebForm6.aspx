<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="WebForm6.aspx.vb" Inherits="PN_SYSTEM.WebForm6" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
                <div class ="row">
           <div class="dataTables_length" id="datatable_length">
               <div class="col-sm-6">
                   <label>Show</label>
               </div>
               <div class="col-sm-6 col-md-1">
               <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" CssClass="form-control" >
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>25</asp:ListItem>
                    <asp:ListItem>50</asp:ListItem>
                    <asp:ListItem>100</asp:ListItem>
                </asp:DropDownList>
               </div>
               <label>Entries</label><a href="WebForm4.aspx">WebForm4.aspx</a>
           </div>    
</div>
        </div>
    </form>
</body>
</html>
