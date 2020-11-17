//
//  EditViewController.swift
//  POCdataPersistence
//
//  Created by Bruno Cardoso Ambrosio on 17/11/20.
//

import UIKit

class EditViewController: UIViewController {
    var manager = JSONManager<Form>()
    var mandala: Form!
    
    
    @IBAction func save(_ sender: Any) {
        if name.text != nil && name.text != ""{
            mandala.name = name.text!
            
            manager.saveJSON(json: mandala, fileName: "/mandala.json") { (form, error) in
                if error == nil {
                    DispatchQueue.main.async {
                        self.navigationController?.popViewController(animated: true)
                    }
                }
            }
        }
        
    }
    @IBOutlet weak var name: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = mandala.name

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
