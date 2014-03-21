<%@ Page Language="C#" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link rel="stylesheet" type ="text/css" href="../../css/bootstrap.min.css" />
    <style>

        h3 {
            display: table;
        }

        .form-control {
            margin-top:10px;
            width:50%;
            display:inline;
        }

        .entity-username, .entity-password, .entity-confirm-password, .entity-email {
            display:inline;
            margin-top:10px;
            margin-left:10px;
            display:none;
        }
     
    </style>
</head>
<!-- heavy check mark = &#x2714;
     heavy cross mark = &#x2716;
    -->
<body>
    <div class="container">
        <div class="row">
            <br />
            <h3>Registration won't take more than 2 minutes.</h3>
            <div class="registration-box col-md-8">
                <input type="text" class="input-username form-control" placeholder="Username"/><h5 class="entity-username">&#x2714;</h5>
                <input type="password" class="input-password form-control" placeholder="Password(>7 characters)"/><h5 class="entity-password">&#x2714;</h5>
                <input type="password" class="input-confirm-password form-control" placeholder="Confirm Password"/><h5 class="entity-confirm-password">&#x2714;</h5>
                <input type="email" class="input-email form-control" placeholder="Email Address"/><h5 class="entity-email">&#x2714;</h5>
                <button class="btn-submit btn btn-primary form-control">Register</button>
            </div>
        </div>
    </div>
    <form id="form1" runat="server">
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
