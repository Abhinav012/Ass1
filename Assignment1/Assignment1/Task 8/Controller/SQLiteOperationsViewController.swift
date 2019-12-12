//
//  SQLiteOperationsViewController.swift
//  Assignment1
//
//  Created by Thanos on 12/12/19.
//  Copyright © 2019 Thanos. All rights reserved.
//

import UIKit
import SWRevealViewController


class SQLiteOperationsViewController: UIViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    @IBAction func createTableBtnAction(_ sender: Any) {
        SQLiteManager.shared.createtable()
    }
    
    @IBAction func insertTableBtnAction(_ sender: Any) {
        let alert = UIAlertController(title: "Insert User", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Name"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Email"
        }
        
        let alertAction = UIAlertAction(title: "submit", style: .default) { (_) in
            
            guard let name = alert.textFields?.first?.text, let email = alert.textFields?.last?.text else{
                return
            }
            
            print("Name: \(name)")
            print("Mail ID: \(email)")
            
            let insertQuery = "insert into Record(name,email)values('\(name)','\(email)')"
            
            let isSuccess = SQLiteManager.shared.executeQuery(query: insertQuery)
            if isSuccess
            {
                print("Insert:successful")
                
                
            }
            else
            {
                print("Insert:failed")
            }
        }
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel) { (_) in
            alert.dismiss(animated: true, completion: nil)
        }
        
       alert.addAction(alertAction)
       alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func updateAction(_ sender: Any) {
        let alert = UIAlertController(title: "Update User", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "User Id"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Email"
        }
        
        let alertAction = UIAlertAction(title: "submit", style: .default) { (_) in
            
            guard let name = alert.textFields?.first?.text, let email = alert.textFields?.last?.text else{
                return
            }
            
            let updateQuery = "update Record set name = '\(name)' where email = '\(email)'"
            let isSuccess = SQLiteManager.shared.executeQuery(query: updateQuery)
            if isSuccess == true {
                print("Update Successfully")
            }
            else
            {
                print("Failed to update")
            }
        }
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel) { (_) in
            alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(alertAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func listTableBtnAction(_ sender: Any) {
        print("LISTING TABLE DATA:")
        let selectQuery = "select name,email From Record"
        SQLiteManager.shared.fetchAllUsersDetails(query: selectQuery)
       
    }
    
    @IBAction func deleteBtnAction(_ sender: Any) {
        let alert = UIAlertController(title: "Delete User", message: nil, preferredStyle: .alert)
//        alert.addTextField { (textField) in
//            textField.placeholder = "User Id"
//        }
        alert.addTextField { (textField) in
            textField.placeholder = "Email"
        }
        
        let alertAction = UIAlertAction(title: "submit", style: .default) { (_) in
            
            guard let name = alert.textFields?.first?.text!, let email = alert.textFields?.last?.text else{
                return
            }
            
            let deleteQuery = "Delete from Record Where email = '\(email)'"
            let isSuccess = SQLiteManager.shared.executeQuery(query: deleteQuery)
            if isSuccess == true {
                print("Deleted")
            }
            else
            {
                print("Failed in deletion")
            }
        }
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel) { (_) in
            alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(alertAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    
}
