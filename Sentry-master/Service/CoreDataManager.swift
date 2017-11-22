//
//  CoreDataManager.swift
//  GIPHY  App
//
//  Created by Sergey Leskov on 7/16/17.
//  Copyright © 2017 Sergey Leskov. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager {
    
    //==================================================
    // MARK: - Singleton
    //==================================================
    static let shared = CoreDataManager()
    private init() { }
    
    //==================================================
    // MARK: - Properties
    //==================================================
    var viewContext: NSManagedObjectContext {
        get {
            let resultContext = self.persistentContainer.viewContext
            resultContext.automaticallyMergesChangesFromParent = true
            return resultContext
        }
    }
    
    var newBackgroundContext: NSManagedObjectContext {
        return persistentContainer.newBackgroundContext()
    }

    
    //==================================================
    // MARK: - Core Data stack
    //==================================================
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        // MARK: Все строковые константы должны быть вынесены в отдельное место, которое легко конфигурировать в случае изменений в проекте. Разыскивать по разным файлам, когда проект уже вырос - неблагодарное дело.
        let container = NSPersistentContainer(name: Constants.Storage.persistentModelName)
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                // MARK: Вот как раз то место, где нужно использовать Sentry в проекте :) Вещания в никуда (print и тп) лучше избегать
                fatalError("Unresolved error \(error), \((error as NSError).userInfo)")
            }
        }
        return container
    }()
    
    
    
    //==================================================
    // MARK: - saveContext
    //==================================================
    func saveContext () {
        let context = persistentContainer.viewContext
        
        // MARK: Идеальное место для применения guard
        guard context.hasChanges else {
            return
        }
        
        do {
            try context.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nserror = error as NSError
            // MARK: Сюда тоже нужно добавить обработку в Sentry
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
    
    public func save(context: NSManagedObjectContext) {
        guard context.hasChanges else {
            return
        }
        
        do {
            try context.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nserror = error as NSError
            // MARK: Сюда тоже нужно добавить обработку в Sentry
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
}
