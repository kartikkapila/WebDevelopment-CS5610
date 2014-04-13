<%@ Page Language="C#" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Movie Review Search Engine</title>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="../css/project.css" />
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
        <div class="page home results search-bar">
            <input class ="search-input form-control" type="text" placeholder="Search your favorite movie"/>
            <button class="search-btn btn btn-primary">Search</button>
            <button class="login-btn btn btn-danger">Login</button>
            <button class="logout-btn btn btn-danger page">Logout</button>
        </div>
        <!-- Upcoming Movies -->
        <div class="upcoming-movies-holder row page home">
            <h3 class="upcoming-movies-holder-title">Upcoming Movies</h3>
            <hr /><br />
            <div class="row upcoming-movie-area">
                <div class="upcoming-movies col-md-3"></div>
                <div class="upcoming-movies-info col-md-8">
                    <h3 class="upcoming-movies-title"></h3>
                    <h4 class="upcoming-movies-release-date"></h4>
                    <pre class="upcoming-movies-synopsis"></pre>
                    <h5 class="upcoming-movies-runtime"></h5>
                    <div class="upcoming-movie-casts"></div>
                </div>
            </div>
            <div class="row play-controls">
                <button class="btn btn-success previous-upcoming-movies">back</button>
                <button class="btn btn-success next-upcoming-movies">next</button>
            </div>
        </div>
        <!-- In Theatre Movies -->
        <div class="in-theatre-movies-holder page home">
            <h3 class="in-theatre-movies-holder-title row">In Theatre Movies</h3>
            <hr />
        </div>
        <!-- Login Area -->
        <div class="details-area page login">
            <div class="blank"></div>
            <div class="details-holder">            
                <div class="detail">
                     <div class="close">&times</div> 
                    <input class="login-username" type="text" placeholder="Enter Username"/><br />
                    <input class="login-password" type="password" placeholder="Enter Password"/><br />
                    <button class="btn btn-info login-submit-btn">login</button><br /><br /><br /><br />
                    <div class="note">Note:</div><h5 class="message">For security reasons, we do not allow people to register on this website. If you need to test a
                        functionality for which you need to login, please send me an email(kkapila@ccs.neu.edu) about your information and I shall
                        provide you the credentials.</h5>
                </div>
            </div>
        </div>
        <!-- Profile Page -->
        <div class="profile-page page profile">
            <h3 class="profile-page-h3">Profile</h3><hr />
            <div class="btn-toolbar">
                <h4 class="edit">edit</h4>
            </div><hr />
            <br />
            <div class="row">
                <div class="col-md-3">
                    <img class ="profile-pic" src="../images/profile-pic-default.png" />
                </div>
                <div class="col-md-3"">
                    <br />
                    <h5 class="member-since">member since:</h5><h5 class="member-since-value">10days</h5>
                    <br /><br />
                    <h5 class="profile-views">profile views:</h5><h5 class="profile-views-value">110</h5>
                    <br /><br />
                    <h5 class="email">email:</h5><h5 class="email-value">xyz@hotmail.com</h5>
                    <br /><br />
                    <h5 class="real-name">real name:</h5><h5 class="real-name-value">kartik</h5>
                </div>
                <div class="col-md-5 about-me-value">
                    <br />
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus malesuada leo urna, eu sollicitudin orci pretium quis. Fusce pharetra, ante eu facilisis ornare, turpis lacus euismod dui, eu consectetur est nulla sit amet mauris. Nunc lacinia eros sed feugiat aliquam. Nullam tempor, ante nec ultricies convallis, nulla tortor consequat sem, ut euismod neque felis ac leo. Donec faucibus lectus felis, vitae sollicitudin nisi egestas vitae. Ut ac justo quam. Nunc facilisis leo sit amet neque laoreet, ut tincidunt diam semper. Etiam libero leo, faucibus nec libero nec, scelerisque vulputate nulla. Vivamus gravida libero feugiat ligula facilisis, et suscipit urna dapibus. Donec iaculis pulvinar turpis non aliquet. Nullam eu mauris sit amet mi porttitor feugiat a et nunc. Vivamus placerat neque augue, et tempus risus pretium eget. Donec scelerisque sagittis imperdiet. In sed enim nec tortor fringilla scelerisque vel nec quam. 
                </div>
            </div>
            <br />
            <hr />
            <div class="pagination-area">
                <ul class="nav nav-pills">
                  <li class="active user-favorites"><a href="#">Favorites</a></li>
                  <li class="user-reviews"><a href="#">Reviews</a></li>
                </ul>
            </div>
            <hr />
            <div class="displaying-profile-info"></div>
        </div>
        <!-- Search Results Area -->
        <div class="page results"><br />
            <div class="search-results-holder row">
                <div class="col-md-2">
                    <img class="movie-thumbnail" src="#"/>
                </div>
                <div class="col-md-1"></div>
                <div class="col-md-4 movie-info"></div>
                <div class="col-md-5" id="player"></div>
            </div><br />
            <h3>Movies You May Like</h3>
            <hr />
            <div class="similar-movies-holder"></div>
            <br />
             <div class="reviews-holder col-md-6">
                <h3>Reviews</h3>
                <hr />
                <div class="pagination-area">
                    <ul class="nav nav-pills">
                      <li class="rotten-tomatoes-reviews"><a href="#">Rotten Tomatoes Reviews</a></li>
                      <li class="active MSQE-reviews"><a href="#">Registered Users Reviews</a></li>
                    </ul>
                </div>   
                <hr /><br />      
                <div class="reviews-from-services"></div> 
            </div>
        </div>
        <!-- Reviews Page-->
        <div class="page review">
            <div class="blank"></div>
            <div class="details-holder">            
               <div class="detail">
                   <div class="close">&times</div>
                   <textarea class="review-area"></textarea>
                   <button class="review-submit-btn btn btn-danger form-control">submit</button>
               </div>
            </div>
       </div>
    </div>
    <!-- Templates -->
    <div class="templates">
        <!-- upcomimg movies -->
        <img class="upcoming-movies-img templates" src="#" />
        <img class="upcoming-movies-casts-img templates" src="#" />
        <!-- in theatre movies -->
        <img class="in-theatre-movies-img templates" src="#" />
        <!-- Movie Info in Profile -->
        <img class="profile-movie-img templates" src="#" />
        <div class="a-review btn btn-danger btn-block templates"></div>
        <pre class="profile-movie-quote templates"></pre>
        <a href="#" class="profile-reviews-more-info-link templates">more info</a>
        <!-- similar movies templates -->
        <img class="similar-movie-img templates" src="#" />
        <div class="suggestion-box templates"></div>
        <!-- reviews templates -->
        <div class="review-critic results templates"></div>
        <div class="review-date results templates"></div>
        <div class="review-quote results templates"></div>
        <div class="review-publisher results templates"></div>
        <button class="like-btn btn-warning templates">like</button>
        <!-- details of the movie -->
        <div class="movie-title results templates"></div>
        <div class="movie-genre results templates"></div>
        <div class="movie-overview results templates"></div>
        <div class="movie-tagline results templates"></div>
        <button class="write-review-action results btn btn-success templates">Write a Review</button>
        <button class="add-favorites-action results btn btn-success templates">Add to Favorites</button>
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
    <script src="../javascript/proj.favorites.js"></script>
</body>
</html>