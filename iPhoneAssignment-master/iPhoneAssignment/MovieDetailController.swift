//
//  MovieDetailController.swift
//  iPhoneAssignment
//
//  Created by Cookie on 16/3/25.
//  Copyright © 2016年 rmit. All rights reserved.
//

import UIKit

class MovieDetailController: UIViewController {
    
    var mvId:String?
    @IBOutlet weak var movieTitle:UILabel!
    @IBOutlet weak var moviePlot:UILabel!
    @IBOutlet weak var moviePoster:UIImageView!
    var movie:Movie?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movie=MovieModel.getMovieById(mvId!)
        
        movieTitle.text=movie? .title;
        moviePlot.text=movie?.plot
        moviePoster.image=UIImage(named:(movie?.poster)!)
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
