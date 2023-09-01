<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PostBack.aspx.cs" Inherits="ASP_Tutorial.PostBack" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Post Back Tutorial</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ListBox ID="ListBox1" runat="server" Height="80px" Width="260px"></asp:ListBox>
            <br />
            <br />
            <asp:Button ID="Btn_1" runat="server" Text="Click Me!" />
        </div>
    </form>
</body>
</html>
