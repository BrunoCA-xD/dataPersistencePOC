//
//  ViewController.swift
//  POCdataPersistence
//
//  Created by Bruno Cardoso Ambrosio on 04/11/20.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    let mandalaDAO = MandalaDAO()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let operation = 1 // 0 - salvar 1 - puxar
        if operation == 0 {
            let mandala = Mandala()
            mandala.name = "User 1"
            mandala.imc = 15.45
            mandala.activityLevel  = "Pouco ativo"
            mandalaDAO.saveOrUpdate(mandala)
        }else {
            do {
                let list: [Mandala] = mandalaDAO.listAll()
                
                list.forEach { (entity) in
                    print(entity.name)
                }
                
            } catch  {
                print(error)
            }
        }
        
        
        
    }
    
}
