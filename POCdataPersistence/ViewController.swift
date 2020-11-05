//
//  ViewController.swift
//  POCdataPersistence
//
//  Created by Bruno Cardoso Ambrosio on 04/11/20.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let useJson = false
        let operation = 1 // 0 - salvar 1 - puxar
        if useJson{
            let form = Form(name: "Bruno", imc: 25.45, activitylevel: "Sedentário")
            do {
                var url = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                url.appendPathComponent("/mandala.json")
                if operation == 0{
                    let data = try JSONEncoder().encode(form)
                    let myJson = try JSONSerialization.jsonObject(with: data, options: []) as! NSDictionary
                    try myJson.write(to: url,
                                     atomically: true)
                    print("My JSON: \n", myJson)
                }else {
                    var file = NSDictionary(contentsOf: url)
                    
                    let readJSON = try JSONSerialization.data(withJSONObject: file, options: [])
                    let decoded = try JSONDecoder().decode(Form.self, from: readJSON)
                    print(decoded)
                }
            } catch {
                print(error)
            }
        }else {
            if operation == 0 {
                let mandala = Mandala()
                mandala.name = "Giovanni"
                mandala.imc = 15.45
                mandala.activityLevel  = "Pouco ativo"
                
                CoreDataDAO.shared.persistentContainer.viewContext.insert(mandala)
                CoreDataDAO.shared.saveContext()
            }else {
                do {
                    var list: [Mandala] = []
                    list = try CoreDataDAO.shared.persistentContainer.viewContext.fetch(Mandala.fetchRequest())
                    
                    list.forEach { (element) in
                        print(element.name)
                    }
                    
                } catch  {
                    print(error)
                }
                
                
            }
        }
    }

    

}

