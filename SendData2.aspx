<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SendData2.aspx.cs" Inherits="ASP_Tutorial.SendData2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sending Data to another page</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table border="1">
                <tr>
                    <td>Id</td>
                    <td>
                        <asp:Label ID="Lbl_Id" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td>
                        <asp:Label ID="Lbl_Name" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Age</td>
                    <td>
                        <asp:Label ID="Lbl_Age" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Image</td>
                    <td>
                        <asp:Image ID="Img" runat="server" Height="200" Width="200" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
