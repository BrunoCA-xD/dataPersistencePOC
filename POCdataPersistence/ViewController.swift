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
        let form = Form(name: "Bruno", imc: 25.45, activitylevel: "Sedentário")
        do {
            let data = try JSONEncoder().encode(form)
            let myJson = try JSONSerialization.jsonObject(with: data, options: [])
            print("My JSON: ", myJson)
        } catch {
            print(error)
        }
    }

    

}

