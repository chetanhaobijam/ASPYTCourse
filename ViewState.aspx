<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewState.aspx.cs" Inherits="ASP_Tutorial.ViewState" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View State Exercise</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:Label ID="Lbl_User" runat="server" Text="Username"></asp:Label>
            <asp:TextBox ID="Txt_User" runat="server" Style="margin-left: 21px" Width="188px"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Lbl_Pass" runat="server" Text="Password"></asp:Label>
            <asp:TextBox ID="Txt_Pass" runat="server" Style="margin-left: 21px" Width="188px"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Submit_Btn" runat="server" Height="39px" Text="Submit" Width="85px" OnClick="Submit_Btn_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Restore_Btn" runat="server" Height="39px" Text="Restore" Width="85px" OnClick="Restore_Btn_Click" />

        </div>
    </form>
</body>
</html>
