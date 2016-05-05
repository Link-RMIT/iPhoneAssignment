//
//  MovieModel.swift
//  iPhoneAssignment
//
//  Created by Yihui Lin on 21/03/2016.
//  Copyright © 2016 rmit. All rights reserved.
//

import Foundation

import Alamofire
import SwiftyJSON

class Movie{
    var imdbID:String
    var title:String
    var year:String
    var poster:String
    init(imdbID:String,title:String,year:String,poster:String){
        self.imdbID = imdbID
        self.title = title
        self.year = year
        self.poster = poster
    }
    init(movie:JSON){
        self.imdbID = movie["imdbID"].string!
        self.title = movie["Title"].string!
        self.year = movie["Year"].string!
        self.poster = movie["Poster"].string!
    }
    deinit{
        print("deinit:")
    }
}
class MovieDetail: Movie
{
    /*var poster:String{
        get{
            return id;
        }
    }*/
    var actors:String
    var awards:String
    var country:String
    var director:String
    var genre:String
    var language:String
    var metascore:String
    var rated:String
    var released:String
    var response:String
    var runtime:String
    var type:String
    var writer:String
    var imdbRating:String
    var imdbVotes:String
    var plot:String
    override init(movie:JSON){
        self.actors = movie["Actors"].string!
        self.awards = movie["Awards"].string!
        self.country = movie["Country"].string!
        self.director = movie["Director"].string!
        self.genre = movie["Genre"].string!
        self.language = movie["Language"].string!
        self.metascore = movie["Metascore"].string!
        self.rated = movie["Rated"].string!
        self.released = movie["Released"].string!
        self.response = movie["Response"].string!
        self.runtime = movie["Runtime"].string!
        self.type = movie["Type"].string!
        self.writer = movie["Writer"].string!
        self.imdbRating = movie["imdbRating"].string!
        self.imdbVotes = movie["imdbVotes"].string!
        self.plot = movie["Plot"].string!
        
        super.init(movie: movie)
    }
    /*
    init(id:String,title:String,year:String,plot:String)
    {
        super.init(id: id, title: title, year: year, plot: plot, poster: poster)
        
    }*/
    
}//rwaASDA

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
    /*static var movieList:[Movie]=[
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
    ]*/
    static func getMovieDetailById(id:String!, callback:(MovieDetail?)->Void) -> Void{
        Alamofire.request(.GET,"https://www.omdbapi.com/",parameters:["plot": "full", "r": "json", "i":id]).responseJSON{ (response)-> Void in
            
            dispatch_async(dispatch_get_main_queue()){
                var movie:MovieDetail?
                if(response.result.value != nil){
                    movie = MovieDetail(movie: JSON(response.result.value!))
                }
                callback(movie)
            }

        }
    }
    static func search(keywords:String!,callback:([Movie])->Void){
        Alamofire.request(.GET,"https://www.omdbapi.com/?y=&plot=full&r=json&s="+keywords).responseJSON{ (response)-> Void in

            dispatch_async(dispatch_get_main_queue()){
                var movieArray:[Movie] = []
                if(response.result.value != nil){
                    movieArray=JSON(response.result.value!)["Search"].arrayValue.map{
                        (jmovie) -> Movie in
                        return Movie(movie:jmovie)
                    }
                }
                callback(movieArray)
            }
        }
    }
    
}

class Session
{
    var id:String
    var mvId:String
    var date:String
    var price:Float
    var sit:Int
    static var cid = 0
    init(id:String,mvid:String,date:String,price:Float,sit:Int)
    {
        self.id = id
        self.mvId = mvid
        self.date = date
        self.price = price
        self.sit = sit
    }
    
    /*init()
    {
        self.id = Session.cid.description
        Session.cid = Session.cid+1
        date = "DD/MM/YYYY"
        price = 10.0
        sit = Int(arc4random_uniform(UInt32(MovieModel.movieList.count)))
        mvId = MovieModel.movieList[Int(arc4random_uniform(UInt32(MovieModel.movieList.count)))].id
    }*/
    
}

class SessionModel{
    static var sessionList:[Session] = SessionModel.ini(100)
    static func ini(n:Int)->[Session]{
        var l:[Session] = []
        var nn = n
        while(nn>0){
            //l.append(Session())
            nn = nn-1
        }
        return l
    }
    static func getSessionByMovie(mvId:String)->[Session]
    {
        return SessionModel.sessionList.filter({(s:Session)->Bool in return s.mvId==mvId})
    }
    static func getMovieBySession(sessionId:String)->Movie?{
        let s=SessionModel.getSessionById(sessionId)
        //return MovieModel.getMovieById(s.mvId)!
        return nil
    }
    static func getSessionById(sessionId:String)->Session{
        return sessionList.filter({(s:Session)->Bool in return s.id == sessionId}).first!
    }
    
}

class Booking
{
    var id:String
    var sessionId:String
    var credictCardNumber:String
    init(id:String,sessionId:String,credictCardNumber:String)
    {
        self.id=id;
        self.sessionId=sessionId
        self.credictCardNumber = credictCardNumber
    }
    
}

class BookingModel
{
    static var bookingList:[Booking]=BookingModel.ini(10)
    static func ini(n:Int)->[Booking]{
        var l:[Booking] = []
        var nn = n
        /*while(nn>0){
            let sid=SessionModel.sessionList[Int(arc4random_uniform(UInt32(SessionModel.sessionList.count)))].id
            l.append(Booking(id: nn.description,sessionId: sid,credictCardNumber: "2093485723450"))
            nn=nn-1
        }*/
        return l
    }
}