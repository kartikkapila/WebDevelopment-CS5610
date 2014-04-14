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
        <h4>Press the search button, to get the reviews of a specific user. </h4>
        <h4>The terms searched are as follows:</h4>
        <ul><li>Username --> The usernames of all the people who have registered on the website.</li>
            <li>Quote --> The review made by the critic.</li>
            <li>Imdb ID --> The imdb id related to the movie whose review we are talking about.</li>
        </ul>
        <input class="search-parameter" type="text" placeholder ="Enter username" />
        <button class="search-action">Search</button><br /><br /><br />
        
        <div class="results-area"></div>
        <h4>The webservice uses the following code for retrieving the information from the database.</h4>
        <pre>
    [WebMethod]
    public List<LikesTO> getAllLikesByUsername(string username) {
        using (kkapilaCSDataContext db = new kkapilaCSDataContext()) {
            var result = from row in db.proj_likes where row.username == username select row;
            List<LikesTO> listOfLikes = new List<LikesTO>();
            foreach (var oneRow in result) {
                LikesTO newObject = new LikesTO(oneRow.username, oneRow.critic, oneRow.quote, oneRow.imdbId, oneRow.isCriticAMember);
                listOfLikes.Add(newObject);
            }
            return listOfLikes;        
        }
        </pre>
        <h4>I create a list of LikesTo which is a class whose member variables names match that of the table that I am querying, in this case proj_likes.</h4>
        <a href="../../fileview/Default.aspx?~/experiments/exp14/LinqToSql01.aspx">Source</a>

        <div class="templates">
            <div class="row"></div>
            <div class="username"></div>
            <div class="quote"></div>
            <div class="imdbId"></div>
        </div>
    </div>
    <script src="../../jquery/jquery-2.1.0.min.js"></script>
    <script>
        $(".search-parameter").css('display', 'block');
        var results_area = $(".results-area");
        $(function () {
            $(".search-action").click(findUser);
        });

        function findUser() {
            var search_value = $(".search-parameter").val();
            var param = {
                username:""+search_value
            }
            $.ajax({
                url: "http://net4.ccs.neu.edu/home/kkapila/LikesFinderWebService.asmx/getAllLikesByUsername",
                data:JSON.stringify(param),
                type: "post",
                contentType: "application/json",
                success: render
            });
        }
        function render(response) {
            results_area.empty();
            if (response.d.length != 0) {
                var row = $(".row").clone();
                var username = $(".username").clone().addClass('likes');
                var quote = $(".quote").clone().addClass('likes');
                var imdbId = $(".imdbId").clone().addClass('likes');

                for (var i = 0; i < response.d.length; i++) {
                    username.text("Username:" + response.d[i].username);
                    quote.html("Quote:" + response.d[i].quote);
                    imdbId.html("Imdb ID:" + response.d[i].imdbId);
                    results_area.append(row.clone().append(username.clone(), quote.clone(), imdbId.clone(), '<br>', '<br>'));
                }
            } else {
                alert('No records found for the given username');
              }
        }
    </script>
</body>
</html>
