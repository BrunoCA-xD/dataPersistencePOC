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
//        let form = Form(name: "Giovani", imc: 24.16, activitylevel: "Ativo")
//        manager.saveJSON(json: form,fileName: "/mandala.json")
//        if let reading = manager.getJSON(fileName: "/mandala.json"){
//            print(reading)
//        }
        DispatchQueue.main.async { [self] in
            if var reading = manager.getJSON(fileName: "/mandala.json"){
                DispatchQueue(label: "t2").async { [self] in
                    reading.imc = 18.0
                    manager.saveJSON(json: reading,fileName: "/mandala.json")
                }
                DispatchQueue(label: "t4").async { [self] in
                    reading.imc = 20.0
                    manager.saveJSON(json: reading,fileName: "/mandala.json")
                }
                
            }
        }
        
        DispatchQueue.main.async { [self] in
            if let reading = manager.getJSON(fileName: "/mandala.json"){
                print(reading)
            }
        }
    }
}

