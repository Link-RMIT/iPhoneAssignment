//
//  BookingViewController.swift
//  iPhoneAssignment
//
//  Created by Yihui Lin on 13/05/2016.
//  Copyright © 2016 rmit. All rights reserved.
//

import UIKit

class BookingViewController: UIViewController {

    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var sessionDate: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var number: UITextField!
    @IBOutlet weak var creditCardNumber: UITextField!
    
    var session:Session?;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let s = self.session!
        self.movieTitle.text = s.mvId
        self.sessionDate.text = s.date!.description
        self.price.text = "$" + s.price!.description
        
        
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
        let booking = Booking.save(creditCardNumber.text!, sessionId: session!.id!, quantity: Int(number.text!)!)
        let receiptViewController = segue.destinationViewController as! ReceiptController
        receiptViewController.session = self.session!
        receiptViewController.booking = booking
        
    }


}
