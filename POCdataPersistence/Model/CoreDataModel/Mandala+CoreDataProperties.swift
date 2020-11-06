//
//  Mandala+CoreDataProperties.swift
//  POCdataPersistence
//
//  Created by Bruno Cardoso Ambrosio on 05/11/20.
//
//

import Foundation
import CoreData


extension Mandala {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Mandala> {
        return NSFetchRequest<Mandala>(entityName: "Mandala")
    }

    @NSManaged public var activityLevel: String?
    @NSManaged public var imc: Double
    @NSManaged public var name: String?

}
