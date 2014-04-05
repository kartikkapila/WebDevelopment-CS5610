<%@ Page Language="C#" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Local Storage</title>
    <style>
        .container {
            margin:10px;
            padding:10px;
        }
        .key,.value,.submit-btn {
            width:100%;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server"></form>
    <div class="container">
        <input class="key" type="text" placeholder="Enter Key"/><br /><br />
        <input class="value" type="text" placeholder="Enter Value"/><br /><br />
        <button class="submit-btn">Store</button>
    </div>
    <script src ="../../jquery/jquery-2.1.0.min.js"></script>
    <script>
        $(".submit-btn").click(function (e) {
            var key = $(".key").val();
            var value = $(".value").val();
            if (key != "" && value != "") {
                localStorage.setItem(key, value);
                alert('Your data has been successfully been stored in the localStorage');
            } else {
                alert('Either the key or value was left blank');
            }
        });
    </script>
</body>
</html>
