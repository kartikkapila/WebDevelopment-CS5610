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
    public List<ProjLikesTO> getAllLikes() {
        using(kkapilaCSDataContext db = new kkapilaCSDataContext()) {
            var result = from row in db.proj_likes select row;
            List<ProjLikesTO> listOfLikes = new List<ProjLikesTO>();
            foreach(var oneRow in result) {
                ProjLikesTO newObject = new ProjLikesTO(oneRow.username, oneRow.quote, oneRow.imdbId);
                listOfLikes.Add(newObject);
            }
            return listOfLikes;        
        }
    }
    [WebMethod]
    public List<ProjLikesTO> getAllLikesByUsername(string username)
    {
        using (kkapilaCSDataContext db = new kkapilaCSDataContext()) {
            var result = from row in db.proj_likes where row.username == username select row;
            List<ProjLikesTO> listOfLikes = new List<ProjLikesTO>();
            foreach (var oneRow in result) {
                ProjLikesTO newObject = new ProjLikesTO(oneRow.username, oneRow.quote, oneRow.imdbId);
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