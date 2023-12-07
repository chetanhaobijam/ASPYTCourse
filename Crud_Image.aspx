<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Crud_Image.aspx.cs" Inherits="ASP_Tutorial.Crud_Image" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Crud with Images</title>
    <style type="text/css">
        .auto-style1 {
            width: 52%;
        }
        .auto-style2 {
            width: 165px;
        }
        .auto-style3 {
            width: 501px;
        }
        .auto-style4 {
            width: 165px;
            height: 31px;
        }
        .auto-style5 {
            width: 501px;
            height: 31px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            
            <table cellpadding="4" cellspacing="4" class="auto-style1">
                <tr>
                    <td colspan="2">Employee Crud Application</td>
                </tr>
                <tr>
                    <td class="auto-style2">Id</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="Txt_Id" runat="server" Height="27px" Width="342px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Name</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="Txt_Name" runat="server" Height="27px" Width="342px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Age</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="Txt_Age" runat="server" Height="27px" Width="342px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Gender</td>
                    <td class="auto-style3">
                        <asp:DropDownList ID="Ddl_Gender" runat="server" Height="30px" Width="188px">
                            <asp:ListItem Value="Select Gender">Select Gender</asp:ListItem>
                            <asp:ListItem Value="Male">Male</asp:ListItem>
                            <asp:ListItem Value="Female">Female</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Designation</td>
                    <td class="auto-style3">
                        <asp:DropDownList ID="Ddl_Designation" runat="server" Height="30px" Width="188px">
                            <asp:ListItem Value="Select Designation">Select Designation</asp:ListItem>
                            <asp:ListItem Value="Manager">Manager</asp:ListItem>
                            <asp:ListItem Value="Assistant Manager">Assistant Manager</asp:ListItem>
                            <asp:ListItem Value="Incharge">Incharge</asp:ListItem>
                            <asp:ListItem Value="Operator">Operator</asp:ListItem>
                            <asp:ListItem Value="Director">Director</asp:ListItem>
                            <asp:ListItem Value="PA">PA</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Salary</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="Txt_Salary" runat="server" Height="27px" Width="342px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Image</td>
                    <td class="auto-style3">
                        <asp:FileUpload ID="FU_Image" runat="server" Height="35px" Width="347px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4"></td>
                    <td class="auto-style5">
                        <asp:Label ID="Lbl_Image" runat="server" Text="" Visible="false"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="Btn_Insert" runat="server" Height="39px" Text="Insert" Width="93px" OnClick="Btn_Insert_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Btn_Update" runat="server" Height="39px" Text="Update" Width="93px" />
&nbsp;&nbsp;
                        <asp:Button ID="Btn_Delete" runat="server" Height="39px" Text="Delete" Width="93px" />
&nbsp;&nbsp;
                        <asp:Button ID="Btn_Reset" runat="server" Height="39px" Text="Reset" Width="93px" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:GridView ID="GridView1" runat="server">
                        </asp:GridView>
                    </td>
                </tr>
            </table>
            
        </div>
    </form>
</body>
</html>
