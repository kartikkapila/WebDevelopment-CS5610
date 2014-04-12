proj.controller = {
    init: function () {
        proj.controller.dom.init();
        proj.controller.controller.init();
    },
    dom:{
        nav_home: null,
        nav_profile: null,

        init: function () {
            proj.controller.dom.nav_home = $(".nav-home");
            proj.controller.dom.nav_profile = $(".nav-profile");
        }
    },
    controller: {
        init: function () {
            proj.controller.dom.nav_home.click(function () {
                proj.showPage("home");
            });

            proj.controller.dom.nav_profile.click(function () {
                if (proj.state.currentUser.username == null) {
                    proj.login.showPage("login");
                } else {
                    proj.profile.showPage(proj.state.currentUser.username);
                }
            });
        }
    },
    services: {
    },
    renderer: {
        
    }
}