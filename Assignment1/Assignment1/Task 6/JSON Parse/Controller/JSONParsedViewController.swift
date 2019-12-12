//
//  JSONParsedViewController.swift
//  Assignment1
//
//  Created by Thanos on 11/12/19.
//  Copyright © 2019 Thanos. All rights reserved.
//

import UIKit
import SWRevealViewController

class JSONParsedViewController: UIViewController {
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var parsedJSONTxtView: UITextView!
    
    var url = URL(string: "https://api.github.com/users/abhinav0012")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        let manager = JSONParsingManager()
            manager.getData(from: url, completion: setData)

        
    }
    
    func setData(data: Data?){
        let decoder = JSONDecoder()
        do{
        let myGithub = try decoder.decode(MyGitHub.self, from: data!)
        DispatchQueue.main.async {
           self.parsedJSONTxtView.text = """
            JSON PARSED DATA:
            
            Login : \(myGithub.login!)
            Id: \(myGithub.id!)
            Node Id: \(myGithub.nodeId!)
            Avatar URL: \(myGithub.avatarUrl!)
            """
        }
        }catch(let error){
            print(error.localizedDescription)
        }
    }
    
    
    

   
}
