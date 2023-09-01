<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QueryString1.aspx.cs" Inherits="ASP_Tutorial.QueryString1aspx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Query String Exercise</title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 102px;
        }
    </style>
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
        <asp:Button ID="SubmitBtn" runat="server" Text="Submit" OnClick="Button1_Click" />
    </form>
</body>
</html>
