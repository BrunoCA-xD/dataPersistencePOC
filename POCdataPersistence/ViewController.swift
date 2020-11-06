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
        let form = Form(name: "Bruno", imc: 25.45, activitylevel: "Sedentário")
        manager.saveJSON(json: form,fileName: "/mandala.json")
        if let reading = manager.getJSON(fileName: "/mandala.json"){
            print(reading)
        }
    }
}

