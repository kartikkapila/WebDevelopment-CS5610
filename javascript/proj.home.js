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
        upcoming_movies_holder: null,
        upcoming_movies: null,
        previous_upcoming_movies: null,
        next_upcoming_movies: null,

        init: function () {
            proj.home.dom.search_input = $(".search-input");
            proj.home.dom.search_btn = $(".search-btn");
            proj.home.dom.upcoming_movies_holder = $(".upcoming-movies-holder");
            proj.home.dom.login_btn = $(".login-btn");
            proj.home.dom.upcoming_movies = $(".upcoming-movies");
            proj.home.dom.previous_upcoming_movies = $(".previous-upcoming-movies");
            proj.home.dom.next_upcoming_movies = $(".next-upcoming-movies");
        }
    },

    controller: {
        init: function () {
            proj.home.dom.search_input.focus();

            // play controls
            proj.home.dom.previous_upcoming_movies.on('mouseenter',this.mouseEnterOnPrevious);
            proj.home.dom.previous_upcoming_movies.on('mouseleave',this.mouseLeaveOnPrevious);
            proj.home.dom.previous_upcoming_movies.click(function () {
                proj.home.controller.display_data(2);
            });
            proj.home.dom.next_upcoming_movies.on('mouseenter',this.mouseEnterOnNext);
            proj.home.dom.next_upcoming_movies.on('mouseleave',this.mouseLeaveOnNext);
            proj.home.dom.next_upcoming_movies.click(function () {
                proj.home.controller.display_data(1);
            });

            proj.home.dom.search_btn.click(proj.home.controller.search_btn_clicked);
            proj.home.dom.search_input.keypress(function (event) {
                if (event.keyCode == 13) {
                    proj.home.controller.search_btn_clicked();
                }
            });
            proj.home.dom.login_btn.click(proj.home.controller.login_btn_clicked);
        },
        mouseEnterOnPrevious: function () {
            $(this).css('opacity', 1.0);
        },
        mouseLeaveOnPrevious:function() {
            $(this).css('opacity',0.7);
        },
        mouseEnterOnNext: function () {
            $(this).css('opacity', 1.0);
        },
        mouseLeaveOnNext: function () {
            $(this).css('opacity', 0.7);
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
        display_data:function(flag) {
            /* flag = 0 : Display first item
             * flag = 1 : Display next item
             * flag = 2 : Display previous item
             */
            if (flag == 0) {
                $(".upcoming-movies #" + 0).fadeIn(500, "swing");
            } else if (flag == 1) {
                for (var j = 0; j < proj.home.shared_variables.total_upcoming_movies; j++) {
                    if ($(".upcoming-movies #" + j).css('display') == 'inline') {
                        $(".upcoming-movies #" + j).css('display','none');
                        $(".upcoming-movies #" + ((j + 1) % proj.home.shared_variables.total_upcoming_movies)).fadeIn(2000, "swing");
                        return;
                    }
                }
            } else if (flag == 2) {
                if ($(".upcoming-movies #" + 0).css('display') == 'inline') {
                    $(".upcoming-movies #" + 0).css('display', 'none');
                    $(".upcoming-movies #" + (proj.home.shared_variables.total_upcoming_movies - 1)).fadeIn(2000, "linear");
                } else {
                    for (var j = 1; j < proj.home.shared_variables.total_upcoming_movies; j++) {
                        if ($(".upcoming-movies #" + j).css('display') == 'inline') {
                            $(".upcoming-movies #" + j).css('display', 'none');
                            $(".upcoming-movies #" + (j - 1)).fadeIn(500, "linear");
                            return;
                        }
                    }
                }
            }
        }
    },

    services: {
        init: function () {
            var param = {
                apikey: "y89qq3t53gmyxjrna294v2jg",
            }
            $.ajax({
                url: "http://api.rottentomatoes.com/api/public/v1.0/lists/movies/upcoming.json?",
                data: param,
                dataType: 'jsonp',
                success: proj.home.renderer.renderUpcomingMovies
            });
        }
    },

    renderer: {
        renderUpcomingMovies: function (response) {
            var k = 0;
            var upcoming_movies_img = $(".upcoming-movies-img").clone().removeClass("templates");
            proj.home.shared_variables.total_upcoming_movies = response.movies.length;
            proj.home.dom.upcoming_movies.empty();
            for (var i = 0; i < proj.home.shared_variables.total_upcoming_movies; i++) {
                if (response.movies[i].posters.profile != "http://images.rottentomatoescdn.com/images/redesign/poster_default.gif") {
                    proj.home.dom.upcoming_movies.append(upcoming_movies_img.clone().attr('src', response.movies[i].posters.profile)
                        .attr('id', k));
                    k++;
                }
            }
            proj.home.shared_variables.total_upcoming_movies = k;
            proj.home.controller.display_data(0);
        }
    }
}