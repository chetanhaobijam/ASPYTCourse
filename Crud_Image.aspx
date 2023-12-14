<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Crud_Image.aspx.cs" Inherits="ASP_Tutorial.Crud_Image" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Crud with Images</title>
    <style type="text/css">
        .auto-style1 {
            width: 72%;
        }

        .auto-style2 {
            width: 165px;
        }

        .auto-style3 {
            width: 908px;
        }

        .auto-style4 {
            width: 165px;
            height: 31px;
        }

        .auto-style5 {
            width: 908px;
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
                        <asp:TextBox ID="Txt_Id" runat="server" Height="27px" Width="317px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="Id_RequiredValidator" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="Txt_Id" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Name</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="Txt_Name" runat="server" Height="27px" Width="316px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="Name_RequiredValidator" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="Txt_Name" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Age</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="Txt_Age" runat="server" Height="27px" Width="315px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="Age_RequiredValidator" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="Txt_Age" Display="Dynamic"></asp:RequiredFieldValidator>
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
                        <asp:RequiredFieldValidator ID="Gender_RequiredValidator" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="Ddl_Gender" InitialValue="Select Gender" Display="Dynamic"></asp:RequiredFieldValidator>
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
                        <asp:RequiredFieldValidator ID="Designation_RequiredValidator" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="Ddl_Designation" InitialValue="Select Designation" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Salary</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="Txt_Salary" runat="server" Height="27px" Width="313px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="Salary_RequiredValidator" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="Txt_Salary" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">
                        <asp:Image ID="Image_Preview" runat="server" Visible="False" Width="100" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Image</td>
                    <td class="auto-style3">
                        <asp:FileUpload ID="FU_Image" runat="server" Height="35px" Width="321px" />
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
                        <asp:Button ID="Btn_Update" runat="server" Height="39px" Text="Update" Width="93px" OnClick="Btn_Update_Click" />
                        &nbsp;&nbsp;
                        <asp:Button ID="Btn_Delete" runat="server" Height="39px" Text="Delete" Width="93px" OnClick="Btn_Delete_Click" />
                        &nbsp;&nbsp;
                        <asp:Button ID="Btn_Reset" runat="server" Height="39px" Text="Reset" Width="93px" OnClick="Btn_Reset_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                                <asp:TemplateField HeaderText="Id">
                                    <ItemTemplate>
                                        <asp:Label ID="Glbl_Id" runat="server" Text='<%#Eval("Id") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Name">
                                    <ItemTemplate>
                                        <asp:Label ID="Glbl_Name" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Age">
                                    <ItemTemplate>
                                        <asp:Label ID="Glbl_Age" runat="server" Text='<%#Eval("Age") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Gender">
                                    <ItemTemplate>
                                        <asp:Label ID="Glbl_Gender" runat="server" Text='<%#Eval("Gender") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Designation">
                                    <ItemTemplate>
                                        <asp:Label ID="Glbl_Designation" runat="server" Text='<%#Eval("Designation") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Salary">
                                    <ItemTemplate>
                                        <asp:Label ID="Glbl_Salary" runat="server" Text='<%#Eval("Salary") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Image">
                                    <ItemTemplate>
                                        <asp:Image ID="GImage" runat="server" ImageUrl='<%# Eval("Image_Path") %>' Width="100" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                        </asp:GridView>
                    </td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
