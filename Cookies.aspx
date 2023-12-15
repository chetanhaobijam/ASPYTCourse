<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cookies.aspx.cs" Inherits="ASP_Tutorial.Cookies" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cookies Exercise</title>
    <style type="text/css">
        .auto-style1 {
            width: 50%;
            height: 88px;
        }
        .auto-style2 {
            width: 203px;
        }
        .auto-style3 {
            width: 9px;
        }
    </style>
</head>
<body style="width: 1169px">
    <form id="form1" runat="server">
        <div>

            <table cellpadding="4" cellspacing="4" class="auto-style1">
                <tr>
                    <td class="auto-style3">Username</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="Txt_Username" runat="server" Height="28px" Width="257px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Button ID="Btn_Submit" runat="server" Height="37px" Text="Submit" Width="101px" onclick="Btn_Submit_Click" />
                    </td>
                    <td class="auto-style2">&nbsp;</td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
