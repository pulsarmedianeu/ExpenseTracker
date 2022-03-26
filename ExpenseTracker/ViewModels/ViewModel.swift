//
//  ExpenseTrackerViewModel.swift
//  ExpenseTracker
//
//  Created by Orszagh Sandor on 2022. 03. 25..
//



import Foundation
import CoreData

class ViewModel: ObservableObject {
    
    var title: String = ""
    var amount: String = ""
    
    static var counter : Int = 0
    
    @Published var etItems: [ItemViewModel] = []
    @Published var sum: Int = 0
    
    
    //--> Sum of Amount
    func getSum() {
        sum = etItems
            .map(\.amount)
            .reduce(0, +)
    }
    
    //--> Get all items from Core Data
    func getAllItems() {
        etItems = CoreDataManager.shared.getAllItems().map(ItemViewModel.init)
        getSum()
    }
    
    func delete(_ item: ItemViewModel) {
        
        let existingTask = CoreDataManager.shared.getItemById(id: item.id)
        if let existingTask = existingTask {
            CoreDataManager.shared.deleteItem(item: existingTask)
        }
    }
    
    func save() {
        
        let item = ExpenseTrackerItem(context: CoreDataManager.shared.viewContext)
        
        //--> If title is empty, we will give back a NoName counter string
        
        if (title=="") {
            
            ViewModel.counter+=1
            item.title = "NoName \(ViewModel.counter)"
            
        } else {
            
            item.title = title
            
        }
        
       
        item.amount = Int64(amount) ?? 0
        item.timestamp = Date.now
        
        
        CoreDataManager.shared.save()
    }
}

struct ItemViewModel {
    
    let item: ExpenseTrackerItem
    
    var id: NSManagedObjectID {
        return item.objectID
    }
    
    var title: String {
        return item.title ?? ""
    }
    
    var amount : Int {
        return Int(item.amount)
    }
    
    var timestamp : Date {
        return item.timestamp ?? Date.now
    }
    
}
