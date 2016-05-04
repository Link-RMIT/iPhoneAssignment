//
//  ViewControllerWithIndicator.swift
//  iPhoneAssignment
//
//  Created by Cookie on 16/5/4.
//  Copyright © 2016年 rmit. All rights reserved.
//

import UIKit

class ViewControllerWithIndicator: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpIndicator()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    ////////////////////////////////////////////////////////////////////////////////////////////////
    // MARK: - Indicator
    // http://stackoverflow.com/questions/29912852/how-to-show-activity-indicator-while-tableview-loads
    
    var indicator = UIActivityIndicatorView()
    func setUpIndicator(){
        indicator = UIActivityIndicatorView(frame: CGRectMake(0,0,40,40))
        indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        indicator.center = self.view.center
        self.view.addSubview(indicator)
    }
    func startActivity(){
        self.view.userInteractionEnabled=false
        indicator.startAnimating()
        indicator.backgroundColor = UIColor.whiteColor()
    }
    func stopActivity(){
        indicator.stopAnimating()
        indicator.hidesWhenStopped = true
        self.view.userInteractionEnabled=true
    }
}
