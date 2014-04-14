proj.login = {
    init: function () {
        proj.login.dom.init();
        proj.login.controller.init();
    },
    showPage: function () {
        $(".navbar.navbar-fixed-top").css('z-index', -4); // Had to do this for chrome..!
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
                $(".navbar.navbar-fixed-top").css('z-index', 1038);
                if (proj.state.previousPage != "results")
                    proj.showPage(proj.state.previousPage);
                else {
                    proj.results.show(window.movieName);
                }
            });
            proj.login.dom.login_submit_btn.click(function () {
                var username = proj.login.dom.login_username.val();
                var password = proj.login.dom.login_password.val();
                proj.login.services.checkUser(username,password);
            });
            $(window).keypress(function (event) {
                if (event.keyCode == 27) {
                    proj.login.dom.close.click();
                }
            });
        },
    },
    services: {
        checkUser: function (username, password) {
            var param = {
                username: username,
                password:password
            }
            $.ajax({
                url: "http://net4.ccs.neu.edu/home/kkapila/MoviesWebService.asmx/checkUser",
                //url:"http://localhost:1316/MoviesWebService.asmx/checkUser",
                data: JSON.stringify(param),
                type: 'post',
                contentType: 'application/json',
                success: function (response) {
                    if (response.d == true) {
                        proj.state.currentUser.username = username;
                        proj.home.dom.login_btn.addClass("page");
                        proj.home.dom.login_btn.removeClass("home results");
                        proj.home.dom.logout_btn.addClass("home results");
                        $(".navbar.navbar-fixed-top").css('z-index', 1038);
                        if(proj.state.previousPage != "results")
                            proj.showPage(proj.state.previousPage);
                        else {
                            proj.results.show(window.movieName);
                        }
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