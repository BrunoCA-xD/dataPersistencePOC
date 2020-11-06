//
//  MandalaDAO.swift
//  POCdataPersistence
//
//  Created by Bruno Cardoso Ambrosio on 06/11/20.
//

import Foundation

struct MandalaDAO: GenericsDAO {
    var entityName: String = "Mandala"
    typealias ManagedEntity = Mandala
    
    func listAll() -> [Mandala] {
        var lst: [ManagedEntity] = []
        
        do {
            lst = try context.fetch(Mandala.fetchRequest())
        }catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        return lst
    }

}
