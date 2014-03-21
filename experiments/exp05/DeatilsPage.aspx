<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background:rgb(0, 85, 88);">
    <form id="form1" runat="server">
    </form>
    <div class="container">
        <button class="help">help</button>
    </div>
    <script src="../../jquery/jquery-2.1.0.min.js"></script>
    <script>
        $(function () {
            $(".help").click(function () {
                $(".container").css('background-color', 'transparent').css('width','100%').css('height','100%').append(
                 $("<div>").css("z-index", 1).css("width", '500px').css('border-radius', '5px').css('background-color', 'blue'));
                alert('here');
                    
            });
        
        });
    </script>
</body>
</html>
