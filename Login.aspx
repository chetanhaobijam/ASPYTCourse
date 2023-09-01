<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ASP_Tutorial.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login with SQL Practice</title>
    <style type="text/css">
        table {
            width: 300px;
            margin: 5rem auto;
            border: 5px solid pink;
            padding: 2rem;
            font-family: Roboto, sans-serif;
        }
        th {
            font-size: 2rem;
            text-align: center;
            text-transform: uppercase;
        }
        .auto-style2 {
            width: 78px;
        }
        .auto-style3 {
            width: 416px;
        }
        .btn {
            padding: 1rem 2rem;
            border-radius: 5px;
            outline: none;
            font-size: 1.2rem;
        }
        .table-center {
            text-align: center;
        }
        .auto-style4 {
            height: 31px;
        }
        .auto-style5 {
            text-align: center;
            height: 38px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <table cellpadding="4" cellspacing="4" class="auto-style1">
                <tr>
                    <th colspan="2">Login Form</th>
                </tr>
                <tr>
                    <td class="auto-style2">Username</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="UserTextBox" runat="server" Height="30px" Width="373px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter your username" ControlToValidate="UserTextBox" Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Password</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="PassTextBox" runat="server" Height="30px" Width="373px" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        <input id="PassCheckBox" type="checkbox" />
                        <asp:Label ID="Lbl_Checkbox" runat="server" Text="Show Password"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        </td>
                    <td class="auto-style4">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter your password" ControlToValidate="PassTextBox" Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5" colspan="2">
                        <asp:Button ID="LoginBtn" runat="server" Text="Login" Cssclass="btn" OnClick="LoginBtn_Click"/>
                    </td>
                </tr>
                <tr>
                    <td class="table-center" colspan="2">
                        Not registered yet, <a href="Register.aspx">Register Now!</a></td>
                </tr>
            </table>

        </div>

        <script type="text/javascript">
            const passTextBox = document.querySelector("#PassTextBox");
            const passCheckBox = document.querySelector("#PassCheckBox");

            passCheckBox.addEventListener("click", () => {
                if (passCheckBox.checked) {
                    passTextBox.type = "text";
                } else {
                    passTextBox.type = "password";
                }
            })

        </script>
    </form>
</body>
</html>
