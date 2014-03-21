<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegistrationPage.aspx.cs" Inherits="experiments_exp07_RegistrationPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="../../css/bootstrap.min.css" />
    <style>
        body
        {padding-top:60px;
        }
    </style>
</head>
<body>
    <form class="form-horizontal" id="form1" runat="server">
     <div class="form-group">
        <label class="col-sm-2 control-label">Username</label>
        <div class="col-sm-2">
            <input type="text" class="form-control" id="username" placeholder="Enter Username" />
        </div>
     </div>
     <div class="form-group">
         <label class="col-sm-2 control-label">Password</label>
         <div class="col-sm-2">
            <input type="password" class="form-control" id="password" placeholder="Enter Password" />
         </div>
     </div>
     <div class="form-group">
        <label class="col-sm-2 control-label">Confirm Password</label>
        <div class="col-sm-2">
            <input type="password" class="form-control" id="password1" placeholder="Confirm Password" />
        </div>
     </div>
     <div class="form-group">
         <div class="col-sm-offset-2 col-sm-2">
            <button type="submit" class="btn btn-default">Register</button>
         </div>
     </div>
    </form>
</body>
</html>
