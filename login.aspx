<%@ Page Language="C#" %>
<%@ Import Namespace="edu.neu.ccis.rasala" %>
<%@ Import Namespace="System.Collections.Generic" %>
<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        string return_url =
            Request.QueryString["ReturnUrl"];

        if (StringTools.IsTrivial(return_url))
        {
            previous_link_wrap.Visible = false;
        }
        else
        {
            previous_link_wrap.Visible = true;
            previous_link.HRef =
                StringTools.Unescape(return_url);
        }
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Experiments</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Login
            ID="Login1"
            runat="server"
            LoginButtonText="Login"
            TitleText="Login"
            DisplayRememberMe="False">
        </asp:Login>
        <p>Skip login and go<a href="Default.aspx">Home</a></p>
        <p id="previous_link_wrap" runat="server">Skip login and go back to <a href="#" id="previous_link" runat="server">Previous Page</a></p>
        <hr />
    </div>
    </form>
</body>
</html>
