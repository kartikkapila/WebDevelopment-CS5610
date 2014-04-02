using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for LikesTO
/// </summary>
public class LikesTO {
    public string username {
        set;
        get;
    }
    public string critic {
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
    public string member {
        set;
        get;
    }
	
    public LikesTO() {
	}

    public LikesTO(string username, string critic, string quote, string imdbId, string member) {
        this.username = username;
        this.critic = critic;
        this.quote = quote;
        this.imdbId = imdbId;
        this.member = member;
    }
}