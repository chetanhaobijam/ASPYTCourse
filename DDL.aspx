<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DDL.aspx.cs" Inherits="ASP_Tutorial.DDL" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <%-- Design Time --%>
            <asp:DropDownList ID="DDL_Fruits" runat="server">
                <asp:ListItem Value="-1">Select One</asp:ListItem>
                <asp:ListItem Value="1">Mango</asp:ListItem>
                <asp:ListItem Value="2">Orange</asp:ListItem>
                <asp:ListItem Value="3">Apple</asp:ListItem>
                <asp:ListItem Value="4">Pomegranate</asp:ListItem>
                <asp:ListItem Value="5">Grapes</asp:ListItem>
                <asp:ListItem Value="6">Guave</asp:ListItem>
                <asp:ListItem Value="7">Tamarind</asp:ListItem>

            </asp:DropDownList>
            <br />
            <asp:Button ID="DDL_Btn_Submit" OnClick="DDL_Btn_Submit_Click" runat="server" Text="Submit" />
        </div>
    </form>
</body>
</html>
