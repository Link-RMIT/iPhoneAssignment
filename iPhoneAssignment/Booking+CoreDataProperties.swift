//
//  Booking+CoreDataProperties.swift
//  
//
//  Created by Yihui Lin on 17/05/2016.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Booking {

    @NSManaged var credictCardNumber: String?
    @NSManaged var id: String?
    @NSManaged var quantity: NSNumber?
    @NSManaged var sessionId: String?

}
