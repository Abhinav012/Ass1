//
//  PickViewController.swift
//  Assignment1
//
//  Created by Thanos on 14/12/19.
//  Copyright © 2019 Thanos. All rights reserved.
//

import UIKit
import SWRevealViewController

class PickViewController: UIViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var weekLabel: UILabel!
    
    var weekDayArray = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    
    
    }

    @IBAction func datePickerAction(_ sender: Any) {
        
        let date = datePicker.date
        let dateFormatter = DateFormatter()

        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        
        dateLabel.text = dateFormatter.string(from: date)
        
        
    }
}

extension PickViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return weekDayArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return weekDayArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        weekLabel.text = weekDayArray[row]
    }
    
    
}
