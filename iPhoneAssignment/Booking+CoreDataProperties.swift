//
//  Booking+CoreDataProperties.swift
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

extension Booking {

    @NSManaged var id: String?
    @NSManaged var credictCardNumber: String?
    @NSManaged var sessionId: String?

}
