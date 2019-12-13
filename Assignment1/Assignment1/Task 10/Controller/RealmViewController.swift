//
//  RealmViewController.swift
//  Assignment1
//
//  Created by Thanos on 13/12/19.
//  Copyright © 2019 Thanos. All rights reserved.
//

import UIKit
import SWRevealViewController
import RealmSwift

class RealmViewController: UIViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    var realm: Realm?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        
        createRealmObject()
    }
    

    func makeUserWithName(_ name: String, pet: Pet?)-> User{
        let newUser = User()
        newUser.name = name
        newUser.pet = pet
        
        return newUser
    }
    
    func makePetWithName(_ name: String, owner: User?)-> Pet{
        let newPet = Pet()
        newPet.petName = name
        newPet.owner = owner
        
        return newPet
    }
    
    func createRealmObject(){
        
        realm = try! Realm()
    }

    @IBAction func insertDetails(_ sender: Any) {
        let alert = UIAlertController(title: "Insert Owner And Pet Details", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Owner Name"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Pet Name"
        }
        
        
        let alertAction = UIAlertAction(title: "submit", style: .default) { (_) in
            
            guard let ownerName = alert.textFields?.first?.text, let petName = alert.textFields?.last?.text else{
                return
            }
            
            print("OWNER: \(ownerName)")
            print("PET: \(petName)")
            
            let pet: Pet? = self.makePetWithName(petName, owner: nil)
            let newOwner: User? = self.makeUserWithName(ownerName, pet: pet)
            //pet?.owner = newOwner
            
            do{
                try self.realm?.write {
                    self.realm?.add(pet!)
                    self.realm?.add(newOwner!)
                    print("Record Inserted!!!....")
                }
            }catch(let error){
                print(error)
            }
 
            
            
        }
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel) { (_) in
            alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(alertAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    @IBAction func updateDetails(_ sender: Any) {
        let alert = UIAlertController(title: "Update Pet Details for given Owner", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Owner Name"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Pet Name"
        }
        
        
        let alertAction = UIAlertAction(title: "submit", style: .default) { (_) in
            
            guard let ownerName = alert.textFields?.first?.text, let petName = alert.textFields?.last?.text else{
                return
            }
            
            print("OWNER: \(ownerName)")
            print("PET: \(petName)")
            
           let users = self.realm?.objects(User.self)
            
            for user in users!{
                if user.name == ownerName {
                    do {
                        try self.realm?.write {
                        user.pet?.petName = petName
                    }
                    }catch(let error){
                        print(error)
                    }
            }
            
        }
        }
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel) { (_) in
            alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(alertAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func listDeatails(_ sender: Any) {
        
        let users = realm?.objects(User.self)
        print(users)
    }
    
    
    @IBAction func removeDetails(_ sender: Any) {
        
        let alert = UIAlertController(title: "Insert Owner And Pet Details", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Owner Name"
        }
        
        
        
        let alertAction = UIAlertAction(title: "submit", style: .default) { (_) in
            
            guard let ownerName = alert.textFields?.first?.text else{
                return
            }
            print("OWNER: \(ownerName)")
            
            let users = self.realm?.objects(User.self)
            for user in users!{
                if user.name == ownerName{
                    
                    try! self.realm?.write {
                        self.realm?.delete(user)
                    }
                    break
                }
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
