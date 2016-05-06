//
//  Session+CoreDataProperties.swift
//  
//
//  Created by Cookie on 16/5/6.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Session {

    @NSManaged var id: String?
    @NSManaged var mvId: String?
    @NSManaged var date: NSDate?
    @NSManaged var price: NSNumber?
    @NSManaged var sitNumber: NSNumber?

}
