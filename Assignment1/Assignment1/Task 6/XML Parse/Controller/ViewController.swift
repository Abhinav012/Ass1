//
//  ViewController.swift
//  Assignment1
//
//  Created by Thanos on 10/12/19.
//  Copyright © 2019 Thanos. All rights reserved.
//

import UIKit
import SWRevealViewController

class ViewController: UIViewController {
    @IBOutlet weak var xmlDisplayTxtView: UITextView!
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        
       let manager = ParsingManager()
           manager.parseXML()
           xmlDisplayTxtView.text = manager.finalDisplayString
        
    }


    @IBAction func menuBtnTapped(_ sender: Any) {
        
        let buttonTitle = (sender as AnyObject).currentTitle
        self.revealViewController()?.rearViewController.performSegue(withIdentifier: buttonTitle as! String, sender: self.revealViewController()?.rearViewController)
    }
    
    
}

