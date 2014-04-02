proj.results = {
    init: function () {
        this.dom.init();
        this.controller.init();
    },
    show: function (movieName) {
        proj.results.services.getMoviebyName(movieName, proj.results.renderer.renderSearchedMovie);
        proj.results.services.getYouTubeId(movieName);
        proj.showPage("results");
    },
    shared_variables: {
        movieId: null,
        videoId: null
    },
    dom: {
        search_input: null,
        search_btn: null,
        login_btn: null,
        search_results_holder: null,
        movie_thumbnail: null,
        similar_movies_holder: null
    },
    init: function () {
        proj.results.dom.movie_thumbnail = $(".movie-thumbnail");
        proj.results.dom.search_input = $(".search-input");
        proj.results.dom.search_btn = $(".search-btn");
        proj.results.dom.login_btn = $(".login-btn");
        proj.results.dom.search_results_holder = $(".search-results-holder");
        proj.results.dom.similar_movies_holder = $(".similar-movies-holder");
    },
    controller: {
        init: function () {
        },

        findMovieOnYouTubeById: function () {
            console.log('here to play youtube video');
            $("#player").css('display', 'inline-block');
            var tag = document.createElement('script');
            tag.src = "https://www.youtube.com/iframe_api";
            var firstScriptTag = document.getElementsByTagName('script')[0];
            firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
            window.onYouTubeIframeAPIReady = function () {
                youtubePlayer = new YT.Player('player', {
                    height: '390',
                    width: '640',
                    videoId: "" + proj.results.shared_variables.videoId,
                    events: {
                        'onReady': onPlayerReady
                    }
                });
            }
            window.onPlayerReady = function (event) {
                event.target.playVideo();
            }
            if (typeof (window.youtubePlayer) != 'undefined')
                window.youtubePlayer.loadVideoById(proj.results.shared_variables.videoId);
        },
    },
    services: {
        getMoviebyName: function (movieName, callback) {
            var params = {
                apikey: "y89qq3t53gmyxjrna294v2jg",
                q: movieName
            };
            $.ajax({
                url: "http://api.rottentomatoes.com/api/public/v1.0/movies.json?",
                data: params,
                dataType: "jsonp",
                success: callback
            });
        },

        getMovieById: function (id, callback) {
            var params = {
                apikey: "y89qq3t53gmyxjrna294v2jg",
            }
            $.ajax({
                url: "http://api.rottentomatoes.com/api/public/v1.0/movies/" + id + ".json?",
                data: params,
                dataType: "jsonp",
                success: callback
            });
        },

        getSimilarMoviesbyId: function (id, callback) {
            var params = {
                apikey: "y89qq3t53gmyxjrna294v2jg",
                limit: 5
            };
            $.ajax({
                url: "http://api.rottentomatoes.com/api/public/v1.0/movies/" + id + "/similar.json?",
                data: params,
                dataType: "jsonp",
                success: callback
            });
        },

        getYouTubeId: function (movieName) {
            $.ajax({
                url: "https://www.googleapis.com/youtube/v3/search?part=snippet&q=" + movieName + "Trailer" + "&type=video&key=AIzaSyDHaNEKN20GYUi9OGdwjDDQT1FztnmTOEg",
                success: function (response) {
                    console.log('youtube video id in response below');
                    console.log(response);
                    proj.results.shared_variables.videoId = response.items[0].id.videoId;
                    proj.results.controller.findMovieOnYouTubeById();
                }
            });
        }
    },

    renderer: {
        renderSearchedMovie: function (response) {
            if (typeof (response.movies) == 'undefined') {
                proj.results.dom.movie_thumbnail.attr('src', response.posters.original).attr('id', "tt" + response.alternate_ids.imdb).fadeIn(700, "swing");
                proj.results.shared_variables.movieId = response.id;
            } else {
                proj.results.dom.movie_thumbnail.attr("src", response.movies[0].posters.original).attr('id', "tt" + response.movies[0].alternate_ids.imdb).fadeIn(700, "swing");
                proj.results.shared_variables.movieId = response.movies[0].id;
            }
            if (proj.results.shared_variables.movieId != null) {
                proj.results.services.getSimilarMoviesbyId(proj.results.shared_variables.movieId, proj.results.renderer.renderSimilarMovies);
            }
        },
        renderSimilarMovies: function (response) {
            proj.results.dom.similar_movies_holder.empty();
            var similar_img = $(".similar-movie-img").clone().removeClass("templates");
            for (var i = 0; i < response.movies.length; i++) {
                proj.results.dom.similar_movies_holder.append(
                    similar_img
                    .clone()
                    .attr('src', response.movies[i].posters.original)
                    .attr('id', response.movies[i].title)
                    .fadeIn(700, "swing")
                    .on('click', response, function (response) {
                        proj.results.show(response.currentTarget.id);
                    }));
            }
        }
    }
};