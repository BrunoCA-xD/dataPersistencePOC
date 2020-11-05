//
//  ViewController.swift
//  POCdataPersistence
//
//  Created by Bruno Cardoso Ambrosio on 04/11/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let operation = 1 // 0 - salvar 1 - puxar
        
        let form = Form(name: "Bruno", imc: 25.45, activitylevel: "Sedentário")
        do {
            var url = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            url.appendPathComponent("/mandala.json")
            if operation == 0{
                let data = try JSONEncoder().encode(form)
                let myJson = try JSONSerialization.jsonObject(with: data, options: []) as! NSDictionary
                // SALVAR E LER DE ARQUIVO
                try myJson.write(to: url,
                                 atomically: true)
                print("My JSON: \n", myJson)
            }else {
                var file = NSDictionary(contentsOf: url)
                
                let readJSON = try JSONSerialization.data(withJSONObject: file, options: [])
                let decoded = try JSONDecoder().decode(Form.self, from: readJSON)
                print(decoded)
            }
            
//            let readJSON = try JSONSerialization.data(withJSONObject: myJson, options: [])
//            let decoded = try JSONDecoder().decode(Form.self, from: readJSON)
//            print(decoded)
        } catch {
            print(error)
        }
    }

    

}

