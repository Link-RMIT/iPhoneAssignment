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
    static let appDelegate:AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
    static let context = appDelegate.managedObjectContext

    static let entityName = "Session"
    
    class Field{
        static let mvId = "mvId"
        static let id = "id"
        static let date = "date"
        static let price = "price"
        static let sitNumber = "sitNumber"
    }
    /*static func filter(pred : NSPredicate) -> [Session]{
        let request = NSFetchRequest(entityName: "Session")
        request.predicate = pred
        
        var sessions:[Session]=[]
        do{
            sessions = (try context.executeFetchRequest(request) as! [Session])
            if(sessions.count==0){
                var n = Int(arc4random_uniform(UInt32(7)) + 3)
                while (n>0){
                    
                    n=n-1
                }
            }
        } catch {

        }

        return sessions
    }*/
    static func newEntity(context:NSManagedObjectContext) -> Session{
        return NSEntityDescription.insertNewObjectForEntityForName(
            Session.entityName,
            inManagedObjectContext: context)
            as! Session
    }
    static func filter(mvId:String) -> [Session]{
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        let request = NSFetchRequest(entityName: Session.entityName)
        print(mvId)
        request.predicate = NSPredicate(format: "%K=%@",Session.Field.mvId,mvId)
        
        var sessions:[Session]=[]
        do{
            sessions = (try context.executeFetchRequest(request) as! [Session])
            print(sessions.count)
            if(sessions.count==0){
                var n = Int(arc4random_uniform(UInt32(7)) + 3)
                while (n>0){
                    Session.randSession(mvId)
                    //print(n)
                    n=n-1
                }
                print(n)
                appDelegate.saveContext()
                return filter(mvId)
                
            }
        } catch {
            
        }
        
        return sessions
    }
    
    static func randSession(mvId:String){
        //let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        //let context = appDelegate.managedObjectContext

        var session = Session.newEntity(context)
        session.mvId = mvId
        session.id = NSUUID().UUIDString
        session.price = Float(arc4random_uniform(UInt32(25)) + 5)
        
        session.date = NSDate(timeIntervalSince1970: 1400000)
        session.sitNumber = Int(arc4random_uniform(UInt32(25)) + 5)
        //session.setValue(mvId, forKey: "mvId")
        
    }
}
