<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FilterGridView.aspx.cs" Inherits="ASP_Tutorial.FilterGridView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Filter Grid View using Radio Buttons</title>
    <style type="text/css">
        .auto-style1 {
            width: 462px;
            height: 113px;
        }

        .auto-style2 {
            width: 76px;
        }

        .auto-style3 {
            width: 414px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <table cellpadding="4" cellspacing="4" class="auto-style1">
                <tr>
                    <td class="auto-style2">Search</td>
                    <td class="auto-style3">
                        <asp:RadioButton ID="MaleRadioButton" Text="Male" GroupName="Gender" runat="server" OnCheckedChanged="MaleRadioButton_CheckedChanged" AutoPostBack="true" />
                        &nbsp;
                        <asp:RadioButton ID="FemaleRadioButton" Text="Female" GroupName="Gender" runat="server" OnCheckedChanged="FemaleRadioButton_CheckedChanged" AutoPostBack="true" />
                        &nbsp;
                        <asp:RadioButton ID="BothRadioButton" Text="Both" GroupName="Gender" runat="server" OnCheckedChanged="BothRadioButton_CheckedChanged" AutoPostBack="true" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">
                        <asp:Button ID="SearchButton" runat="server" Height="39px" Text="Search" Width="116px" onclick="SearchButton_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="id" HeaderText="Id"></asp:BoundField>
                                <asp:BoundField DataField="name" HeaderText="Name"></asp:BoundField>
                                <asp:BoundField DataField="gender" HeaderText="Gender"></asp:BoundField>
                                <asp:BoundField DataField="age" HeaderText="Age"></asp:BoundField>
                            </Columns>

                            <Columns>
                                
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
