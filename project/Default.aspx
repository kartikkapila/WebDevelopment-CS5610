<%@ Page Language="C#" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Movie Review Search Engine</title>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="../css/project.css" />
<style>
    .page {
        display:none;
    }
    .detail {
        padding:20px;
    }
    .note,.message {
        display:inline;
    }
    .note {
        background-color: rgb(255, 0, 0);
        color: rgb(255, 255, 255);
        padding: 5px;
        border-radius: 4px;
    }
    .login-username,.login-password,.login-submit-btn {
        width:100%;
        height:30px;
        margin-top:20px;
    }
    .movie-thumbnail {
        height:389px;
        width:263px;
    }
    .movie-title {
        font-size:24px;
        font-weight:500;
    }
    .movie-genre {
        display: table;
        border-radius: 3px;
        font-size: 17px;
        padding: 5px;
        margin-top:10px;
        background-color: rgb(250, 219, 165);
    }
    .movie-overview {
        margin-top:10px;
    }
    .movie-tagline {
        font-size: 30px;
        margin-top:10px;
        color: rgb(184, 196, 135);
    }
    .write-review-action {
        margin:10px;
    }
</style>
</head>
<body>
    <!--Navigation -->
    <div class="navbar navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="collapse navbar-collapse navbar-inverse" role="navigation">
                <ul class="nav navbar-nav">
                    <li><a class="nav-home" href="#">Home</a></li>
                    <li><a class="nav-profile" href="#">Profile</a></li>
                </ul>
            </div>
        </div>
    </div>
    <br /><br /><br />
    <div class="main container">
        <!-- Search Bar -->
        <div class="page home results">
            <input class ="search-input form-control" type="text" placeholder="Search your favorite movie"/>
            <button class="search-btn btn btn-primary">Search</button>
            <button class="login-btn btn btn-danger">Login</button>
            <button class="logout-btn btn btn-danger page">Logout</button>
        </div><br /><br />
        <!-- Search Results Area -->
        <div class="page results">
            <div class="search-results-holder row">
                <div class="col-md-3">
                    <img class="movie-thumbnail" src="#"/>
                </div>
                <div class="col-md-4 movie-info"></div>
                <div class="col-md-5" id="player" style="display:none;"></div>
            </div><br  />
            <h3>Movies You May Like</h3>
            <hr style="padding:0px;margin-bottom:0px;"/>
            <div class="similar-movies-holder"></div>
            <br />
             <div class="reviews-holder col-md-6" style="padding:0px;">
                 <h3>Reviews</h3>
            </div>
        </div>
        <!-- Upcoming Movies -->
        <div class="upcoming-movies-holder col-md-4 page home">
            <h3 class="upcoming-movies-holder-title">Upcoming Movies</h3>
            <hr />
            <div class="upcoming-movies"></div>
            <div class="col-md-2 play-controls">
                <span class="glyphicon glyphicon-chevron-left previous-upcoming-movies" style="font-size:20px;cursor:pointer;opacity:0.8;"></span>       
                <span class="glyphicon glyphicon-chevron-right next-upcoming-movies" style="font-size:20px;cursor:pointer;opacity:0.8;"></span>
            </div>
        </div>
        <!-- In Theatre Movies -->
        <div class="in-theatre-movies home"></div>
        <!-- Details Area -->
        <div class="details-area page login">
            <div class="blank"></div>
            <div class="close">&times</div> 
            <div class="details-holder">            
                <div class="detail">
                    <input class="login-username" type="text" placeholder="Enter Username"/><br />
                    <input class="login-password" type="password" placeholder="Enter Password"/><br />
                    <button class="btn btn-info login-submit-btn">login</button><br /><br /><br /><br />
                    <div class="note">Note:</div><h5 class=".message">For security reasons, we do not allow people to register on this website. If you need to test a
                        functionality for which you need to login, please send me an email(kkapila@ccs.neu.edu) about your information and I shall
                        provide you the credentials.
                    </h5>
                </div>
            </div>
        </div>
        <!-- Profile Page -->
        <div class="profile-page page profile" style="display:none;">
            <h3 class="profile-page-h3">Profile</h3>
            <hr style="margin-bottom:0px;"/>
            <div class="btn-toolbar">
            <h4 class="edit" style="cursor:pointer;">edit</h4>
            </div>
            <hr />
            <div class="row">
                <div class="col-md-3">
                    <img class ="profile-pic" src="../images/profile-pic-default.png" style="height:200px;" />
                </div>
                <div class="col-md-3"">
                    <br />
                    <h5 class="member-since" style="display:inline;">member since:</h5>
                    <h5 class="member-since-value" style="display:inline;">10days</h5>
                    <br /><br />
                    <h5 class="profile-views" style="display:inline;">profile views:</h5>
                    <h5 class="profile-views-value" style="display:inline;">110</h5>
                    <br /><br />
                    <h5 class="email" style="display:inline;">email:</h5>
                    <h5 class="email-value" style="display:inline;">xyz@hotmail.com</h5>
                    <br /><br />
                    <h5 class="real-name" style="display:inline;">real name:</h5>
                    <h5 class="real-name-value" style="display:inline;">kartik</h5>
                </div>
                <div class="col-md-5 about-me-value">
                    <br />
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus malesuada leo urna, eu sollicitudin orci pretium quis. Fusce pharetra, ante eu facilisis ornare, turpis lacus euismod dui, eu consectetur est nulla sit amet mauris. Nunc lacinia eros sed feugiat aliquam. Nullam tempor, ante nec ultricies convallis, nulla tortor consequat sem, ut euismod neque felis ac leo. Donec faucibus lectus felis, vitae sollicitudin nisi egestas vitae. Ut ac justo quam. Nunc facilisis leo sit amet neque laoreet, ut tincidunt diam semper. Etiam libero leo, faucibus nec libero nec, scelerisque vulputate nulla. Vivamus gravida libero feugiat ligula facilisis, et suscipit urna dapibus. Donec iaculis pulvinar turpis non aliquet. Nullam eu mauris sit amet mi porttitor feugiat a et nunc. Vivamus placerat neque augue, et tempus risus pretium eget. Donec scelerisque sagittis imperdiet. In sed enim nec tortor fringilla scelerisque vel nec quam. 
                </div>
            </div>
            <br />
            <hr style="margin-bottom:0px;"/>
            <div class="pagination-area">
                <ul class="nav nav-pills">
                  <li class="active likes"><a href="#">Likes</a></li>
                  <li class="reviews"><a href="#">Reviews</a></li>
                  <li class="messages"><a href="#">Messages</a></li>
                </ul>
            </div>
            <hr />
        </div>
        <!-- Reviews Page-->
        <div class="page review">
            <div class="blank"></div>
            <div class="close">&times</div> 
            <div class="details-holder">            
               <div class="detail">
                   <textarea class="review-area" style="width:100%;height:40%;resize:none;"></textarea>
                   <button class="review-submit-btn btn btn-danger form-control" style="display:block;margin-top:20px;">submit</button>
               </div>
            </div>
       </div>
    </div>
    <!-- Templates -->
    <div class="templates" style="display:none;">
        <img class="upcoming-movies-img templates" src="#" style="height:200px;display:none;"/>
        <!-- similar movies templates -->
        <img class="similar-movie-img templates" src="#" style="height:300px;margin-right:20px;margin-top:20px;"/>
        <div class="suggestion-box templates" style="font-size:20px;"></div>
        <!-- reviews templates -->
        <div class="review-critic results templates" style="display:inline;color:#428BCA;"></div>
        <div class="review-date results templates" style="display:inline;margin-left:10px;"></div>
        <div class="review-quote results templates"></div>
        <div class="review-publisher results templates"></div>
        <button class="like-btn btn-warning templates">like</button>
        <!-- details of the movie -->
        <div class="movie-title results templates"></div>
        <div class="movie-genre results templates"></div>
        <div class="movie-overview results templates"></div>
        <div class="movie-tagline results templates"></div>
        <button class="write-review-action results templates btn btn-success">Write a Review</button>
    </div>
    <form id="form1" runat="server">
    </form>
    <script src="../jquery/jquery-2.1.0.min.js"></script>
    <script src="../javascript/bootstrap.min.js"></script>
    <script src="../javascript/proj.js"></script>
    <script src="../javascript/proj.home.js"></script>
    <script src="../javascript/proj.results.js"></script>
    <script src="../javascript/proj.profile.js"></script>
    <script src="../javascript/proj.controller.js"></script>
    <script src="../javascript/proj.login.js"></script>
    <script src="../javascript/proj.review.js"></script>
</body>
</html>