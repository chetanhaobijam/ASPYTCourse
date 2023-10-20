<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AutoIncrement.aspx.cs" Inherits="ASP_Tutorial.AutoIncrement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Autoincrement Value</title>
    <style type="text/css">
        .auto-style1 {
            width: 400px;
        }
        .auto-style2 {
            width: 92px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table cellpadding="4" cellspacing="4" class="auto-style1">
                <tr>
                    <td class="auto-style2">ID</td>
                    <td>
                        <asp:TextBox ID="Txt_Id" runat="server" Height="26px" Width="278px" ReadOnly="True"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Name</td>
                    <td>
                        <asp:TextBox ID="Txt_Name" runat="server" Height="26px" Width="278px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Age</td>
                    <td>
                        <asp:TextBox ID="Txt_Age" runat="server" Height="26px" Width="278px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <asp:Button ID="Btn_Insert" runat="server" Height="36px" Text="Insert" Width="77px" OnClick="Btn_Insert_Click" />
&nbsp;
                        <asp:Button ID="Btn_Update" runat="server" Height="36px" Text="Update" Width="77px" OnClick="Btn_Update_Click" />
&nbsp;
                        <asp:Button ID="Btn_Delete" runat="server" Height="36px" Text="Delete" Width="77px" OnClick="Btn_Delete_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" HeaderText="SELECT"></asp:CommandField>
                                <asp:TemplateField HeaderText="ID">
                                    <ItemTemplate>
                                        <asp:Label ID="Lbl_Id" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="NAME">
                                    <ItemTemplate>
                                        <asp:Label ID="Lbl_Name" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="AGE">
                                    <ItemTemplate>
                                        <asp:Label ID="Lbl_Age" runat="server" Text='<%# Eval("age") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>

                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
