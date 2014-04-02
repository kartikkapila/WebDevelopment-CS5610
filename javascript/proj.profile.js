proj.profile = {
    showPage: function (username) {
        console.log(username);
        proj.profile.services.getUserInfo(username, proj.profile.renderer.displayUserInfo);
        proj.showPage("profile");
    },
    init: function () {
        proj.profile.dom.init();
    },
    dom: {
        edit:null,
        profile_views_value: null,
        email_value: null,
        real_name_value: null,
        about_me_value:null,

        init: function () {
            proj.profile.dom.edit = $(".edit");
            proj.profile.dom.profile_views_value = $(".profile-views-value");
            proj.profile.dom.email_value = $(".email-value");
            proj.profile.dom.real_name_value = $(".real-name-value");
            proj.profile.dom.about_me_value = $(".about-me-value");
        }
    },
    controller: {
        init: function () {
        }
    },
    services: {
        init: function () {
        },
        getUserInfo: function (username, callback) {
            var param = {
                username: ""+username
            }
            $.ajax({
                url: 'http://localhost:1316/MoviesWebService.asmx/getUserInfoByUsername',
                data: JSON.stringify(param),
                type: "post",
                contentType: "application/json",
                success: callback
            });
        }
    },
    renderer: {
        displayUserInfo: function (response) {
            console.log(response);
            proj.profile.dom.profile_views_value.html(response.d.profileViews);
            proj.profile.dom.email_value.html(response.d.email);
            proj.profile.dom.real_name_value.html(response.d.name);
            proj.profile.dom.about_me_value.html(response.d.aboutMe)
        }
    }
}