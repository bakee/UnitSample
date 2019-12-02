//
//  User+CoreDataClass.swift
//  UnitSample
//
//  Created by New User on 26/11/19.
//  Copyright © 2019 New User. All rights reserved.
//
//

import Foundation
import CoreData

@objc(User)
public class User: NSManagedObject {
    
    func insert(from user:UserModel){
        self.name = user.name
        self.age = Int16(user.age)
        self.country = user.country
        
        if let activities = user.activities {
            insert(activityModel: activities)
        }
        if let context = self.managedObjectContext, context.hasChanges  {
            try? context.save()
        }
    }
    
    
    private func insert(activityModel:[ActivityModel]){
        if let context = self.managedObjectContext {
            for activity in activityModel {
                let activities = Activities.init(context: context)
                
                activities.insert(from: activity)
                self.addToActivities(activities)

            }
        }
    }
    
    func read() throws {
        if let context = self.managedObjectContext {
            do{
                
            let result = try context.fetch(User.fetchRequest())
                
            }catch{
                throw CoreDataError.read
            }
        }
    }

}
