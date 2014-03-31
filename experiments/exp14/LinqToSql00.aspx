<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LINQ-TO-SQL</title>
    <link rel="stylesheet" type="text/css" href="../../css/linq-to-sql.css" />
</head>
<body>
    <form id="form1" runat="server">
    </form>
    <div class="container">
        <h3>LINQ To SQL Experiments</h3>
        <h4>In these sets of experiments, Ill will retrieve data from the database using a webservice. The webservice will query the database using LINQ.</h4>
        <h4>Press the search button, to get the information about which user likes which reviews</h4>
        <h4>The terms searched are as follows:</h4>
        <ul><li>Username --> The usernames of all the people who have registered on the website.</li>
            <li>Critic --> The person whose review the user has liked.</li>
            <li>Quote --> The review made by the critic.</li>
            <li>Imdb ID --> The imdb id related to the movie whose review we are talking about.</li>
            <li>Member --> If the critic is a member of the site or not.</li>
        </ul>
        <input class="search-parameter" type="text" placeholder ="Enter username" />
        <button class="search-action">Search</button><br /><br /><br />
        
        <div class="results-area"></div>
        <h4>The webservice uses the following code for retrieving the information from the database.</h4>
        <pre>
    [WebMethod]
    public List<LikesTO> getAllLikes() {
        using(kkapilaCSDataContext db = new kkapilaCSDataContext()) {
            var result = from row in db.proj_likes select row;
            List<LikesTO> listOfLikes = new List<LikesTO>();
            foreach(var oneRow in result) {
                LikesTO newObject = new LikesTO(oneRow.username, oneRow.critic, oneRow.quote, oneRow.imdbId, oneRow.isCriticAMember);
                listOfLikes.Add(newObject);
            }
            return listOfLikes;        
        }
        </pre>
        <h4>I create a list of LikesTo which is a class whose member variables names match that of the table that I am querying, in this case proj_likes.</h4>
        <a href="../../fileview/Default.aspx?~/experiments/exp14/LinqToSql00.aspx">Source</a>

        <div class="templates">
            <div class="row"></div>
            <div class="username"></div>
            <div class="critic"></div>
            <div class="quote"></div>
            <div class="imdbId"></div>
            <div class="member"></div>
        </div>
    </div>
    <script src="../../jquery/jquery-2.1.0.min.js"></script>
    <script>
        var results_area = $(".results-area");
        $(function () {
            $(".search-action").click(findUsers);
        });

        function findUsers() {
            // var search_value = $(".search-parameter").val();
            // find the reviews that search_value likes
            $.ajax({
                url: "http://net4.ccs.neu.edu/home/kkapila/LikesFinderWebService.asmx/getAllLikes",
                type: "post",
                contentType: "application/json",
                success: render
            });
        }
        function render(response) {
            results_area.empty();
            var row = $(".row").clone();
            var username = $(".username").clone().addClass('likes');
            var critic = $(".critic").clone().addClass('likes');
            var quote = $(".quote").clone().addClass('likes');
            var imdbId = $(".imdbId").clone().addClass('likes');
            var member = $(".member").clone().addClass('likes');

            for (var i = 0; i < response.d.length; i++) {
                username.text("Username:" + response.d[i].username);
                critic.text("Critic:" + response.d[i].critic);
                quote.html("Quote:" + response.d[i].quote);
                imdbId.html("Imdb ID:" + response.d[i].imdbId);
                member.html("Site Member?:" + response.d[i].member);
                results_area.append(row.clone().append(username.clone(), critic.clone(), quote.clone(), imdbId.clone(), member.clone(), '<br>','<br>'));
            }
        }
    </script>
</body>
</html>
