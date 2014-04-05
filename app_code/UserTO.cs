using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for UserTO
/// </summary>
public class UserTO {
    public string username;
    public string password;
    public string email;
    public string aboutMe;
    public string name;
    public int profileViews;

	public UserTO() {
	}

    public UserTO(string name, string username, string password, string email, string aboutMe, int profileViews) {
        this.name = name;
        this.username = username;
        this.password = password;
        this.email = email;
        this.aboutMe = aboutMe;
        this.profileViews = profileViews;
    }
}