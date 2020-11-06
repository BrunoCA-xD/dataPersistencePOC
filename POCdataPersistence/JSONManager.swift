//
//  JSONManager.swift
//  POCdataPersistence
//
//  Created by Giovani de Oliveira Coutinho on 06/11/20.
//

import Foundation
import UIKit

class JSONManager{
    func saveJSON(json:Form,fileName:String){
        do {
            var url = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            url.appendPathComponent(fileName)
            let data = try JSONEncoder().encode(json)
            let myJson = try JSONSerialization.jsonObject(with: data, options: []) as! NSDictionary
            // SALVAR ARQUIVO
            myJson.write(to: url, atomically: true)
        } catch {
            print(error)
        }
    }
    
    func getJSON(fileName:String) -> Form{
        do {
            var url = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            url.appendPathComponent(fileName)
            let file = NSDictionary(contentsOf: url)
            // LER ARQUIVO
            let readJSON = try JSONSerialization.data(withJSONObject: file!, options: [])
            let decoded = try JSONDecoder().decode(Form.self, from: readJSON)
            return decoded
        } catch {
            print(error)
            return Form(name: "", imc: 0.0, activitylevel: "")
        }
    }
}
