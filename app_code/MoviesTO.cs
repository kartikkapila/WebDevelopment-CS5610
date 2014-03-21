using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class MoviesTO {
    public string name {
        get;
        set;
    }

	public MoviesTO(){}
    public MoviesTO(string a) {
        name = a;
    }
}