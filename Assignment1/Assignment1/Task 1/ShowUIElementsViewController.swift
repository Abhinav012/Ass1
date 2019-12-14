//
//  ShowUIElementsViewController.swift
//  Assignment1
//
//  Created by Thanos on 14/12/19.
//  Copyright © 2019 Thanos. All rights reserved.
//

import UIKit
import SWRevealViewController

class ShowUIElementsViewController: UIViewController {

    @IBOutlet weak var layerView: UIView!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var placeholderLabel: UILabel!
    @IBOutlet weak var sampleImageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var changeModeSwitch: UISwitch!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        textField.delegate = self
    }
    
    @IBAction func clickMeButtonAction(_ sender: Any) {
        
        if let text = textField.text{
        placeholderLabel.text = text
        }
    }
    
    @IBAction func sliderAction(_ sender: Any) {
        self.view.alpha = CGFloat(slider.value)
        
    }
    
    @IBAction func switchAction(_ sender: Any) {
    
        if changeModeSwitch.isOn == false{
            self.layerView.backgroundColor = UIColor.white
        }
        else{
            self.layerView.backgroundColor = UIColor.lightGray
        }
    
    }
    
    @IBAction func segmentedControlAction(_ sender: Any) {
        if segmentedControl.selectedSegmentIndex == 0{
            sampleImageView.image = UIImage(named: "apple_colored")
        }
        else{
            sampleImageView.image = UIImage(named: "apple_black_white")
        }
    }
    
}

extension ShowUIElementsViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.textField.resignFirstResponder()
        
        return true
    }
    
}
