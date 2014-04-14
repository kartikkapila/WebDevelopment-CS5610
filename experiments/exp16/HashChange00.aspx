<%@ Page Language="C#" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="../../css/bootstrap.min.css" />
    <title></title>
</head>
<body>
    <div class="container">
        <a href="#home" class="btn btn-success">Home</a>
        <a href="#profile" class="btn btn-success">Profile</a>
    </div>
    <form id="form1" runat="server">
    </form>
    <script src="../../jquery/jquery-2.1.0.min.js"></script>
    <script>
        window.onhashchange = handleHashChanged;
        function handleHashChanged() {
            alert('hash changed');
        }
    </script>
</body>
</html>
