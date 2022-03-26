//
//  CoreDataManager.swift
//  ExpenseTracker
//
//  Created by Orszagh Sandor on 2022. 03. 25..
//

import Foundation
import CoreData

class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    static let shared = CoreDataManager()
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func getItemById(id: NSManagedObjectID) -> ExpenseTrackerItem? {
        
        do {
            return try viewContext.existingObject(with: id) as? ExpenseTrackerItem
        } catch {
            return nil
        }
        
    }
    
    func deleteItem(item: ExpenseTrackerItem) {
        
        viewContext.delete(item)
        save()
        
    }
    
    func getAllItems() -> [ExpenseTrackerItem] {
        
        let request: NSFetchRequest<ExpenseTrackerItem> = ExpenseTrackerItem.fetchRequest()
        
        do {
            return try viewContext.fetch(request)
        } catch {
            return []
        }
        
    }
    
    func save() {
        do {
            try viewContext.save()
        } catch {
            viewContext.rollback()
            print(error.localizedDescription)
        }
    }
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "ExpenseTrackerModel")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Unable to initialize Core Data Stack \(error)")

            }
        }
    }
    
}

