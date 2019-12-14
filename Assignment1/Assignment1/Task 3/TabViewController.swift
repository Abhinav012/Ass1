//
//  TabViewController.swift
//  Assignment1
//
//  Created by Thanos on 14/12/19.
//  Copyright © 2019 Thanos. All rights reserved.
//

import UIKit
import SWRevealViewController

class TabViewController: UIViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    var tabBarController2: UITabBarController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
 
      
//        tabBarController2 = UITabBarController()
//
//        let vc1 = UIViewController()
//        vc1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), tag: 0)
//        vc1.view.backgroundColor = UIColor.white
//
//        let vc2 = UIViewController()
//        vc2.tabBarItem = UITabBarItem(title: "Chat", image: UIImage(named: "chat"), tag: 1)
//        vc2.view.backgroundColor = UIColor.lightGray
//
//        let vc3 = UIViewController()
//        vc3.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(named: "settings"), tag: 2)
//        vc3.view.backgroundColor = UIColor.black
//
//        tabBarController2!.setViewControllers([vc1,vc2,vc3], animated: true)
        
//        self.navigationController?.pushViewController(tabBarController2!, animated: true)
        
 
     }
    
    @IBAction func buttonTapped(_ sender: Any) {
        tabBarController2 = UITabBarController()
        
        let vc1 = UIViewController()
        vc1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), tag: 0)
        vc1.view.backgroundColor = UIColor.white
        
        let vc2 = UIViewController()
        vc2.tabBarItem = UITabBarItem(title: "Chat", image: UIImage(named: "chat"), tag: 1)
        vc2.view.backgroundColor = UIColor.lightGray
        
        let vc3 = UIViewController()
        vc3.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(named: "settings"), tag: 2)
        vc3.view.backgroundColor = UIColor.black
        
        tabBarController2!.setViewControllers([vc1,vc2,vc3], animated: true)
        
        self.navigationController?.pushViewController(tabBarController2!, animated: true)
    }
    
}
