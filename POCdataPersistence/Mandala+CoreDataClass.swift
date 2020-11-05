//
//  Mandala+CoreDataClass.swift
//  POCdataPersistence
//
//  Created by Bruno Cardoso Ambrosio on 05/11/20.
//
//

import Foundation
import CoreData

@objc(Mandala)
public class Mandala: NSManagedObject {

    convenience init(){
        let managedObjectContext: NSManagedObjectContext = CoreDataDAO.shared.persistentContainer.viewContext
        let entityDescription = NSEntityDescription.entity(forEntityName: "Mandala", in: managedObjectContext)
        
        self.init(entity: entityDescription!, insertInto: nil)
    }
}
