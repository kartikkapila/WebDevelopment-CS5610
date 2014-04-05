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
            <p>In this set of experiments, I will be building a feedback page.</p>
            <p>The first part of this experiment is based on creating a text area, and assigning a keypress event to the textarea,
                so that when the users enter the text and press "return", the comment should be added to the body of the page.
            </p>
            <p>In this experiment, when the user presses "return" on the text area, a alert is shown, which says that "Thanks for the feedback"</p>
            <p>In the next few experiments, I will be working on displaying the comments of the users in the body of the page.</p>
            <textarea class="feedback"></textarea><br />
        <p>This can be achieved with the help of jquery. The code used is as follows</p>
        <pre>            
$(".main .feedback").keypress(function (e) {
        if (e.keyCode == 13) {
            alert('Thanks for the feedback');
        }
});
        </pre>
         <a href="../../fileview/Default.aspx?~/experiments/exp08/FeedbackForm.aspx">ASPX Source</a>
        </div> 
    </form>
    <script src="../../jquery/jquery-2.1.0.min.js"></script>
    <script src="../../javascript/bootstrap.min.js"></script>
    <script>
        $(function () {

            $(".main .feedback").keypress(function (e) {
                if (e.keyCode == 13) {
                    alert('Thanks for the feedback');
                }
            });
        });
    </script>
</body>
</html>
