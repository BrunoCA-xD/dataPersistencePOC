//
//  GenericDAO.swift
//  POCdataPersistence
//
//  Created by Bruno Cardoso Ambrosio on 06/11/20.
//

import Foundation
import CoreData

protocol GenericsDAO{
    associatedtype ManagedEntity: NSManagedObject

    var entityName: String { get set }
    var context: NSManagedObjectContext { get }

    func listAll() -> [ManagedEntity]
    func delete(entity: ManagedEntity)
    func save()
}

extension GenericsDAO {
    var context: NSManagedObjectContext {
        CoredataManager.shared.persistentContainer.viewContext
    }
    
    func listAll() -> [ManagedEntity] {
        var lst: [ManagedEntity] = []
        
        do {
            let fetchRequest = NSFetchRequest<ManagedEntity>(entityName: entityName)
            lst = try context.fetch(fetchRequest)
        }catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        return lst
    }
    
    func delete(entity: ManagedEntity) {
        context.delete(entity)
        save()
    }
    
    func save() {
        CoredataManager.shared.saveContext()
    }
}
