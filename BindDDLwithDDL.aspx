<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BindDDLwithDDL.aspx.cs" Inherits="ASP_Tutorial.BindDDLwithDDL" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 182px;
        }
        .auto-style3 {
            width: 182px;
            height: 43px;
        }
        .auto-style4 {
            height: 43px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <table cellpadding="4" cellspacing="4" class="auto-style1">
                <tr>
                    <td class="auto-style3">Country</td>
                    <td class="auto-style4">
                        <asp:DropDownList ID="DDL_Country" runat="server" Height="30px" Width="250px" OnSelectedIndexChanged="DDL_Country_SelectedIndexChanged" AutoPostBack="true">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="DDL_Country_Required_Validator" runat="server" ErrorMessage="Country is required!" ForeColor="Red" Display="Dynamic" ControlToValidate="DDL_Country" InitialValue="Select Country"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">City</td>
                    <td>
                        <asp:DropDownList ID="DDL_City" runat="server" Height="30px" Width="250px">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="DDL_City_Required_Validator" runat="server" ErrorMessage="City is required!" ForeColor="Red" Display="Dynamic" ControlToValidate="DDL_City" InitialValue="Select City"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <asp:Button ID="Btn_Submit" runat="server" Height="36px" Text="Submit" Width="84px" onclick="Btn_Submit_Click"/>
                    </td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
