using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ProjLikesTO
/// </summary>
public class ProjLikesTO {
    public string username {
        set;
        get;
    }
    public string quote {
        set;
        get;
    }
    public string imdbId {
        set;
        get;
    }

    public ProjLikesTO() {
	}

    public ProjLikesTO(string username, string quote, string imdbId) {
        this.username = username;
        this.quote = quote;
        this.imdbId = imdbId;
    }

}