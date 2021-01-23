//
//  ViewController.swift
//  MapTask
//
//  Created by Igor Belobrov on 20.01.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var emailName: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        
        guard let name = emailName.text, !name.isEmpty , let pass = password.text, !pass.isEmpty else {
            let logAlert = UIAlertController(title: "Can't login", message: "Sorry, but you must fill in all sign in  fields", preferredStyle: UIAlertController.Style.alert)
            logAlert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            present(logAlert, animated: true, completion: nil)
            return
        }
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        vc.title = emailName.text
        navigationController?.pushViewController(vc, animated: true)
    }
}



