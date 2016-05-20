//
//  TodayViewController.swift
//  Assignment2Extension
//
//  Created by Yihui Lin on 19/05/2016.
//  Copyright © 2016 rmit. All rights reserved.
//

import UIKit
import NotificationCenter
import Alamofire
import SwiftyJSON
class TodayViewController: UIViewController, NCWidgetProviding {
        
    @IBOutlet weak var quoteText: UILabel!
    static let API_MEY = "fb20f56600e97a132b2156bbc5f35ae3"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Year, .Month, .Day, .Hour, .Minute, .Second], fromDate: date)
        //quoteText.text = year.description + "-" + month.description + "-" + day.description
        print("foo")

            //https://api.themoviedb.org/3/movie/upcoming?api_key=fb20f56600e97a132b2156bbc5f35ae3
        Alamofire.request(.GET,"https://api.themoviedb.org/3/movie/upcoming?api_key=fb20f56600e97a132b2156bbc5f35ae3").responseJSON{ (response)-> Void in
            
            dispatch_async(dispatch_get_main_queue()){
                let upcomming = JSON(response.result.value!)
                let results = upcomming["results"].arrayValue
                let theUpcomingMovie = results[Int(arc4random_uniform(UInt32(results.count)))]
                self.quoteText.text = "Upcoming: \(theUpcomingMovie["original_title"].stringValue)\nReleased on: \(theUpcomingMovie["release_date"])"
                
            }
            
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.

        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData

        completionHandler(NCUpdateResult.NewData)
    }
    func widgetMarginInsetsForProposedMarginInsets
        (defaultMarginInsets: UIEdgeInsets) -> (UIEdgeInsets) {
            return UIEdgeInsetsZero
    }
}
