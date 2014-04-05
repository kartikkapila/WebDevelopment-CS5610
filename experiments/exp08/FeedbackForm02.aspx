<%@ Page Language="C#" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Feedback Form</title>
    <link rel="stylesheet" type ="text/css" href="../../css/bootstrap.min.css" /> 
    <link rel="stylesheet" type="text/css" href="../../css/feedback.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="main container">
            <h3>Feedback Form</h3><br /><br />
            <p>In this experiment, when the user enters his feedback and presses "return", his feedback is shown in the form of quote on the page.</p>
            <textarea class="feedback"></textarea><br />
            <br />
            <div class="comments"><pre>Your comments will get added here.
</pre></div>
            <p>This can be done using the following code</p>
            <pre>
var feedback_div = $(".feedback");
var comments = $(".comments pre");
feedback_div.keypress(function (e) {
    if (e.keyCode == 13) {
        var feedback = feedback_div.val();
        comments.append(feedback);
        feedback = feedback_div.val("");
    }
});
</pre>
            <br />
            <p>Here, we first grab the textarea using its class name.</p>
            <p>We then use event handling, and when "return" is pressed,  we then grab the text inside the text area using the val function.</p> 
            <p>The text that we grabbed is displayed in the pre tag. Also the previous feedback is erased from the textarea.</p>
            <a href="../../fileview/Default.aspx?~/experiments/exp08/FeedbackForm02.aspx">ASPX Source</a>
        </div>
    </form>
    <script src="../../jquery/jquery-2.1.0.min.js"></script>
    <script src="../../javascript/bootstrap.min.js"></script>
    <script>
        $(function () {
            var feedback_div = $(".feedback");
            var comments = $(".comments pre");
            feedback_div.keypress(function (e) {
                if (e.keyCode == 13) {
                    var feedback = feedback_div.val();
                    comments.append(feedback);
                    feedback = feedback_div.val("");
                }
            });
        });
    </script>
</body>
</html>
