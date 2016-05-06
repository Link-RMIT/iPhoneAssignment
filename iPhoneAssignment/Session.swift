//
//  Session.swift
//  
//
//  Created by Cookie on 16/5/6.
//
//

import Foundation
import UIKit
import CoreData


class Session: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    static let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
}
