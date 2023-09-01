<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SessionStateForm2.aspx.cs" Inherits="ASP_Tutorial.ViewStateForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:LinkButton ID="LnkBtn" runat="server" PostBackUrl="~/SessionStateForm3.aspx">Go to Page 3</asp:LinkButton>
        </div>
    </form>
</body>
</html>
