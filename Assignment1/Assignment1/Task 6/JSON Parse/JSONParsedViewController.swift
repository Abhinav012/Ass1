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
        
        getData()
    }
    
    func getData(){
        
        if let url = url {
           let urlRequest = URLRequest(url: url)
           let session = URLSession.shared
           let task = session.dataTask(with: urlRequest) { (data, response, error) in
                
            if error == nil{
                if let data = data{
                    do{
                    let decoder = JSONDecoder()
                        
                    let myGithub = try decoder.decode(MyGitHub.self, from: data)
                        DispatchQueue.main.async {
                                  self.parsedJSONTxtView.text? = """
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
            }
            
           task.resume()
        }
        
    }
    

   
}
