$(function() {
    proj.init();
});

var proj = {
    state: {
        currentUser: {
            username:null
        },
        previousPage:null,
        currentPage:"home"
    },

    init: function () {
        proj.home.init();
        proj.results.init();
        proj.profile.init();
        proj.controller.init();
        proj.login.init();
        proj.review.init();
        proj.showPage("home");
    },
    showPage: function (pageName) {
        $(".page").hide();
        $(".page." + pageName).show();
        this.state.previousPage = this.state.currentPage
        this.state.currentPage = pageName;
    }
}