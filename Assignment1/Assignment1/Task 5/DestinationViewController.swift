//
//  DestinationViewController.swift
//  Assignment1
//
//  Created by Thanos on 16/12/19.
//  Copyright © 2019 Thanos. All rights reserved.
//

import UIKit

class DestinationViewController: UIViewController {

    var name = ""
    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = name
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
