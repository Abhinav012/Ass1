//
//  CoreDataOperationViewController.swift
//  Assignment1
//
//  Created by Thanos on 12/12/19.
//  Copyright © 2019 Thanos. All rights reserved.
//

import UIKit
import SWRevealViewController

class CoreDataOperationViewController: UIViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()

        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
       
    }
    

    @IBAction func insertProductDetails(_ sender: Any) {
        let alert = UIAlertController(title: "Insert Product", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "ID"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Name"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Price"
        }
        
        let alertAction = UIAlertAction(title: "submit", style: .default) { (_) in
            
            guard let id = alert.textFields?.first?.text, let price = alert.textFields?.last?.text, let name = alert.textFields?[1].text else{
                return
            }
            
            print("ID: \(id)")
            print("Name: \(name)")
            print("Price: \(price)")
            
            DataManager.shared.insertProductDetails(id: id, name: name, price: Double(price)!)
            print("Record Inserted!!!....")
            
        }
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel) { (_) in
            alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(alertAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func updateProductDetails(_ sender: Any) {
        
        let alert = UIAlertController(title: "Update Product", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "ID"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Name"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Price"
        }
        
        let alertAction = UIAlertAction(title: "submit", style: .default) { (_) in
            
            guard let id = alert.textFields?.first?.text, let price = alert.textFields?.last?.text, let name = alert.textFields?[1].text else{
                return
            }
            
            print("ID: \(id)")
            print("Name: \(name)")
            print("Price: \(price)")
            
            DataManager.shared.updateProductDetails(id: id, name: name, price: Double(price)!)
            print("Record updated!!!...")
            
        }
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel) { (_) in
            alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(alertAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func listProductDetails(_ sender: Any) {
        
        DataManager.shared.fetchAllProductsDetail()
    }
    
    
    @IBAction func removeProductDetails(_ sender: Any) {
        let alert = UIAlertController(title: "Update Product", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "ID"
        }
        
        
        let alertAction = UIAlertAction(title: "submit", style: .default) { (_) in
            
            guard let id = alert.textFields?.first?.text else{
                return
            }
            
            print("ID: \(id)")
           
            DataManager.shared.deleteProductDetails(id: id)
            print("Record Deleted !!!...")
        }
        
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
    }
    
}
