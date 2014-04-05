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
    public string isCriticAMember {
        set;
        get;
    }
    public string reviewOrLikes {
        set;
        get;
    }

    public ProjLikesTO() {
	}

    public ProjLikesTO(string username, string critic, string quote, string imdbId, string isCriticAMember, string reviewOrLikes) {
        this.username = username;
        this.critic = critic;
        this.quote = quote;
        this.imdbId = imdbId;
        this.isCriticAMember = isCriticAMember;
        this.reviewOrLikes = reviewOrLikes;
    }

}