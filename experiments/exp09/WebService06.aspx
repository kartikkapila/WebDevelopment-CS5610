<%@ Page Language="C#" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link rel="stylesheet" type ="text/css" href="../../css/home.css" />
</head>
<body>
    <form runat="server">
    </form>
    <div>

    </div>
    <script src="../../jquery/jquery-2.1.0.min.js"></script>
    <script>
        $(function () {
            var param = {
                api_key: "56723ab4454644a4f493306c8d6c7240"
            };
            $.ajax({
                url: "https://api.themoviedb.org/3/movie/0120338?",
                data: param,
                dataType: 'jsonp',
                callback: 'abc',
                success: function (response) {
                    console.log(response);
                }
            });
        });
    </script>
</body>
</html>