//
//  UserDefaultViewController.swift
//  Assignment1
//
//  Created by Thanos on 13/12/19.
//  Copyright © 2019 Thanos. All rights reserved.
//

import UIKit
import SWRevealViewController

class UserDefaultViewController: UIViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    var owner : Owner?
    var book: Book?
    var books = [Book]()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }

     
        
//        let book1 =  Book(title: "Monk who sold his Ferrari", generic: "Mega Living", price: 250, id: "AWS178")
//        let book2 = Book(title: "Harry Potter", generic: "Fiction", price: 400, id: "ZDF276")
//
//        let owner = Owner(name: "Roy", age: 24, books: [book1,book2], address: "Old Sangvi, Pune")
//
//
//        do{
//            let encoder = JSONEncoder()
//            let encoded = try encoder.encode(owner)
//
//            defaults.set(encoded, forKey: "owner")
//
//        }catch(let error){
//            print(error.localizedDescription)
//        }
//
//        do{
//            let decoder = JSONDecoder()
//            let data = defaults.value(forKey: "owner") as! Data
//
//            let fetchedOwner = try decoder.decode(Owner.self, from: data)
//            print(fetchedOwner.name)
//            print(fetchedOwner.age)
//            print(fetchedOwner.address)
//
//            print(fetchedOwner.books?[0].title)
//            print(fetchedOwner.books?[0].generic)
//            print(fetchedOwner.books?[0].price)
//
//            print(fetchedOwner.books?[1].title)
//            print(fetchedOwner.books?[1].generic)
//            print(fetchedOwner.books?[1].price)
//
//        }catch(let error){
//            print(error.localizedDescription)
//        }
        
    }
    
    @IBAction func enterDetails(_ sender: Any) {
        let alert = UIAlertController(title: "Insert Owner Details", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Owner Name"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Age"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Address"
        }
        
        let alertAction = UIAlertAction(title: "submit", style: .default) { (_) in
            
            guard let ownerName = alert.textFields?.first?.text, let age = alert.textFields?[1].text, let address = alert.textFields?.last!.text else {
                return
            }
            
            self.owner = Owner(name: ownerName, age: Int(age), books: [], address: address)
            
            
            
        }
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel) { (_) in
            alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(alertAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func enterDetailsForBook(_ sender: Any) {
        let alert = UIAlertController(title: "Insert book Details", message: nil, preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "Name"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Genric"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Price"
        }
        
        let alertAction = UIAlertAction(title: "submit", style: .default) { (_) in
            
            guard let name = alert.textFields?.first?.text, let generic = alert.textFields?[1].text, let price = alert.textFields?.last!.text else {
                return
            }
            
            self.book = Book(title: name, generic: generic, price: Double(price))
            self.books.append(self.book!)
            self.owner?.books = self.books
            
            do{
                let encoder = JSONEncoder()
                let encoded = try encoder.encode(self.owner!)
                
                self.defaults.set(encoded, forKey: "owner")
                
                self.owner = nil
                self.books = [Book]()
            }catch(let error){
                print(error.localizedDescription)
            }
            
            
        }
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel) { (_) in
            alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(alertAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func showData(_ sender: Any) {
        
        do{
            let decoder = JSONDecoder()
            let data = defaults.value(forKey: "owner") as! Data
            
            let fetchedOwner = try decoder.decode(Owner.self, from: data)
            print(fetchedOwner.name!)
            print(fetchedOwner.age!)
            print(fetchedOwner.address!)
            
            for book in fetchedOwner.books!{
                print(book.title!)
                print(book.generic!)
                print(book.price!)
            }
            
        }catch(let error){
            print(error.localizedDescription)
        }
    }
}
