<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QueryString2.aspx.cs" Inherits="ASP_Tutorial.QueryString2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Query String Exercise</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table cellpadding="4" cellspacing="4" class="auto-style1">
                <tr>
                    <td class="auto-style2">Student ID</td>
                    <td>
                        <asp:TextBox ID="Txt_Student_Id" runat="server" Height="24px" Width="305px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Student Name</td>
                    <td>
                        <asp:TextBox ID="Txt_Student_Name" runat="server" Height="24px" Width="305px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Student Age</td>
                    <td>
                        <asp:TextBox ID="Txt_Student_Age" runat="server" Height="24px" Width="305px"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
