//
//  Booking.swift
//  
//
//  Created by Cookie on 16/5/6.
//
//

import Foundation
import UIKit
import CoreData


class Booking: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    static let entityName = "Booking"
    enum Fields:String{
        case id
        case credictCardNumber
        case sessionId
    }
    
    
    /*static func newEntity(context:NSManagedObjectContext) -> Booking{
        let appDelegate:AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        let context:NSManagedObjectContext = appDelegate.managedObjectContext
        let booking = NSEntityDescription.insertNewObjectForEntityForName(
            Session.entityName,
            inManagedObjectContext: context)
            as! Booking
        //booking.appDelegate = appDelegate
        //booking.context = context

        return booking
    }
    
    static func filter(key:Fields,value:String) -> [Session]{
        //let appDelegate =
        //UIApplication.sharedApplication().delegate as! AppDelegate
        //let context = appDelegate.managedObjectContext
        
        let request = NSFetchRequest(entityName: Session.entityName)
        print(value)
        request.predicate = NSPredicate(format: "%K = %@",key.rawValue,value)
        
        var sessions:[Session]=[]
        do{
            sessions = (try context.executeFetchRequest(request) as! [Booking])
            print(sessions.count)
            if(sessions.count==0){
                var n = Int(arc4random_uniform(UInt32(7)) + 3)
                while (n>0){
                    Session.randSession(value)
                    //print(n)
                    n=n-1
                }
                print(n)
                appDelegate.saveContext()
                return filter(key,value: value)
                
            }
        } catch {
            
        }
        
        return sessions
    }
    
    func save(){
        self.appDelegate!.saveContext()
    }*/
    static func save(credictCardNumber:String,sessionId:String,price:Double,quantity:Int){
        let appDelegate:AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        let context:NSManagedObjectContext = appDelegate.managedObjectContext
        let booking = NSEntityDescription.insertNewObjectForEntityForName(
            Booking.entityName,
            inManagedObjectContext: context)
            as! Booking
        booking.id = NSUUID().UUIDString;
        booking.credictCardNumber = credictCardNumber
        booking.sessionId = sessionId
        appDelegate.saveContext()
    }
    static func all() -> [Booking]{
        let appDelegate:AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        let context:NSManagedObjectContext = appDelegate.managedObjectContext
        let request = NSFetchRequest(entityName: Booking.entityName)
        do {
            return try context.executeFetchRequest(request) as! [Booking]
        }catch {
            // Error thrown from executeFetchRequest()
            print("There was an error in executeFetchRequest(): \(error)")
            return []
        }
    }
}
