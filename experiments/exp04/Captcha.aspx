 <%@ Page Language="C#" AutoEventWireup="true" CodeFile="Captcha.aspx.cs" Inherits="experiments_exp04_Captcha" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="http://www.google.com/recaptcha/api/js/recaptcha_ajax.js"></script>
    <style>
        #reveal
        {
            visibility:hidden;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <a href="javascript:" onclick='showRecaptcha(reCaptcha);'>k...@ccs.neu.edu</a>
    </div>
    <div id="reCaptcha"></div>
    <button value="show email address" id="reveal" onclick="javascript:exchangeData();"/>
    </form>
</body>
<script type="text/javascript">
    function showRecaptcha(element) {
        Recaptcha.create("6Ld-Ue0SAAAAALogs13gGLprWUqQo6Dt5xj3WnaN", element, {
            theme: "white",
            callback: Recaptcha.focus_response_field
        });
        document.getElementById("reveal").style.visibility = 'visible';
    }

    function exchangeData() {
        var xmlhttp;
        xmlhttp = new XMLHttpRequest();
        xmlhttp.open("POST", "http://www.google.com/recaptcha/api/verify", true);
        xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    }

</script>


</html>
