//
//  AssignmentListViewController.swift
//  Assignment1
//
//  Created by Thanos on 10/12/19.
//  Copyright © 2019 Thanos. All rights reserved.
//

import UIKit

class AssignmentListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.textLabel?.text = "Assignment"
        return cell!
    }

}
