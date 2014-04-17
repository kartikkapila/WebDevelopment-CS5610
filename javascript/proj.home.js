proj.home = {

    init: function () {
        this.dom.init();
        this.controller.init();
        this.services.init();
    },
    shared_variables:{
        total_upcoming_movies:null
    },

    dom: {
        search_input: null,
        search_btn: null,

        login_btn: null,
        logout_btn: null,

        upcoming_movies_holder: null,
        upcoming_movies: null,
        upcoming_movies_info:null,
        upcoming_movies_title: null,
        upcoming_movies_release_date: null,
        upcoming_movies_synopsis: null,
        upcoming_movies_runtime: null,
        upcoming_movie_casts: null,
        upcoming_movies_casts_img:null,

        previous_upcoming_movies: null,
        next_upcoming_movies: null,

        top_favorite_movies: null,
        top_favorites_img :null,

        in_theatre_movies: null,
        in_theatre_movies_img:null,

        init: function () {
            // search area
            proj.home.dom.search_input = $(".search-input");
            proj.home.dom.search_btn = $(".search-btn");
            
            // login, logout area
            proj.home.dom.login_btn = $(".login-btn");
            proj.home.dom.logout_btn = $(".logout-btn");

            // upcoming movies area
            proj.home.dom.upcoming_movies_holder = $(".upcoming-movies-holder");
            proj.home.dom.upcoming_movies = $(".upcoming-movies");
            proj.home.dom.upcoming_movies_info = $(".upcoming-movies-info");

            proj.home.dom.upcoming_movies_title = $(".upcoming-movies-title").clone().removeClass("templates");
            proj.home.dom.upcoming_movies_release_date = $(".upcoming-movies-release-date").clone().removeClass("templates");
            proj.home.dom.upcoming_movies_synopsis = $(".upcoming-movies-synopsis").clone().removeClass("templates");
            proj.home.dom.upcoming_movies_runtime = $(".upcoming-movies-runtime").clone().removeClass("templates");
            proj.home.dom.upcoming_movie_casts = $(".upcoming-movie-casts");
            proj.home.dom.upcoming_movies_casts_img = $(".upcoming-movies-casts-img");

            //top favorites
            proj.home.dom.top_favorite_movies = $(".top-favorite-movies");
            proj.home.dom.top_favorites_img = $(".top-favorites-img").clone().removeClass("templates");

            // slider controls
            proj.home.dom.previous_upcoming_movies = $(".previous-upcoming-movies");
            proj.home.dom.next_upcoming_movies = $(".next-upcoming-movies");

            // in theatre movies area
            proj.home.dom.in_theatre_movies_holder = $(".in-theatre-movies-holder");
            proj.home.dom.in_theatre_movies_img = $(".in-theatre-movies-img");
        }
    },
    controller: {
        init: function () {
            proj.home.dom.search_input.focus();

            // play controls
            proj.home.dom.previous_upcoming_movies.click(function () {
                proj.home.controller.display_data(2);
            });
            proj.home.dom.next_upcoming_movies.click(function () {
                proj.home.controller.display_data(1);
            });
            // search action controls
            proj.home.dom.search_btn.click(proj.home.controller.search_btn_clicked);
            proj.home.dom.search_input.keypress(function (event) {
                if (event.keyCode == 13) {
                    proj.home.controller.search_btn_clicked();
                }
            });
            // login controls
            proj.home.dom.login_btn.click(proj.home.controller.login_btn_clicked);
            proj.home.dom.logout_btn.click(proj.home.controller.logout_btn_clicked);

        },
        // display search results
        search_btn_clicked: function (event) {
            if (proj.home.dom.search_input.val() != "") {
                proj.results.show(proj.home.dom.search_input.val());
            }
        },
        login_btn_clicked: function() {
            proj.login.showPage();
        },
        logout_btn_clicked: function () {
            proj.state.currentUser.username = null;
            proj.home.dom.login_btn.removeClass("page");
            proj.home.dom.login_btn.addClass("page home results");
            proj.home.dom.logout_btn.removeClass("home results");
            proj.showPage(proj.state.currentPage);
        },
        // upcoming movies clicked action
        handleUpcomingMoviesClicked: function(event) {
            proj.results.show(event.currentTarget.id);
        },
        // top favorites clicked
        handleTopFavoriteMovieClicked: function (event) {
            proj.results.show(event.currentTarget.id);
        },
        // in theatre movies clicked
        handleInTheatreMoviesClicked: function (event) {
            proj.results.show(event.currentTarget.id);
        }
        ,
        // display control
        display_data:function(flag) {
            /* flag = 0 : Display first item
             * flag = 1 : Display next item
             * flag = 2 : Display previous item
             */
            var classHolder = 0;
            if (flag == 0) {
                $(".upcoming-movies ." + 4).fadeIn(500, "swing");
            } else if (flag == 1) {
                for (var j = 0; j < proj.home.shared_variables.total_upcoming_movies; j++) {
                    if ($(".upcoming-movies ." + j).css('display') == 'inline') {
                        $(".upcoming-movies ." + j).css('display','none');
                        $(".upcoming-movies ." + ((j + 1) % proj.home.shared_variables.total_upcoming_movies)).fadeIn(2000, "swing");
                        classHolder = (j + 1) % proj.home.shared_variables.total_upcoming_movies;
                        break;
                    }
                }
            } else if (flag == 2) {
                if ($(".upcoming-movies ." + 0).css('display') == 'inline') {
                    $(".upcoming-movies ." + 0).css('display', 'none');
                    $(".upcoming-movies ." + (proj.home.shared_variables.total_upcoming_movies - 1)).fadeIn(2000, "linear");
                    classHolder = proj.home.shared_variables.total_upcoming_movies - 1;
                } else {
                    for (var j = 1; j < proj.home.shared_variables.total_upcoming_movies; j++) {
                        if ($(".upcoming-movies ." + j).css('display') == 'inline') {
                            $(".upcoming-movies ." + j).css('display', 'none');
                            $(".upcoming-movies ." + (j - 1)).fadeIn(500, "linear");
                            classHolder = j - 1;
                            break;
                        }
                    }
                }
            }

            proj.home.renderer.renderUpcomingMoviesInfo(classHolder);
        },

        mouseEntered: function (event) {
            $(this).css('border', 'solid red');
        },

        mouseLeave: function (event) {
            $(this).css('border', 'solid black');
        }
    },

    services: {
        init: function () {
            proj.home.services.loadUpcomingMovies(proj.home.renderer.renderUpcomingMovies);
            proj.home.services.loadTopFavoriteMovies(proj.home.renderer.renderTopFavoriteMovies);
            proj.home.services.loadInTheatreMovies(proj.home.renderer.renderInTheatreMovies);
        },
        loadUpcomingMovies: function (callback) {
            var param = {
                apikey: "y89qq3t53gmyxjrna294v2jg",
            }
            $.ajax({
                url: "http://api.rottentomatoes.com/api/public/v1.0/lists/movies/upcoming.json?",
                data: param,
                dataType: 'jsonp',
                success: callback
            });
        },

        loadTopFavoriteMovies:function(callback) {
            $.ajax({
                url: "http://net4.ccs.neu.edu/home/kkapila/MoviesWebService.asmx/getTopFavorites",
                //url:"http://localhost:1316/MoviesWebService.asmx/getTopFavorites"
                type: 'post',
                contentType: 'application/json',
                success: callback
            });
        },

        loadInTheatreMovies: function (callback) {
            var param = {
                apikey: "y89qq3t53gmyxjrna294v2jg",
                page_limit:5
            }
            $.ajax({
                url: 'http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?',
                data:param,
                dataType: 'jsonp',
                success:callback
            })
        },
        getUpcomingMoviesCastInfo: function (imdbId,callback) {
            var params = {
                api_key:'56723ab4454644a4f493306c8d6c7240'
            }
            $.ajax({
                url:"https://api.themoviedb.org/3/movie/" + imdbId + "/credits?",
                data: params,
                dataType: 'jsonp',
                success:callback
            })
        }
    },

    renderer: {

        renderUpcomingMovies: function (response) {
            var k = 0;
            var upcoming_movies_img = $(".upcoming-movies-img")
                .clone()
                .removeClass("templates");
            

            proj.home.shared_variables.total_upcoming_movies = response.movies.length;
            proj.home.dom.upcoming_movies.empty();

            for (var i = 0; i < proj.home.shared_variables.total_upcoming_movies; i++) {
                if (response.movies[i].posters.profile != "http://images.rottentomatoescdn.com/images/redesign/poster_default.gif") {
                    proj.home.dom.upcoming_movies.append(
                        upcoming_movies_img
                        .clone()
                        .attr('src', response.movies[i].posters.original)
                        .attr('id',response.movies[i].title)
                        .addClass("" + k)
                        .on('click', proj.home.controller.handleUpcomingMoviesClicked)
                        .on('mouseenter', response, proj.home.controller.mouseEntered)
                        .on('mouseleave', response, proj.home.controller.mouseLeave)
                        .data("movie", response.movies[i]));
                    k++;
                }
            }
            proj.home.shared_variables.total_upcoming_movies = k;
            proj.home.controller.display_data(0);
        },

        renderTopFavoriteMovies: function (response) {
            for (var i = 0; i < response.d.length; i++) {
                proj.results.services.searchMovieInfo(response.d[i].imdbId, proj.home.renderer.renderTopFavoritesInfoReceived);
            }
        },

        renderTopFavoritesInfoReceived: function (response) {
            proj.home.dom.top_favorite_movies.append(
                proj.home.dom.top_favorites_img.clone()
                   .attr('src', "http://image.tmdb.org/t/p/w300" + response.poster_path)
                   .attr('id', response.original_title)
                   .on('click',proj.home.controller.handleTopFavoriteMovieClicked)
                   .on('mouseenter', response, proj.home.controller.mouseEntered)
                   .on('mouseleave', response, proj.home.controller.mouseLeave)).hide().fadeIn("slow");
        },

        renderInTheatreMovies: function (response) {
            var img_original = proj.home.dom.in_theatre_movies_img.clone().removeClass("templates");
            for (var i = 0; i < response.movies.length; i++) {
                proj.home.dom.in_theatre_movies_holder.append(img_original
                    .clone()
                    .attr('id',response.movies[i].title)
                    .attr('src', response.movies[i].posters.original)
                    .on('click', proj.home.controller.handleInTheatreMoviesClicked)
                    .on('mouseenter', response, proj.home.controller.mouseEntered)
                    .on('mouseleave', response, proj.home.controller.mouseLeave)).hide().fadeIn("slow");
            }
        },

        renderUpcomingMoviesInfo: function (movieClass) {
            var currentUpcomingMovieData = $("." + movieClass).data().movie;
            proj.home.dom.upcoming_movies_title.html(currentUpcomingMovieData.title);
            proj.home.dom.upcoming_movies_release_date.html("In Theaters:" + currentUpcomingMovieData.release_dates.theater);
            proj.home.dom.upcoming_movies_synopsis.html(currentUpcomingMovieData.synopsis);
            proj.home.dom.upcoming_movies_runtime.html("<b>Runtime:" + currentUpcomingMovieData.runtime + " mins</b>");
            
            proj.home.dom.upcoming_movies_info.append(
                proj.home.dom.upcoming_movies_title,
                proj.home.dom.upcoming_movies_release_date,
                proj.home.dom.upcoming_movies_synopsis,
                proj.home.dom.upcoming_movies_runtime).hide();

            proj.home.services.getUpcomingMoviesCastInfo("tt" + currentUpcomingMovieData.alternate_ids.imdb,proj.home.renderer.renderUpcomingMoviesCastInfo);

        },
        renderUpcomingMoviesCastInfo: function (response) {
            proj.home.dom.upcoming_movie_casts.empty();
            var cast_img = proj.home.dom.upcoming_movies_casts_img.clone().removeClass("templates");
            if (response.cast.length > 4) {
                for (var i = 0; i < 4; i++) {
                    if(response.cast[i].profile_path != null)
                        proj.home.dom.upcoming_movie_casts.append(
                            cast_img.attr('src', "http://image.tmdb.org/t/p/w300/" + response.cast[i].profile_path).clone());
                }
                proj.home.dom.upcoming_movies_info.append(proj.home.dom.upcoming_movie_casts).fadeIn("slow");

            } else {
                for (var i = 0; i < response.cast.length; i++) {
                    if (response.cast[i].profile_path != null)
                        proj.home.dom.upcoming_movie_casts.append(
                            cast_img.attr('src', "http://image.tmdb.org/t/p/w300/" + response.cast[i].profile_path).clone());
                }
                proj.home.dom.upcoming_movies_info.append(proj.home.dom.upcoming_movie_casts).fadeIn("slow");

            }
        }
    }
}