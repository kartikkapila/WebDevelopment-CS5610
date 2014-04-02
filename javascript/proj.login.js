proj.login = {
    init: function () {
        proj.login.dom.init();
        proj.login.controller.init();
    },
    showPage: function () {
        proj.showPage("login");
    },
    dom: {
        login_username: null,
        login_password: null,
        login_submit_btn:null,
        close:null,
        init: function () {
            proj.login.dom.login_username = $(".login-username");
            proj.login.dom.login_password = $(".login-password");
            proj.login.dom.login_submit_btn = $(".login-submit-btn");
            proj.login.dom.close = $(".close");
        }
    },
    controller: {
        init: function () {
            proj.login.dom.close.click(function () {
                proj.showPage("home");
            });
            proj.login.dom.login_submit_btn.click(function () {
                var username = proj.login.dom.login_username.val();
                var password = proj.login.dom.login_password.val();
                proj.login.services.checkUser(username,password);
            });
        }
    },
    services: {
        checkUser: function (username, password) {
            var param = {
                username: username,
                password:password
            }
            $.ajax({
                url: "http://localhost:1316/MoviesWebService.asmx/checkUser",
                data: JSON.stringify(param),
                type: 'post',
                contentType: 'application/json',
                success: function (response) {
                    if (response.d == true) {
                        proj.state.currentUser.username = username;
                        proj.showPage('home');
                    } else {
                        alert('Invalid username and password');
                    }
                }
            });
        }
    },
    renderer: {

    }
}