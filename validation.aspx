<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="validation.aspx.cs" Inherits="ASP_Tutorial.validation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Validation Exercise</title>

    <%-- Bootstrap CDN --%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous" />

    <%-- Custom Stylesheet --%>
    <link href="css/styles.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
        <main class="container py-4">
            <div class="mb-3 d-flex justify-content-start align-items-center">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List" CssClass="text-danger"/> 
            </div>
            <div class="mb-3 d-flex justify-content-start align-items-center">
                <asp:Label ID="Lbl_Student_Name" runat="server" Text="Student's Name" CssClass="col-2"></asp:Label>
                <asp:TextBox ID="Txt_Student_Name" runat="server" placeholder="Enter your name" CssClass="form-control col-6 w-50 me-2"></asp:TextBox>
                <asp:RequiredFieldValidator ID="Name_Validator" runat="server" ErrorMessage="Please enter your name" CssClass="col-2 text-danger" SetFocusOnError="True" ControlToValidate="Txt_Student_Name" Text="*"></asp:RequiredFieldValidator>
            </div>
            <div class="mb-3 d-flex justify-content-start align-items-center">
                <asp:Label ID="Lbl_Student_Email" runat="server" Text="Student's Email" CssClass="col-2"></asp:Label>
                <asp:TextBox ID="Txt_Student_Email" runat="server" placeholder="Enter your email" CssClass="form-control col-6 w-50 me-2"></asp:TextBox>
                <asp:RequiredFieldValidator ID="Email_Validator" runat="server" ErrorMessage="Please enter your email" CssClass="col-2 text-danger" SetFocusOnError="True" ControlToValidate="Txt_Student_Email" Display="Dynamic" Text="*" TabIndex="-1">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="Email_RE_Validator" runat="server" ErrorMessage="Email is invalid" ControlToValidate="Txt_Student_Email" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="text-danger" SetFocusOnError="True" Text="*"></asp:RegularExpressionValidator>
            </div>
            <div class="mb-3 d-flex justify-content-start align-items-center">
                <asp:Label ID="Lbl_Student_Re_Email" runat="server" Text="Reenter Email" CssClass="col-2"></asp:Label>
                <asp:TextBox ID="Txt_Student_Re_Email" runat="server" placeholder="Re-enter your email" CssClass="form-control col-6 w-50 me-2"></asp:TextBox>
                <asp:RequiredFieldValidator ID="Re_Email_Validator" runat="server" ErrorMessage="Please re-enter your email" CssClass="col-2 text-danger" SetFocusOnError="True" ControlToValidate="Txt_Student_Re_Email" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="Re_Email_Compare_Validator" runat="server" ErrorMessage="Email is not identical" CssClass="text-danger" ControlToCompare="Txt_Student_Email" ControlToValidate="Txt_Student_Re_Email" Display="Dynamic" SetFocusOnError="True" Text="*"></asp:CompareValidator>
            </div>
            <div class="mb-3 d-flex justify-content-start align-items-center">
                <asp:Label ID="Lbl_Class" runat="server" Text="Class" CssClass="col-2"></asp:Label>
                <asp:TextBox ID="Txt_Class" runat="server" placeholder="Enter your class" CssClass="form-control col-6 w-50 me-2"></asp:TextBox>
                <asp:RequiredFieldValidator ID="Class_Validator" runat="server" ErrorMessage="Please enter your class" CssClass="col-2 text-danger" SetFocusOnError="True" ControlToValidate="Txt_Class" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="Class_Range_Validator" runat="server" ErrorMessage="Class should be between 1 and 12" ControlToValidate="Txt_Class" CssClass="col-2 text-danger" Display="Dynamic" MaximumValue="12" MinimumValue="1" SetFocusOnError="True" Type="Integer" Text="*"></asp:RangeValidator>
            </div>
            <div class="mb-3 d-flex justify-content-start align-items-center">
                <asp:Label ID="Lbl_Fees" runat="server" Text="Fees" CssClass="col-2"></asp:Label>
                <asp:TextBox ID="Txt_Fees" runat="server" placeholder="Enter your fees" CssClass="form-control col-6 w-50 me-2"></asp:TextBox>
                <asp:RequiredFieldValidator ID="Fees_Validator" runat="server" ErrorMessage="Please enter your fees" CssClass="col-2 text-danger" SetFocusOnError="True" ControlToValidate="Txt_Fees" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Fees should be between 2000.00 and 8000.00" ControlToValidate="Txt_Fees" CssClass="col-2 text-danger" Display="Dynamic" MaximumValue="8000.00" MinimumValue="2000.00" SetFocusOnError="True" Type="Double" Text="*"></asp:RangeValidator>
            </div>
            <div class="mb-3 d-flex justify-content-start align-items-center">
                <asp:Label ID="Lbl_Gender" runat="server" Text="Gender" CssClass="col-2"></asp:Label>
                <asp:RadioButton ID="Male_Radio_Button" runat="server" Text="Male" CssClass="col-2" GroupName="Gender" />
                <asp:RadioButton ID="Female_Radio_Button" runat="server" CssClass="col-2" Text="Female" GroupName="Gender" />
                <asp:CustomValidator ID="Gender_Custom_Validator" runat="server" ErrorMessage="Please enter a gender" CssClass="col-6 text-danger" Text="*" SetFocusOnError="True" OnServerValidate="Gender_Custom_Validator_ServerValidate" Display="Dynamic"></asp:CustomValidator>
                
            </div>
            <div class="d-flex justify-content-start">
                <asp:Button ID="Btn_Submit" runat="server" Text="Submit" CssClass="py-2 px-3 btn btn-success" OnClick="Btn_Submit_Click"/>
            </div>
        </main>

        <%-- Bootstrap JS --%>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    </form>
</body>
</html>
