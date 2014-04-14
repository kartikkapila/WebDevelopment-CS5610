<%@ Page Language="C#" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="../../css/bootstrap.min.css" />
</head>
<body>
    <div class="container">
        <div class="row">
            <a href="#home" class="page home btn btn-success">Home</a>
            <a href="#profile" class="page profile btn btn-success">Profile</a>
        </div>
    </div>
    <form id="form1" runat="server">
    </form>
    <script src="../../jquery/jquery-2.1.0.min.js"></script>
    <script>

        window.onhashchange = handleHashChanged;
        handleHashChanged();
        function handleHashChanged() {
            var hashValue = location.hash;
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
