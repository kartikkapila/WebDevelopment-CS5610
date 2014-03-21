<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Experiments</title>
    <link rel="stylesheet" type="text/css" href="../../css/login.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="margin-provider">
            <h3>Login Experiments</h3>
            <h4>In these experiments, we will see how we can make our application secure, by having sensitive information behind a login.</h4>
            <h4>Click the following button, to go to the login page</h4>
            <asp:LoginStatus
                ID="LoginStatus1"
                runat="server"
                LogoutAction="Redirect"
                LogoutPageUrl="~/experiments/Experiments.aspx"
                CssClass="non-underlined-links"/><br /><br />
            <h4>Once, you login successfully, the login button will be replaced by the logout button.</h4>
            <a class="non-underlined-links" href="../../fileview/Default.aspx?~/experiments/exp13/Login00.aspx">View Source</a>
        </div>

    </form>         
</body>
</html>
