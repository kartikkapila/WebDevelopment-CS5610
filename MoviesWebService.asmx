<%@ WebService Language="C#" Class="WebService" %>

using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Linq;
using edu.neu.ccis.kkapila.kkapilaCS;

[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class WebService  : System.Web.Services.WebService {

    [WebMethod]
    public UserTO getUserInfoByUsername(string username) {
        using(kkapilaCSDataContext db = new kkapilaCSDataContext()) {
            var result = (from user in db.proj_users where user.username == username select user).FirstOrDefault();
            if (result != null) {
                UserTO newUser = new UserTO(result.name, result.username, result.password, result.email, result.aboutMe, result.profileViews);
                return newUser;
            } return null;
        }
    }
    
    [WebMethod]
    public Boolean checkUser(string username, string password) {
        using (kkapilaCSDataContext db = new kkapilaCSDataContext()) {
            var result = (from user in db.proj_users where (user.username == username && user.password == password) select user).FirstOrDefault();
            if (result == null) {
                return false;
            }
            else {
                return true;
            }
        }
    }
    
    [WebMethod]
    public bool saveReview(ProjLikesTO newReviewOrLike) {
        using (kkapilaCSDataContext db = new kkapilaCSDataContext()) {
            proj_like action = new proj_like();
/*
            action.username = "kartik1990";
            action.critic = "kartik1990";
            action.quote = "Amazing Movie, I love it";
            action.imdbId = "tt0068646";
            action.isCriticAMember = "true";
            action.reviewOrlikes = "review";
*/
            action.username = newReviewOrLike.username;
            action.critic = newReviewOrLike.critic;
            action.quote = newReviewOrLike.quote;
            action.imdbId = newReviewOrLike.imdbId;
            action.isCriticAMember = newReviewOrLike.isCriticAMember;
            action.reviewOrlikes = newReviewOrLike.reviewOrLikes;
            db.proj_likes.InsertOnSubmit(action);
            db.SubmitChanges();
            return true;
        }
    }
}