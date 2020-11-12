//
//  ViewController.swift
//  POCdataPersistence
//
//  Created by Bruno Cardoso Ambrosio on 04/11/20.
//

import UIKit

class ViewController: UIViewController {
    var manager = JSONManager<Form>()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func queries(_ sender: Any) {
        manager.getJSON(fileName: "/mandala.json") {mandala, _ in
            if var mandala = mandala {
                mandala.imc = 234
                self.manager.saveJSON(json: mandala, fileName: "/mandala.json")
                mandala.imc = 120
                self.manager.saveJSON(json: mandala,fileName: "/mandala.json")
            }
        }
        manager.getJSON(fileName: "/mandala.json"){
            mandala, error in
            print(mandala)
        }
    }
    @IBAction func save(_ sender: Any) {
        let form = Form(name: "Giovani", imc: 24.16, activitylevel: "Ativo")
        manager.saveJSON(json: form,fileName: "/mandala.json")
        manager.getJSON(fileName: "/mandala.json"){ mandala, error in
            print(mandala)
        }
    }
}

