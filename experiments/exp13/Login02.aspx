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
            <h4>In this experiments, we will see the difference between a member and admin login.</h4>
            <h4>Click the following button, to go to the login page</h4>
            <asp:LoginStatus
                ID="LoginStatus1"
                runat="server"
                LogoutAction="Redirect"
                LogoutPageUrl="~/experiments/Experiments.aspx"
                CssClass="non-underlined-links"/><br /><br />
            <h4>Once, you login successfully, the login button will be replaced by the logout button.</h4>
            <asp:LoginView 
                ID="LoginView01"
                runat="server">
                    <LoggedInTemplate>
                    <asp:LoginName
                        ID="LoginName1"
                        Runat="server"
                        FormatString="Logged in as <span class='username'>{0}</span>" />
                    </LoggedInTemplate>
            </asp:LoginView><br /><br />
            
            <asp:LoginView
                ID="LoginView02"
                runat="server">
                <RoleGroups>
                    <asp:RoleGroup Roles="Member">
                        <ContentTemplate>
                            <h4>You are logged in as a Member.</h4>
                            <h4>You will be able to see the above message, even when you login as admin. This is because all admins are members.</h4>
                        </ContentTemplate>
                    </asp:RoleGroup>
                </RoleGroups>
            </asp:LoginView>
            <asp:LoginView
                ID="LoginView03"
                runat="server">
                <RoleGroups>
                    <asp:RoleGroup Roles="Admin">
                        <ContentTemplate>
                            <h4>You are logged in as a Admin.</h4>
                        </ContentTemplate>
                    </asp:RoleGroup>
                </RoleGroups>
            </asp:LoginView>

            
            <br />
            <a class="non-underlined-links" href="../../fileview/Default.aspx?~/experiments/exp13/Login02.aspx">View Source</a>
        </div>

    </form>         
</body>
</html>
