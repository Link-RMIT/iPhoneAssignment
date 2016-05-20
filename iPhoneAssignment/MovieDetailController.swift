//
//  MovieDetailController.swift
//  iPhoneAssignment
//
//  Created by Cookie on 16/3/25.
//  Copyright © 2016年 rmit. All rights reserved.
//

import UIKit

class MovieDetailController: ViewControllerWithIndicator {
    
    var mvId:String?
    @IBOutlet weak var movieTitle:UILabel!
    //@IBOutlet weak var moviePlot:UILabel!
    @IBOutlet weak var moviePlot: UITextView!
    @IBOutlet weak var moviePoster:UIImageView!
    var loading = false
    var enableGesture = true
    var movie:MovieDetail?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(mvId)
        

        loadMovie(mvId!)
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func showImage(show:Bool){
        self.moviePoster.hidden = !show
        //self.moviePoster.frame = CGRectMake(0 , 0, 0, 0)
        if(show){
           

        }else{
            self.moviePoster.frame.size.height = 0
        }
    }
    func loadMovie(mvId: String){
        let s=self
        s.startActivity()
        s.loading = true
        //s.moviePoster.hidden = true
        s.showImage(false)
        MovieModel.getMovieDetailById(mvId, callback:{(movie)-> Void in
            s.movieTitle.text = movie?.title;
            s.moviePlot.text = movie?.plot
            s.stopActivity()
            s.loading = false
            print(movie?.poster)
            /*if let url = NSURL(string: movie!.poster){
            if let data = NSData(contentsOfURL: url){
            s.moviePoster.image = UIImage(data: data)
            }
            }*/
            print(movie?.title)
            if movie!.poster=="N/A"{
                return
            }
            NSURLSession.sharedSession().dataTaskWithURL(NSURL(string:movie!.poster)!){
                (data, response, error) in
                guard
                    let image = UIImage(data:data!)
                    else {return}
                dispatch_async(dispatch_get_main_queue()){ () -> Void in
                    s.moviePoster.image = image
                    //s.moviePoster.hidden = false
                    s.showImage(true)
                }
            }.resume()
            
        })
    }
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if(self.loading) {return}
        let id = "tt"+String(format: "%07d", Int(arc4random_uniform(UInt32(2155529))+1))
        print(id)
        loadMovie(id)
        //print("shake")
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let sessionListController = segue.destinationViewController as! SessionListController
        sessionListController.mvId=mvId
    }

}
