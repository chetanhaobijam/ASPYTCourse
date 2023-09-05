<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListBoxExercise.aspx.cs" Inherits="ASP_Tutorial.ListBoxExercise" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ListBox ID="ListBox1" runat="server" Rows="5" SelectionMode="Multiple">
                <%--Data Bind--%>
            </asp:ListBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
        </div>
    </form>
</body>
</html>
