<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Profile</title>
    <style>

        .personel-details {
            padding:10px;
            background-color:#FFFFC4;
            border-radius:15px;
            display:table;
        }

        .profile-pic {
            width:200px;
            border-radius:15px;
            background-color:rgb(130, 40, 0);
            height:250px;
            display:inline-block;
            float:left;
        }
        .profile-pic-content {
            display:table;
            text-align:center;
            font-size:14px;
            color:green;
        }
        .user-info {
            display:inline;
            float:left;
            margin-left:15px;
        }
        .user-info-title {
            display:inline;
            font-size:20px;
            font-family:"Helvetica Neue",Helvetica,Arial,sans-serif;
            font-weight:500;

        }
        .user-info-value {
            display:inline;
            font-size:14px;
            font-family:"Helvetica Neue",Helvetica,Arial,sans-serif;
            font-weight:200;            
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="personel-details">
        <div class="profile-pic">
        </div>
        <div class="user-info">
            <h4 class="user-info-title">Username:</h4><h5 class="user-info-value">user's username</h5><br />
            <h4 class="user-info-title">Email:</h4><h5 class="user-info-value">user's email</h5><br />
            <h4 class="user-info-title">Reputation:</h4><h5 class="user-info-value">user's reputation</h5>

        </div>
    </div>
    </form>
</body>
</html>
