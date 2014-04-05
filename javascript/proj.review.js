proj.review = {
    init: function () {
        proj.review.dom.init();
        proj.review.controller.init();
    },
    showPage:function(id) {
        proj.showPage("review");
        proj.review.dom.review_submit_btn.attr('id',id);
    },
    dom: {
        review_area: null,
        review_submit_btn: null,

        init: function () {
            proj.review.dom.review_area = $(".review-area");
            proj.review.dom.review_submit_btn = $(".review-submit-btn");
        }
    },
    controller: {
        init: function () {
            proj.review.dom.review_submit_btn.click(function (e) {
                if (proj.review.dom.review_area.val() != "") {
                    proj.review.services.saveReview(proj.review.dom.review_area.val());
                }
            });
        }
    },
    services: {
        saveReview: function (review) {
            var newReviewOrLike = {
                username: proj.state.currentUser.username,
                critic: proj.state.currentUser.username,
                quote: review,
                imdbId: proj.review.dom.review_submit_btn.attr("id"),
                isCriticAMember: "true",
                reviewOrLikes: "review"
            }
            $.ajax({
                url: "http://localhost:1316/MoviesWebService.asmx/saveReview",
                data: JSON.stringify({ 'newReviewOrLike': newReviewOrLike }),
                type: 'post',
                contentType: 'application/json',
                dataType:'json',
                success: function (response) {
                    if (response.d == true) {
                        alert('Your review has been stored');
                        proj.showPage("results");
                    }
                }
            });
        }
    },
    renderer: {

    }
}