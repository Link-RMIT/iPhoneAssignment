//
//  ReceiptController.swift
//  iPhoneAssignment
//
//  Created by Yihui Lin on 16/05/2016.
//  Copyright © 2016 rmit. All rights reserved.
//

import UIKit

class ReceiptController: UIViewController {

    @IBOutlet weak var movieTitle: UILabel!
    
    @IBOutlet weak var receiptNumber: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var date: UILabel!
    
    var booking:Booking?;
    var session:Session?;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

}
