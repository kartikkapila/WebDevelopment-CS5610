<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void btnSubmit_Click(object sender, EventArgs e) {        
        SqlDataSource1.Insert();
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Database Experiment 03</title>
    <link rel="stylesheet" type ="text/css" href="../../css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="../../css/database.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <h3>Registration</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <h4 class="input-labels">Username:</h4>
            </div>
            <div class="col-md-2">
                <asp:TextBox ID="inputUsername" CssClass="form-control input-username" runat="server"></asp:TextBox><br />
            </div>
            <div class="col-md-2">
                <asp:Label ID="entityUsername" CssClass="entity-username" runat="server">&#x2714;</asp:Label>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <h4 class="input-labels">Password:</h4>
            </div>
            <div class="col-md-2">
                <asp:TextBox ID="inputPassword" CssClass="form-control input-password" runat="server" TextMode="Password"></asp:TextBox><br />
            </div> 
            <div class="col-md-2">
                <asp:Label ID="entityPassword" CssClass="entity-password" runat="server">&#x2714;</asp:Label>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <h4 class="input-labels">Confirm Password:</h4>
            </div>
            <div class="col-md-2">
                <asp:TextBox ID="inputConfirmPassword" CssClass="form-control input-confirm-password" runat="server" TextMode="Password"></asp:TextBox><br />
            </div>
            <div class="col-md-2">
                <asp:Label ID="entityConfirmPassword" CssClass="entity-confirm-password" runat="server">&#x2714;</asp:Label>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <h4 class="input-labels">Email:</h4>
            </div>
            <div class="col-md-2">
                <asp:TextBox ID="inputEmail" CssClass="form-control input-email" runat="server"></asp:TextBox><br />
            </div>
            <div class="col-md-2">
                <asp:Label ID="entityEmail" CssClass="entity-email" runat="server">&#x2714;</asp:Label>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-2">
                <asp:Button ID="btnSubmit" CssClass="btn btn-primary form-control btn-submit" runat="server" Text="Register" OnClick="btnSubmit_Click"/>
            </div>
        </div>
       <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:kkapilaCS %>"
            DeleteCommand="DELETE FROM [Users] WHERE [id] = @id"
            InsertCommand="INSERT INTO [Users] ([username], [password], [email]) VALUES (@username, @password, @email)"
            ProviderName="<%$ ConnectionStrings:kkapilaCS.ProviderName %>"
            SelectCommand="SELECT [id], [username], [email] FROM [Users]"
            UpdateCommand="UPDATE [Users] SET [username] = @username, [password] = @password, [email] = @email WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:FormParameter FormField="inputUsername" Name="username" Type="String" />
                <asp:FormParameter FormField="inputPassword" Name="password" Type="String" />
                <asp:FormParameter FormField="inputEmail" Name="email" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="username" Type="String" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>   
        <h5>Please enter some random password and press tab, it will display an error is the password is less than 7 characters</h5>
        <h5>Also, if the password and confirm password don't match, a error will be displayed.</h5>
        <h5>I have done this using jquery. If you press the Register button, even if the passwords don't match, the information will be
            stored in the database. Have to add the validations in the next experiments.
        </h5> 
        <h4><b>Note:</b> Do not leave anything blank while registering.</h4>
        <a href="../../fileview/Default.aspx?~/experiments/exp10/Database03.aspx">Source</a>
    </div>
    </form>
    <script src="../../jquery/jquery-2.1.0.min.js"></script>
    <script src="../../javascript/bootstrap.min.js"></script>
    <script>
        $(function () {

            // grab the fields of the form
            uname = $(".input-username");
            upass = $(".input-password");
            uconfirm_pass = $(".input-confirm-password");
            uemail = $(".input-email");
            btn_submit = $(".btn-submit");

            // grab the entity display area
            entity_username = $(".entity-username");
            entity_pass = $(".entity-password");
            entity_confirm_pass = $(".entity-confirm-password");
            entity_email = $(".entity-email");

            // set event handlers
            upass.keypress(function (event) {
                if (event.keyCode == 9)
                    checkPasswordLength(event);
            });

            upass.focusout(function (event) {
                checkPasswordLength(event);
            });

            function checkPasswordLength(e) {
                if (upass.val().length <= 7) {
                    entity_pass.css("color", "red")
                                .html("&#x2716; password less than 7 characters")
                                .css("display", "inline");
                    entity_confirm_pass.css("display", "none");
                }
                else {
                    entity_pass.css("display", "none");
                }
            }

            uconfirm_pass.keypress(function (event) {
                if (event.keyCode == 9) {
                    checkPasswords();
                }
            });

            uconfirm_pass.focusout(function (event) {
                checkPasswords();
            });

            uconfirm_pass.focusin(function (event) {
                checkPasswords();
            });

            function checkPasswords() {
                if (upass.val().length > 7) {
                    if (upass.val() != uconfirm_pass.val()) {
                        entity_confirm_pass.css("display", "inline")
                                            .html("&#x2716; password and confirm password don't match")
                                            .css("color", "red");
                    }
                    else {
                        entity_confirm_pass.css("display", "inline")
                                            .html("&#x2714; passwords match")
                                            .css("color", "green");
                    }
                } else {
                    entity_pass.css("color", "red")
                               .html("&#x2716; password less than 7 characters")
                               .css("display", "inline");
                }
            }
        });
    </script>

</body>
</html>
