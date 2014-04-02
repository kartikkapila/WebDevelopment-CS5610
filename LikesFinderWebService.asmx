<%@ WebService Language="C#" Class="LikesFinderWebService" %>

using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Collections.Generic;
using System.Linq;
using edu.neu.ccis.kkapila.kkapilaCS;

[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class LikesFinderWebService  : System.Web.Services.WebService {

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
    }
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
    }
    [WebMethod]
    public string getImgSrc(string imdbId) {
        return "";
    }    
}