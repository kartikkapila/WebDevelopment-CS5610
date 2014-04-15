<%@ Page Language="C#" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="../../css/bootstrap.min.css" />
</head>
<body>
    <div class="container">
        <h4>Hash Experiments</h4>
        <h5>In these sets of experiments, we will implement a single page application using the hash change event.</h5>
        <h5>In this experiment, when you enter guest in both the input fields below, a profile page is shown. We will see
            how we can make use of this in the project in the next experiment.
        </h5><br />
        <div class="page home">
            <h4>Home</h4>
            <h5>You are currently viewing the home page.</h5>
            <h5>To visit the profile page, enter guest in both the fields below.</h5>
            <input type="text" class="username form-control" placeholder="Enter username"/><br />
            <input type="password" class="password form-control" placeholder="Enter Password"/><br />
            <button class="submit-btn btn btn-success form-control">Visit Profile Page</button>
        </div>
        <div class="page profile">
            <h4>Profile</h4>
            <h5>You are currently viewing the profile page.</h5>
        </div>
        <h5>This is possible using the following code:</h5>
        <pre>
            if (username == "guest" && password == "guest") {
                window.location.hash = "#profile";
            } else {
                alert('Please enter guest in both the fields');
            }
        </pre>
        <h5>Here, we just check if the username and password are guest, we change the hash to reflect the 
            changes.
        </h5>
        <a href="../../fileview/Default.aspx?~/experiments/exp16/HashChange02.aspx">Source</a>
    </div>
    <form id="form1" runat="server">
    </form>
    <script src="../../jquery/jquery-2.1.0.min.js"></script>
    <script>


        $(".submit-btn").click(function () {
            var username = $(".username").val();
            var password = $(".password").val();
            if (username == "guest" && password == "guest") {
                window.location.hash = "#profile";
            } else {
                alert('Please enter guest in both the fields');
            }
        });

        window.onhashchange = handleHashChanged;
        handleHashChanged();

        function handleHashChanged() {
            var hashValue = location.hash;
            console.log(hashValue);
            hashValue = hashValue.replace("#", "");
            showPage(hashValue);
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
