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
    var movie:MovieDetail?
    override func viewDidLoad() {
        super.viewDidLoad()
        let s=self
        s.startActivity()
        print(mvId)
        MovieModel.getMovieDetailById(self.mvId, callback:{(movie)-> Void in
            s.movieTitle.text = movie?.title;
            s.moviePlot.text = movie?.plot
            s.stopActivity()
            print(movie?.poster)
            /*if let url = NSURL(string: movie!.poster){
                if let data = NSData(contentsOfURL: url){
                    s.moviePoster.image = UIImage(data: data)
                }
            }*/
            if movie!.poster=="N/A"{ return}
            NSURLSession.sharedSession().dataTaskWithURL(NSURL(string:movie!.poster)!){
                (data, response, error) in
                guard
                    let image = UIImage(data:data!)
                    else {return}
                dispatch_async(dispatch_get_main_queue()){ () -> Void in
                    s.moviePoster.image = image
                }
            }.resume()

        })

        //
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
