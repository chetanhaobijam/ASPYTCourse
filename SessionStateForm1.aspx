<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SessionStateForm1.aspx.cs" Inherits="ASP_Tutorial.ViewStateForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Username
            &nbsp;
            <asp:TextBox ID="Txt_User" runat="server" Width="244px"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="SubmitBtn" runat="server" Height="37px" Text="Submit" Width="117px" OnClick="SubmitBtn_Click" />
        </div>
    </form>
</body>
</html>
