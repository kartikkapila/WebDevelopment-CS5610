using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for FavoritesTO
/// </summary>
public class FavoritesTO {

    public string imdbId;
    
    public FavoritesTO() {
	}

    public FavoritesTO(string imdbId) {
        this.imdbId = imdbId;
    }
}