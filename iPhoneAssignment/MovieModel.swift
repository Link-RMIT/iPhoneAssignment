//
//  MovieModel.swift
//  iPhoneAssignment
//
//  Created by Yihui Lin on 21/03/2016.
//  Copyright © 2016 rmit. All rights reserved.
//

import Foundation


class Movie
{
    var id:String
    var title:String
    var plot:String
    var year:String
    var poster:String{
        get{
            return id;
        }
    }
    init(id:String,title:String,year:String,plot:String)
    {
        self.id=id
        self.title=title
        self.year=year
        self.plot=plot
    }
    
}

/*
private static List<Movie> favorites = new ArrayList<Movie>(Arrays.asList(
new Movie("tt1475582", "The Third Man", "1949", "Pulp novelist Holly Martins travels to shadowy, postwar Vienna, only to find himself investigating the mysterious death of an old friend, black-market opportunist Harry Lime."),
new Movie("tt0087182", "Dune", "1984", "A Duke's son leads desert warriors against the galactic emperor and his father's evil nemesis when they assassinate his father and free their desert world from the emperor's rule."),
new Movie("tt0088847", "The Breakfast Club", "1985", "Five high school students, all different stereotypes, meet in detention, where they pour their hearts out to each other, and discover how they have a lot more in common than they thought."),
new Movie("tt0090060", "St. Elmo's Fire", "1985", "A group of friends, just out of college, struggle with adulthood."),
new Movie("tt0104868", "The Mighty", "1998", "This tells the story of a strong friendship between a young boy with Morquio's syndrome and an older boy who is always bullied because of his size. Adapted from the novel, Freak the Mighty,..."),
new Movie("tt0105946", "Babylon-5", "1994-1998", "A space station in neutral territory is the focus of a unique five year saga."),
new Movie("tt0108052", "Schlinder's List", "1993", "In Poland during World War II, Oskar Schindler gradually becomes concerned for his Jewish workforce after witnessing their persecution by the Nazis."),
new Movie("tt0111282", "Stargate", "1994", "An interstellar teleportation device, found in Egypt, leads to a planet with humans resembling ancient Egyptians who worship the god Ra."),
new Movie("tt0119925", "The Postman", "1997", "A nameless drifter dons a postman's uniform and bag of mail as he begins a quest to inspire hope to the survivors living in post-apocalyptic America."),
new Movie("tt0129387", "There's Something About Mary", "1998", "A man gets a chance to meet up with his dream girl from highschool, even though his date with her back then was a complete disaster."),
new Movie("tt0249462", "Billy Elliot", "2000", "A talented young boy becomes torn between his unexpected love of dance and the disintegration of his family."),
new Movie("tt0457939", "The Holiday", "2006", "Two women troubled with guy-problems swap homes in each other's countries, where they each meet a local guy and fall in love.")
));
*/

class MovieModel
{
    static var movieList:[Movie]=[
        Movie(id: "tt1475582", title: "The Third Man", year: "1949", plot: "Pulp novelist Holly Martins travels to shadowy, postwar Vienna, only to find himself investigating the mysterious death of an old friend, black-market opportunist Harry Lime."),
        Movie(id: "tt0087182", title: "Dune", year: "1984", plot: "A Duke's son leads desert warriors against the galactic emperor and his father's evil nemesis when they assassinate his father and free their desert world from the emperor's rule."),
        Movie(id: "tt0088847", title: "The Breakfast Club", year: "1985", plot: "Five high school students, all different stereotypes, meet in detention, where they pour their hearts out to each other, and discover how they have a lot more in common than they thought."),
        Movie(id: "tt0090060", title: "St. Elmo's Fire", year: "1985", plot: "A group of friends, just out of college, struggle with adulthood."),
        Movie(id: "tt0104868", title: "The Mighty", year: "1998", plot: "This tells the story of a strong friendship between a young boy with Morquio's syndrome and an older boy who is always bullied because of his size. Adapted from the novel, Freak the Mighty,..."),
        Movie(id: "tt0105946", title: "Babylon-5", year: "1994-1998", plot: "A space station in neutral territory is the focus of a unique five year saga."),
        Movie(id: "tt0108052", title: "Schlinder's List", year: "1993", plot: "In Poland during World War II, Oskar Schindler gradually becomes concerned for his Jewish workforce after witnessing their persecution by the Nazis."),
        Movie(id: "tt0111282", title: "Stargate", year: "1994", plot: "An interstellar teleportation device, found in Egypt, leads to a planet with humans resembling ancient Egyptians who worship the god Ra."),
        Movie(id: "tt0119925", title: "The Postman", year: "1997", plot: "A nameless drifter dons a postman's uniform and bag of mail as he begins a quest to inspire hope to the survivors living in post-apocalyptic America."),
        Movie(id: "tt0129387", title: "There's Something About Mary", year: "1998", plot: "A man gets a chance to meet up with his dream girl from highschool, even though his date with her back then was a complete disaster."),
        Movie(id: "tt0249462", title: "Billy Elliot", year: "2000", plot: "A talented young boy becomes torn between his unexpected love of dance and the disintegration of his family."),
        Movie(id: "tt0457939", title: "The Holiday",  year: "2006", plot: "Two women troubled with guy-problems swap homes in each other's countries, where they each meet a local guy and fall in love.")
    ]
    /*static func getMovieById(id:String)->Movie{
        //MovieModel.movieList.
    }*/
}

class Session
{
    var id:String
    var mvid:String
    var date:String
    var price:Float
    init(id:String,mvid:String,date:String,price:Float)
    {
        self.id=id
        self.mvid=mvid
        self.date=date
        self.price=price;
    }
}