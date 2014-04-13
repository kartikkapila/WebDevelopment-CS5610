proj.profile = {
    showPage: function (username) {
        proj.profile.shared_variables.username = username;
        proj.profile.services.init();
        proj.profile.controller.init();
        proj.profile.controller.handleWelcomeMessage(username);
        proj.showPage("profile");
    },
    shared_variables: {
        username: null,
    },
    init: function () {
        proj.profile.dom.init();
    },
    dom: {

        profile_pic:null,
        user_username:null,
        profile_views_value: null,
        email_value: null,
        real_name_value: null,
        about_me_value: null,
        displaying_profile_info: null,
        user_favorites:null,
        user_reviews:null,
        profile_movie_img: null,
        profile_movie_quote: null,
        profile_reviews_more_info_link: null,
        a_review:null,

        init: function () {
            proj.profile.dom.profile_pic = $(".profile-pic");
            proj.profile.dom.user_username = $(".user-username");
            proj.profile.dom.profile_views_value = $(".profile-views-value");
            proj.profile.dom.email_value = $(".email-value");
            proj.profile.dom.real_name_value = $(".real-name-value");
            proj.profile.dom.about_me_value = $(".about-me-value");
            proj.profile.dom.displaying_profile_info = $(".displaying-profile-info");
            proj.profile.dom.user_favorites = $(".user-favorites");
            proj.profile.dom.user_reviews = $(".user-reviews");
            proj.profile.dom.profile_movie_quote = $(".profile-movie-quote").clone().removeClass("templates");
            proj.profile.dom.profile_movie_img = $(".profile-movie-img").clone().removeClass("templates");
            proj.profile.dom.profile_reviews_more_info_link = $(".profile-reviews-more-info-link").clone().removeClass("templates");
            proj.profile.dom.a_review = $(".a-review").clone().removeClass("templates");
        }
    },
    controller: {
        init: function () {
            if (proj.profile.dom.user_favorites.hasClass('active')) {
                proj.profile.services.getFavoritesInfo(proj.profile.services.serviceFavoritesInfo);
            } else if (proj.profile.dom.user_reviews.hasClass('active')) {
                proj.profile.services.getReviewsInfo(proj.profile.services.serviceReviewInfo);
            }

            proj.profile.dom.user_favorites.click(function () {
                if (!proj.profile.dom.user_favorites.hasClass('active')) {
                    proj.profile.dom.user_favorites.addClass('active');
                    proj.profile.dom.user_reviews.removeClass('active');
                    proj.profile.services.getFavoritesInfo(proj.profile.services.serviceFavoritesInfo);
                }
            });

            proj.profile.dom.user_reviews.click(function () {
                if (!proj.profile.dom.user_reviews.hasClass('active')) {
                    proj.profile.dom.user_reviews.addClass('active');
                    proj.profile.dom.user_favorites.removeClass('active');
                    proj.profile.services.getReviewsInfo(proj.profile.services.serviceReviewInfo);
                }
            });
        },

        moreInformationAskedFor: function (event) {
            var imdbId = event.currentTarget.id;
            proj.profile.services.getMovieNameFromId(imdbId);
        },

        handleWelcomeMessage: function (username) {
            if (proj.state.currentUser.username != null) {
                if (proj.state.currentUser.username != username) {
                    proj.profile.dom.user_username.html(
                        "Welcome " + proj.state.currentUser.username +
                        ", you are currently viewing " + username + " profile");
                } else {
                    proj.profile.dom.user_username.html("Welcome " + proj.state.currentUser.username);
                }
            } else {
                proj.profile.dom.user_username.html("you are currently viewing " + username + " profile");
            }
        }
    },

    services: {

        init: function () {
            proj.profile.services.getUserInfo(proj.profile.shared_variables.username, proj.profile.renderer.displayUserInfo);
        },

        getUserInfo: function (username, callback) {
            var param = {
                username: ""+username
            }
            $.ajax({
                url: 'http://net4.ccs.neu.edu/home/kkapila/MoviesWebService.asmx/getUserInfoByUsername',
//                url: "http://localhost:1316/MoviesWebService.asmx/getUserInfoByUsername",
                data: JSON.stringify(param),
                type: "post",
                contentType: "application/json",
                success: callback
            });
        },

        getFavoritesInfo: function(callback) {
            var param = {
                username:proj.profile.shared_variables.username
            }
            $.ajax({
                url:"http://net4.ccs.neu.edu/home/kkapila/MoviesWebService.asmx/getFavorites",
                //url: "http://localhost:1316/MoviesWebService.asmx/getFavorites",
                data: JSON.stringify(param),
                type: 'post',
                contentType: 'application/json',
                success: callback
            });
        },

        getReviewsInfo: function (callback) {
            var param = {
                username: proj.profile.shared_variables.username
            }
            $.ajax({
                url:"http://net4.ccs.neu.edu/home/kkapila/MoviesWebService.asmx/getReviews",
                //url: "http://localhost:1316/MoviesWebService.asmx/getReviews",
                data: JSON.stringify(param),
                type: 'post',
                contentType: 'application/json',
                success: callback
            });
        },

        serviceFavoritesInfo: function (response) {
            proj.profile.dom.displaying_profile_info.empty();
            if (response.d.length != 0) {
                for (var i = 0; i < response.d.length; i++) {
                    var imdbId = response.d[i].imdbId;
                    proj.results.services.searchMovieInfo(imdbId, proj.profile.renderer.renderFavoriteMovie);
                }
            }
        },

        serviceReviewInfo: function (response) {
            proj.profile.dom.displaying_profile_info.empty();
            if (response.d.length != 0) {
                for (var i = 0; i < response.d.length; i++) {
                    var imdbId = response.d[i].imdbId;
                    var quote = response.d[i].quote;
                    proj.profile.renderer.renderReviews(imdbId, quote);
                }
            }
        },
        getMovieNameFromId: function (imdbId) {
            proj.results.services.searchMovieInfo(imdbId,proj.profile.services.extractMovieName);
        },
        extractMovieName: function (response) {
            proj.results.show(response.original_title);
        }

    },

    renderer: {

        displayUserInfo: function (response) {
            proj.profile.dom.profile_pic.attr('src', response.d.imgsrc);
            proj.profile.dom.profile_views_value.html(response.d.profileViews);
            proj.profile.dom.email_value.html(response.d.email);
            proj.profile.dom.real_name_value.html(response.d.name);
            proj.profile.dom.about_me_value.html(response.d.aboutMe)
        },

        renderFavoriteMovie: function (response) {
            proj.profile.dom.profile_movie_img
                .attr('src', "http://image.tmdb.org/t/p/w300" + response.poster_path)
                .attr('id',response.imdb_id);
            proj.profile.dom.displaying_profile_info.append(
                proj.profile.dom.profile_movie_img.clone().on('click',proj.profile.controller.moreInformationAskedFor)
                );
        },

        renderReviews: function (imdbId, quote) {
            proj.profile.dom.profile_reviews_more_info_link.attr('id', imdbId);
            proj.profile.dom.profile_movie_quote.html(quote + "<br>").attr('id', imdbId);
            proj.profile.dom.displaying_profile_info.append(
                proj.profile.dom.profile_movie_quote.clone()
                .append(proj.profile.dom.profile_reviews_more_info_link.clone().on('click', proj.profile.controller.moreInformationAskedFor)));
        }
    }
}