<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoadData.aspx.cs" Inherits="ASP_Tutorial.LoadData" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <input type="button" id="btn" value="Click to Get Data" />
            <br />
            <div id="result">

            </div>
        </div>
    </form>
    
    <script src="Scripts/jquery-3.7.1.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#btn").click(function () {
                $("#result").load("pages/HtmlPage1.html", function (responseTxt, statusTxt, xhr) { 
                    //alert(responseTxt);
                    //alert(statusTxt);
                    //alert(xhr);
                    if (statusTxt == "success") {
                        alert("All is well!");
                    }
                    else {
                        alert("All is not well!")
                    }
                });
            })
        })
    </script>
</body>
</html>
