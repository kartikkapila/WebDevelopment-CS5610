<%@ Page Language="C#" AutoEventWireup="true" CodeFile="InputBox.aspx.cs" Inherits="experiments_exp06_Designing_Profile_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type ="text/css" href="../../css/bootstrap.min.css" />
    <style>
        .custom-button
{
    border-radius:8px;
    color:rgb(255,255,255);
    background-color:#FF4000;
    padding:10px 10px;
    font-size:14px;
    line-height:1.42857;
    border:none;
    cursor:pointer;
}
    </style>
</head>
<body>
    <form id="form1" runat="server"><br />
    <div class="container">
        <div class="input-area" style="border:1px solid;position:relative;display:table;width:200px;height:35px;">
            <input type="text" style="border:lightblue solid;position:absolute;top:0px;right:0px;bottom:0px;left:0px;width:100%;height:100%" />
            <button class="custom-button">Search</button>
        </div>
    </div>
    </form>
    <script src="../../jquery/jquery-2.1.0.min.js"></script>
    <script src="../../javascript/bootstrap.min.js"></script>
</body>
</html>
