<%@ Page Language="C#" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="../../css/bootstrap.min.css" />
    <style>
        h5{
            display:inline;
        }
        .profile-pic {
            height:200px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h4>Hash Experiments</h4>
        <h5>In these sets of experiments, we will implement a single page application using the hash change event.</h5>
        <h5>In this experiment, we will display the profile page, of the registered members.
        </h5><br /> 
        <div class="page home">
            <h4>Home</h4>
            <h5>You are currently viewing the home page.</h5>
            <h5>To visit the profile page as a guest, enter guest in both the fields below.</h5>
            <h5>You can also login using the credentials provided to you.</h5>
            <input type="text" class="username form-control" placeholder="Enter username"/><br />
            <input type="password" class="password form-control" placeholder="Enter Password"/><br />
            <button class="submit-btn btn btn-success form-control">Visit Profile Page</button>
        </div>
        <div class="page profile">
            <h4>Profile</h4>
            <h5>You are currently viewing the profile page.</h5><br /><br />
            <div class="row">
                <div class="col-md-3"><img class ="profile-pic" src="../../images/profile-pic-default.png" /></div>
                <div class="col-md-3"><br />
                    <h5 class="member-since">member since:</h5><h5 class="member-since-value">10days</h5><br /><br />
                    <h5 class="profile-views">profile views:</h5><h5 class="profile-views-value">110</h5><br /><br />
                    <h5 class="email">email:</h5><h5 class="email-value">xyz@hotmail.com</h5><br /><br />
                    <h5 class="real-name">real name:</h5><h5 class="real-name-value">Mr. X</h5>
                </div>
                <div class="col-md-5 about-me-value"><br />Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus malesuada leo urna, eu sollicitudin orci pretium quis. Fusce pharetra, ante eu facilisis ornare, turpis lacus euismod dui, eu consectetur est nulla sit amet mauris. Nunc lacinia eros sed feugiat aliquam. Nullam tempor, ante nec ultricies convallis, nulla tortor consequat sem, ut euismod neque felis ac leo. Donec faucibus lectus felis, vitae sollicitudin nisi egestas vitae. Ut ac justo quam. Nunc facilisis leo sit amet neque laoreet, ut tincidunt diam semper. Etiam libero leo, faucibus nec libero nec, scelerisque vulputate nulla. Vivamus gravida libero feugiat ligula facilisis, et suscipit urna dapibus. Donec iaculis pulvinar turpis non aliquet. Nullam eu mauris sit amet mi porttitor feugiat a et nunc. Vivamus placerat neque augue, et tempus risus pretium eget. Donec scelerisque sagittis imperdiet. In sed enim nec tortor fringilla scelerisque vel nec quam.</div>
            </div><br /><hr />
        </div><br />
        <h5>This is possible using the following code:</h5><br />
        <pre>
        function handleHashChanged() {
            var hashValue = location.hash;
            hashValue = hashValue.replace("#", "");
            var pageName = hashValue.split("/")[0];
            if (pageName != "profile") {
                showPage(hashValue);
            } else {
                var username = hashValue.split("/")[1];
                if(username != "guest")
                    getUserInfo(username);
                showPage("profile");
            }
        }
        </pre>
        <h5>Here, on hash change, we retrieve the hash value. Then we remove # from the hash value.
            After that we split the hash value in two halves. If the first half is profile then, we 
            get the second half of the hash,  which is the username. If the username is guest, then,
            we display the guest profile, otherwise we display the registered users profile. If the username 
            is not guest nor belongs to a registered user, then the home page is displayed.
        </h5>
        <a href="../../fileview/Default.aspx?~/experiments/exp16/HashChange03.aspx">Source</a>

    </div>
    <form id="form1" runat="server">
    </form>
    <script src="../../jquery/jquery-2.1.0.min.js"></script>
    <script>

        $(".submit-btn").click(function () {
            var username = $(".username").val();
            var password = $(".password").val();
            checkUser(username, password);
        });

        function checkUser(username, password) {
            var param = {
                username: username,
                password:password
            }
            $.ajax({
                url: "http://net4.ccs.neu.edu/home/kkapila/MoviesWebService.asmx/checkUser",
                //url: "http://localhost:1316/MoviesWebService.asmx/checkUser",
                data: JSON.stringify(param),
                type: 'post',
                contentType: 'application/json',
                success: function (response) {
                    if (response.d == true) {
                        window.location.hash = "#profile/" + username;
                    } else if (username == "guest" && password == "guest") {
                        window.location.hash = "#profile/guest";
                    } else {
                        alert('Please enter guest in both the fields to login as guest');
                    }
                }
            });
        }

        window.onhashchange = handleHashChanged;
        handleHashChanged();

        function handleHashChanged() {
            var hashValue = location.hash;
            hashValue = hashValue.replace("#", "");
            var pageName = hashValue.split("/")[0];
            if (pageName != "profile") {
                showPage(hashValue);
            } else {
                var username = hashValue.split("/")[1];
                if(username != "guest")
                    getUserInfo(username);
                showPage("profile");
            }
        }

        function getUserInfo(username) {
            var param = {
                username: "" + username
            }
            $.ajax({
                url: 'http://net4.ccs.neu.edu/home/kkapila/MoviesWebService.asmx/getUserInfoByUsername',
                //url: "http://localhost:1316/MoviesWebService.asmx/getUserInfoByUsername",
                data: JSON.stringify(param),
                type: "post",
                contentType: "application/json",
                success: function (response) {
                    renderReceivedInfo(response);
                }
            });

        }

        function renderReceivedInfo(response) {
            if (response.d != null) {
                $(".profile-pic").attr('src', response.d.imgsrc);
                $(".profile-views-value").html(response.d.profileViews);
                $(".email-value").html(response.d.email);
                $(".real-name-value").html(response.d.name);
                $(".about-me-value").html(response.d.aboutMe);
            } else {
                location.hash = "#home";
            }
        }

        function showPage(pageName) {
            $(".page").hide();
            if (pageName == "" || pageName == null || typeof (pageName) == 'undefined') {
                $(".page.home").show();
            } else
                $(".page." + pageName).show();
        }
    </script>
</body>
</html>
