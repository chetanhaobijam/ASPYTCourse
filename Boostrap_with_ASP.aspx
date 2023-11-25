<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Boostrap_with_ASP.aspx.cs" Inherits="ASP_Tutorial.Boostrap_with_ASP" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Bootstrap with ASP</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <h1 class="bg-primary-subtle py-3 text-center fs-2 text-uppercase">Contact Form</h1>
        </header>

        <main class="container shadow rounded-1 mx-2 mx-sm-auto mt-5 p-5">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="row">
                        <!-- Name Field -->
                        <div class="col-md-6 mb-4">
                            <asp:Label ID="Lbl_Name" runat="server" Text="Name" CssClass="form-label"></asp:Label>
                            <asp:TextBox ID="Txt_Name" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="NameRequiredValidator" runat="server" ErrorMessage="Please enter a name" ControlToValidate="Txt_Name" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <!-- Gender Field -->
                        <div class="col-md-6 mb-4">
                            <asp:Label ID="Lbl_Gender" runat="server" Text="Gender" CssClass="form-label"></asp:Label>
                            <asp:DropDownList ID="Ddl_Gender" runat="server" CssClass="form-select">
                                <asp:ListItem Value="0">Select</asp:ListItem>
                                <asp:ListItem Value="1">Male</asp:ListItem>
                                <asp:ListItem Value="2">Female</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="GenderRequiredValidator" runat="server" ErrorMessage="Please select a gender" ControlToValidate="Ddl_Gender" CssClass="text-danger" Display="Dynamic" InitialValue="Select"></asp:RequiredFieldValidator>
                        </div>

                        <!-- Email Field -->
                        <div class="col-md-6 mb-4">
                            <asp:Label ID="Lbl_Email" runat="server" Text="Email" CssClass="form-label"></asp:Label>
                            <asp:TextBox ID="Txt_Email" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="EmailRequiredValidator" runat="server" ErrorMessage="Please enter an email" ControlToValidate="Txt_Email" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="EmailRegularExpressionValidator" runat="server" ErrorMessage="Please enter a valid email" ControlToValidate="Txt_Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="text-danger"></asp:RegularExpressionValidator>
                        </div>

                        <!-- Subject Field -->
                        <div class="col-md-6 mb-4">
                            <asp:Label ID="Lbl_Subject" runat="server" Text="Subject" CssClass="form-label"></asp:Label>
                            <asp:DropDownList ID="Ddl_Subject" runat="server" CssClass="form-select">
                                <asp:ListItem Value="0">Select</asp:ListItem>
                                <asp:ListItem Value="1">English</asp:ListItem>
                                <asp:ListItem Value="2">Manipuri</asp:ListItem>
                                <asp:ListItem Value="3">Maths</asp:ListItem>
                                <asp:ListItem Value="4">Hindi</asp:ListItem>
                                <asp:ListItem Value="5">Physics</asp:ListItem>
                                <asp:ListItem Value="6">Chemistry</asp:ListItem>
                                <asp:ListItem Value="7">Biology</asp:ListItem>
                                <asp:ListItem Value="8">History</asp:ListItem>
                                <asp:ListItem Value="9">Geography</asp:ListItem>
                                <asp:ListItem Value="10">Civics/Economics</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="SubjectRequiredValidator" runat="server" ErrorMessage="Please select a subject" ControlToValidate="Ddl_Subject" CssClass="text-danger" Display="Dynamic" InitialValue="Select"></asp:RequiredFieldValidator>
                        </div>

                        <!-- Comment Field -->
                        <div class="col-md-12 mb-4">
                            <asp:Label ID="Lbl_Comment" runat="server" Text="Comment" CssClass="form-label"></asp:Label>
                            <asp:TextBox ID="Txt_Comment" runat="server" CssClass="form-control" TextMode="MultiLine" Height="6em"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="CommentRequiredValidator" runat="server" ErrorMessage="Please enter a comment" ControlToValidate="Txt_Comment" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="row mb-4">

                        <!-- Submit Button -->
                        <div class="col d-flex justify-content-center">
                            <asp:Button ID="Btn_Submit" runat="server" Text="Submit" CssClass="btn btn-success py-3 px-5" OnClick="Btn_Submit_Click" />
                        </div>
                    </div>
                    <div class="row">

                        <!-- Alert Label -->
                        <div class="col text-center">
                            <asp:Label ID="Lbl_Alert" runat="server" Text="" Visible="false"></asp:Label>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </main>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</body>
</html>
