//
//  AssignmentListTableViewController.swift
//  Assignment1
//
//  Created by Thanos on 10/12/19.
//  Copyright © 2019 Thanos. All rights reserved.
//

import UIKit

class AssignmentListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 13
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
          let cell = tableView.dequeueReusableCell(withIdentifier: "xmlCell", for: indexPath)
          return cell
        }
        else if indexPath.row == 1{
          let cell = tableView.dequeueReusableCell(withIdentifier: "JSONCell", for: indexPath)
            return cell
            
        }
        else if indexPath.row == 2{
        let cell = tableView.dequeueReusableCell(withIdentifier: "SQLiteOperationCell", for: indexPath)
        return cell
        }
        else if indexPath.row == 3{
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoreDataCell", for: indexPath)
        return cell
        }
        else if indexPath.row == 4{
        let cell = tableView.dequeueReusableCell(withIdentifier: "RealmCell", for: indexPath)
        return cell
        }
        else if indexPath.row == 5{
        let cell = tableView.dequeueReusableCell(withIdentifier: "UDCell", for: indexPath)
        return cell
        }
        else if indexPath.row == 6{
        let cell = tableView.dequeueReusableCell(withIdentifier: "WKCell", for: indexPath)
        return cell
        }
        else if indexPath.row == 7{
        let cell = tableView.dequeueReusableCell(withIdentifier: "UIElementsCell", for: indexPath)
        return cell
        }
        else if indexPath.row == 8{
        let cell = tableView.dequeueReusableCell(withIdentifier: "UIEPickerCell", for: indexPath)
        return cell
        }
        else if indexPath.row == 9{
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITabBarCell", for: indexPath)
        return cell
        }
        else if indexPath.row == 10{
        let cell = tableView.dequeueReusableCell(withIdentifier: "collectionViewCell", for: indexPath)
        return cell
        }
        else if indexPath.row == 11{
        let cell = tableView.dequeueReusableCell(withIdentifier: "segueCell", for: indexPath)
        return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "consCell", for: indexPath)
        return cell
     }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
