//
//  JSONManager.swift
//  POCdataPersistence
//
//  Created by Giovani de Oliveira Coutinho on 06/11/20.
//

import Foundation
import UIKit

class JSONManager<Entity> where Entity:Codable{
    private func getURL(fileName: String) -> URL?{
        do {
            var url = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            url.appendPathComponent(fileName)
            return url
        }catch {
            print(error)
            return nil
        }
    }
    
    func saveJSON(json: Entity, fileName: String){
        do {
            if let url = getURL(fileName: fileName) {
                let data = try JSONEncoder().encode(json)
                let myJson = try JSONSerialization.jsonObject(with: data, options: []) as! NSDictionary
                // SALVAR ARQUIVO
                myJson.write(to: url, atomically: true)
            }else{
                print("Failed generating url")
            }
        } catch {
            print(error)
        }
    }
    
    func getJSON(fileName: String) -> Entity?{
        do {
            if let url = getURL(fileName: fileName){
                let file = NSDictionary(contentsOf: url)
                // LER ARQUIVO
                let readJSON = try JSONSerialization.data(withJSONObject: file!, options: [])
                let decoded = try JSONDecoder().decode(Entity.self, from: readJSON)
                return decoded
            }else{
                print("Failed generating url")
                return nil
            }
        } catch {
            print(error)
            return nil
        }
    }
}
