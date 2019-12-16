//
//  SegueViewController.swift
//  Assignment1
//
//  Created by Thanos on 16/12/19.
//  Copyright © 2019 Thanos. All rights reserved.
//

import UIKit
import SWRevealViewController

class SegueViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()

        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }


    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "segSegueVCToDestinationVC"{
//            let destinationVC = segue.destination as! DestinationViewController
//            print(nameTextField.text)
//            destinationVC.name = nameTextField.text!
//        }
    
//    }
 
    @IBAction func buttonDidTapped(_ sender: Any) {
      // performSegue(withIdentifier: "segSegueVCToDestinationVC", sender: self)
        
      let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DestinationVC") as! DestinationViewController
       vc.name = nameTextField.text!
      self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
}
