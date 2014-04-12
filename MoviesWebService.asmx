<%@ WebService Language="C#" Class="WebService" %>

using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Linq;
using edu.neu.ccis.kkapila.kkapilaCS;
using System.Collections.Generic;


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
    public bool checkUser(string username, string password) {
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
            action.username = newReviewOrLike.username;
            action.quote = newReviewOrLike.quote;
            action.imdbId = newReviewOrLike.imdbId;
            db.proj_likes.InsertOnSubmit(action);
            db.SubmitChanges();
            return true;
        }
    }
    
    [WebMethod]
    public List<ProjLikesTO> getReviews(string username) {
        using (kkapilaCSDataContext db = new kkapilaCSDataContext()) {
            List<ProjLikesTO> list = new List<ProjLikesTO>();
            var query = from row in db.proj_likes where username == row.username select row;
            if (query.Count() != 0) {
                foreach (var row in query) {
                    ProjLikesTO newObject = new ProjLikesTO();
                    newObject.username = row.username;
                    newObject.quote = row.quote;
                    newObject.imdbId = row.imdbId;
                    list.Add(newObject);
                }
            }
            return list;
        }
    }

    [WebMethod]
    public List<ProjLikesTO> getReviewsByImdbId(string imdbId)
    {
        using (kkapilaCSDataContext db = new kkapilaCSDataContext())
        {
            List<ProjLikesTO> list = new List<ProjLikesTO>();
            var query = from row in db.proj_likes where imdbId == row.imdbId select row;
            if (query.Count() != 0)
            {
                foreach (var row in query)
                {
                    ProjLikesTO newObject = new ProjLikesTO();
                    newObject.username = row.username;
                    newObject.quote = row.quote;
                    newObject.imdbId = row.imdbId;
                    list.Add(newObject);
                }
            }
            return list;
        }
    }
    
    
    [WebMethod]
    public bool checkFavoritesAlreadyExists(string imdbId, string username) {
        using (kkapilaCSDataContext db = new kkapilaCSDataContext()) {
            var result = (from row in db.Favorites where (username == row.username && imdbId == row.imdbId) select row).FirstOrDefault();
            if (result != null) {
                return true;
            }
            else 
                return false;
        }
    }
    
    [WebMethod]
    public bool enterFavoriteMovie(string imdbId, string username) {
        using (kkapilaCSDataContext db = new kkapilaCSDataContext()) {
            Favorite fav = new Favorite();
            fav.username = username;
            fav.imdbId = imdbId;
            db.Favorites.InsertOnSubmit(fav);
            db.SubmitChanges();
            return true;
        }   
    }
    
    [WebMethod]
    public List<FavoritesTO> getFavorites(string username) {
        using (kkapilaCSDataContext db = new kkapilaCSDataContext())
        {
            List<FavoritesTO> list = new List<FavoritesTO>();
            var query = from row in db.Favorites where username == row.username select row.imdbId;
            if (query.Count() != 0) {
                foreach (string imdb in query) {
                    FavoritesTO newObject = new FavoritesTO();
                    newObject.imdbId = imdb;
                    list.Add(newObject);
                }
            }
            return list;
        }
    }
}