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
    func delete(entity: ManagedEntity) throws
    func saveOrUpdate(_ entity: ManagedEntity) throws
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
    
    func delete(entity: ManagedEntity) throws{
        context.delete(entity)
        try CoredataManager.shared.saveContext()
    }
    
    func saveOrUpdate(_ entity: ManagedEntity) throws{
        if entity.managedObjectContext == nil {
            context.insert(entity)
        }
        
        try CoredataManager.shared.saveContext()
    }
}
