<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AjaxMethod.aspx.cs" Inherits="ASP_Tutorial.AjaxMethod" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Testing Ajax Method</title>

    <style type="text/css">
        .loader {
            display: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <input type="text" placeholder="Enter your name" id="name" />
            <br />
            <br />
            <input type="text" placeholder="Enter your surname" id="surname" />
            <br />
            <br />
            <input type="button" value="Submit" id="btn"/>
            <br />
            <h2 id="result"></h2>
            <div class="loader">
                <img src="images/Infinity_1.gif" alt="Ajax Loading" />
            </div>

        </div>
    </form>

    <script src="Scripts/jquery-3.7.1.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#btn").click(function () {
                let name = $("#name").val();
                let surname = $("#surname").val();
                if (name == "" || surname == "") {
                    alert("All fields are required.")
                }
                else {
                    $.ajax({
                        url: "AjaxMethod.aspx/GetData",
                        type: "post",
                        contentType: "application/json",
                        data: JSON.stringify({ name: name, surname: surname }),
                        dataType: 'json',
                        beforeSend: function () {
                            //Display the loading animation
                           /* $(".loader").show();*/
                            $("#result").text("Processing .....");
                        },
                        success: function (result, status, xhr) {
                            //Get only data of result
                            $("#result").text(result.d);
                            /*$(".loader").hide();*/
                            //alert(status);
                            //alert(xhr);
                        },
                        error: function (xhr, status, result) {
                            //Will alert error
                            alert(status);
                            //Will not print anything despite this code
                            $("#result").text(result.d);
                        }
                        //complete: function (xhr, status) {
                        //    //Success or Error will be shown according to the function success or error
                        //    alert(status);
                        //}
                    })
                }
            })
        })
    </script>
</body>
</html>
