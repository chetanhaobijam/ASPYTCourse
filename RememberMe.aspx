<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RememberMe.aspx.cs" Inherits="ASP_Tutorial.RememberMe" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 100px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <table cellpadding="4" cellspacing="4" class="auto-style1">
                <tr>
                    <td class="auto-style2">Username</td>
                    <td>
                        <asp:TextBox ID="Txt_Username" runat="server" Height="23px" Width="219px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Password</td>
                    <td>
                        <asp:TextBox ID="Txt_Password" runat="server" Height="23px" Width="219px" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <asp:CheckBox ID="Chk_RememberMe" runat="server" Text="Remember Me" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <asp:Button ID="Btn_Login" runat="server" Height="34px" Text="Login" Width="86px" OnClick="Btn_Login_Click" />
                    </td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
