<%@ Page Title="Default Page" Language="C#" MasterPageFile="~/MapuPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ASP_Tutorial.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main class="container">
        <h2>This is the index page</h2>
        <a href="./Contact.aspx" class="btn btn-primary mt-3">Go to Contact Page</a>
    </main>
</asp:Content>
