<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ASP_Tutorial.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register Form Tutorial</title>
    <style type="text/css">
        table {
            width: 600px;
            margin: 5rem auto;
            border: 5px solid green;
            padding: 2rem;
            font-family: Roboto, sans-serif;
        }
        input, select {
            font-size: 1.1rem;
            padding: 0.2rem 0.5rem;
        }

        th {
            font-size: 2rem;
            text-align: center;
            text-transform: uppercase;
        }
        .btn {
            padding: 1rem 2rem;
            border-radius: 5px;
            outline: none;
            font-size: 1.2rem;
            background-color: green;
            color: #fff;
            border-color: green;
        }
        .table-center {
            text-align: center;
        }
        .auto-style2 {
            width: 155px;
        }
        .auto-style3 {
            width: 155px;
            height: 48px;
        }
        .auto-style4 {
            height: 48px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table cellpadding="4" cellspacing="4">
                <tr>
                    <th colspan="2">Registration Form</th>
                </tr>
                <tr>
                    <td class="auto-style2">First Name</td>
                    <td>
                        <asp:TextBox ID="Txt_First_Name" runat="server" Height="30px" Width="300px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="FirstNameRequiredValidator" runat="server" ControlToValidate="Txt_First_Name" Display="Dynamic" ErrorMessage="Please enter your First Name" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Last Name</td>
                    <td>
                        <asp:TextBox ID="Txt_Last_Name" runat="server" Height="30px" Width="300px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="LastNameRequiredValidator" runat="server" ControlToValidate="Txt_Last_Name" Display="Dynamic" ErrorMessage="Please enter your Last Name" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Gender</td>
                    <td>
                        <asp:DropDownList ID="Txt_Gender" runat="server" Height="31px" Width="151px">
                            <asp:ListItem>Select</asp:ListItem>
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                            <asp:ListItem>Third Gender</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator InitialValue="Select" ID="GenderRequiredValidator" runat="server" ControlToValidate="Txt_Gender" Display="Dynamic" ErrorMessage="Please select your Gender" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Email Address</td>
                    <td>
                        <asp:TextBox ID="Txt_Email_Address" runat="server" Height="30px" Width="300px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="EmailRequiredValidator" runat="server" ControlToValidate="Txt_Email_Address" Display="Dynamic" ErrorMessage="Please enter your Email Address" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="EmailRegularExpressionValidator" runat="server" ControlToValidate="Txt_Email_Address" Display="Dynamic" ErrorMessage="Please enter a valid email" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Address</td>
                    <td>
                        <asp:TextBox ID="Txt_Address" runat="server" Height="30px" Width="300px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="AddressRequiredValidator" runat="server" ControlToValidate="Txt_Address" Display="Dynamic" ErrorMessage="Please enter your Address" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Username</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="Txt_Username" runat="server" Height="30px" Width="300px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="UsernameRequiredValidator" runat="server" ControlToValidate="Txt_Username" Display="Dynamic" ErrorMessage="Please enter your Username" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Password</td>
                    <td>
                        <asp:TextBox ID="Txt_Password" runat="server" Height="30px" Width="300px" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="PasswordRequiredValidator0" runat="server" ControlToValidate="Txt_Password" Display="Dynamic" ErrorMessage="Please enter your Password" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="PasswordRegularExpressionValidator" runat="server" ControlToValidate="Txt_Password" Display="Dynamic" ErrorMessage="Please enter a valid password" ForeColor="Red" ValidationExpression="^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&amp;*-]).{8,}$">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Confirm Password</td>
                    <td>
                        <asp:TextBox ID="Txt_Confirm_Password" runat="server" Height="30px" Width="300px" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ConfirmPasswordRequiredValidator" runat="server" ControlToValidate="Txt_Confirm_Password" Display="Dynamic" ErrorMessage="Please enter your Password again" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="ComparePasswordValidator" runat="server" ControlToCompare="Txt_Password" ControlToValidate="Txt_Confirm_Password" Display="Dynamic" ErrorMessage="Your password don't match" ForeColor="Red" SetFocusOnError="True">*</asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="table-center">
                        <asp:Button ID="SignUpBtn" runat="server" Text="Sign Up" CssClass="btn" OnClick="SignUpBtn_Click"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="table-center">
                        <a href="../Login.aspx">Go to Login Page</a>
                    </td>
                </tr>
            </table>
        </div>
        <asp:ValidationSummary ID="ValidationSummary" runat="server" BackColor="#CCCCCC" DisplayMode="List" Font-Size="Large" ForeColor="Red" />
    </form>
</body>
</html>
