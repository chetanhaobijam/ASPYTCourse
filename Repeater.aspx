<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Repeater.aspx.cs" Inherits="ASP_Tutorial.Repeater" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Repeater Control Exercise</title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 249px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <table cellpadding="4" cellspacing="4" class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <asp:GridView ID="MyGridView" runat="server">
                        </asp:GridView>
                    </td>
                    <td>
                        <asp:Repeater ID="MyRepeater" runat="server">
                            <ItemTemplate>
                                <table>
                                    <tr>
                                        <th>Id</th>
                                        <th>Name</th>
                                        <th>Gender</th>
                                        <th>Class</th>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label_Id" runat="server" Text='<% # Eval("Id") %>'></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label_Name" runat="server" Text='<% # Eval("name") %>'></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label_Gender" runat="server" Text='<% # Eval("gender") %>'></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label_Class" runat="server" Text='<% # Eval("class") %>'></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:Repeater>
                    </td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
