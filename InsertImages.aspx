<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InsertImages.aspx.cs" Inherits="ASP_Tutorial.InsertImages" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Inserting and Retrieving Images Exercise</title>
    <style type="text/css">
        .auto-style1 {
            width: 69%;
            height: 156px;
        }
        .auto-style2 {
            width: 322px;
        }
        .auto-style3 {
            width: 127px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <table cellpadding="4" cellspacing="4" class="auto-style1">
                <tr>
                    <td class="auto-style3">Image Upload</td>
                    <td class="auto-style2">
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style2">
                        <asp:Button ID="BtnSubmit" OnClick="BtnSubmit_Click" runat="server" Height="27px" Text="Submit" Width="82px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style2">
                        <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowHeader="false">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="LblImage" runat="server" Text='<%#Eval("ImageId") %>'></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("ImageName") %>' Width="300" />
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
