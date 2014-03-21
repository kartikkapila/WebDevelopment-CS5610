<%@ WebService Language="C#" Class="WebService00" %>

using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Collections.Generic;

[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class WebService00  : System.Web.Services.WebService {

    [WebMethod]
    public string HelloWorld() {
        return "Hello from Kartik's WebServices";
    }

    [WebMethod]
    public MoviesTO GetMovie()
    {
        return new MoviesTO("Star Wars");   
    }

    [WebMethod]
    public List<MoviesTO> GetMovies()
    {
        List<MoviesTO> list = new List<MoviesTO>();
        list.Add(new MoviesTO("Star Wars"));
        list.Add(new MoviesTO("PS I Love You"));
        list.Add(new MoviesTO("Titanic"));
        return list;
    }
    
}