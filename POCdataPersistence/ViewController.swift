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
        
    }
    @IBAction func save(_ sender: Any) {
        let mandala = Mandala()
        mandala.name = "Bruno"
        mandala.imc = 20
        mandala.activityLevel = "Sedentário"
        do {
            try mandalaDAO.saveOrUpdate(mandala)
        } catch (let error) {
            print(error.localizedDescription)
        }
    }
    
    @IBAction func crashTest(_ sender: Any) {
        simultaneosUpdate()
    }
    @IBAction func test(_ sender: Any) {
        DispatchQueue.main.async { [self] in
            let list: [Mandala] = mandalaDAO.listAll()
            let mandala = list.randomElement()!
            DispatchQueue.main.async {
                let intVal = String(describing: Int.random(in: 0..<100))
                mandala.name = "\(intVal) dasdas"
                do {
                    try mandalaDAO.saveOrUpdate(mandala)
                } catch let error {
                    print("error -> " + error.localizedDescription)
                }
                print("t3 -> \(Date())")
            }
            print("t1 -> \(Date())")
        }
        DispatchQueue.main.async { [self] in
            let list: [Mandala] = mandalaDAO.listAll()
            list.forEach { print($0.name)}
            print("t2 -> \(Date())")
        }
    }
    
    
    func simultaneosUpdate() {
        DispatchQueue(label: "t1").async { [self] in
            let list: [Mandala] = mandalaDAO.listAll()
            let mandala = list.first!
            DispatchQueue(label: "t3").async {
                mandala.name = "t10 editing"
                do {
                    try mandalaDAO.saveOrUpdate(mandala)
                } catch let error {
                    print("puxar do banco e tentar salvar de novo \\t3")
                }
                print("t3 -> \(Date())")
            }
            DispatchQueue(label: "t4").async {
                mandala.name = "t8 editing"
                do {
                    try mandalaDAO.saveOrUpdate(mandala)
                } catch let error {
                    print("puxar do banco e tentar salvar de novo \\t4")
                }
                print("t4 -> \(Date())")
            }
            print("t1 -> \(Date())")
        }
        DispatchQueue(label: "t2").async { [self] in
            let list: [Mandala] = mandalaDAO.listAll()
            list.forEach { print($0.name)}
            print("t2 -> \(Date())")
        }
    }
}
