$(function() {
    proj.init();
});

var proj = {
    state: {
        currentUser: {
            username:null
        },
        currentPage:"home"
    },

    init: function () {
        proj.home.init();
        proj.results.init();
        proj.profile.init();
        proj.controller.init();
        proj.login.init();
        proj.showPage("home");
    },
    showPage: function (pageName) {
        $(".page").hide();
        $(".page." + pageName).show();
        this.state.currentPage = pageName;
    }
}