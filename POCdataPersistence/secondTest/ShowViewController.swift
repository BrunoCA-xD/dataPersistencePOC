//
//  ShowViewController.swift
//  POCdataPersistence
//
//  Created by Bruno Cardoso Ambrosio on 17/11/20.
//

import UIKit

class ShowViewController: UIViewController {

    @IBOutlet weak var mandalaLabel: UILabel!
    
    var manager = JSONManager<Form>()
    var mandala: Form?{
        didSet{
            if mandala != nil {
                DispatchQueue.main.async {
                    self.mandalaLabel.text = self.mandala?.name
                }
            }
        }
    }
    
    fileprivate func loadMandala() {
        manager.getJSON(fileName: "/mandala.json") {mandala, _ in
            self.mandala = mandala
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadMandala()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        loadMandala()
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? EditViewController {
            vc.mandala = self.mandala
        }
    }

}
