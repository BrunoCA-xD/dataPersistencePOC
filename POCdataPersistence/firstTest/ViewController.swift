//
//  ViewController.swift
//  POCdataPersistence
//
//  Created by Bruno Cardoso Ambrosio on 04/11/20.
//

import UIKit

class ViewController: UIViewController {
    let operationQueue = OperationQueue()
    var manager = JSONManager<Form>()
    override func viewDidLoad() {
        super.viewDidLoad()
        operationQueue.maxConcurrentOperationCount = 2
        
    }
    @IBAction func queries(_ sender: Any) {
        print("Aqui começa")
        manager.getJSON(fileName: "/mandala.json") {mandala, _ in
            print("lendo")
            if var mandala = mandala {
                print("save")
                self.operationQueue.addOperation {
                    mandala.imc = 234
                    self.manager.saveJSON(json: mandala, fileName: "/mandala.json")
                    print("escrevendo")
                }
                print("save1")
                self.operationQueue.addOperation  {
                    mandala.imc = 120
                    self.manager.saveJSON(json: mandala,fileName: "/mandala.json")
                    print("escrevendo1")
                }
            }
        }
        
        self.operationQueue.addOperation {
            print("test")
            self.manager.getJSON(fileName: "/mandala.json"){
                mandala, error in
                print("lendo1")
                print(mandala)
            }
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

