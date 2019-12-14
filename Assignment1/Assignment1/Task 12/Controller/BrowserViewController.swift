//
//  BrowserViewController.swift
//  Assignment1
//
//  Created by Thanos on 13/12/19.
//  Copyright © 2019 Thanos. All rights reserved.
//

import UIKit
import WebKit
import SWRevealViewController

class BrowserViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    @IBOutlet weak var contentView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
      urlTextField.delegate = self
      contentView.navigationDelegate = self
      contentView.allowsBackForwardNavigationGestures = true
        
        self.contentView.addObserver(self, forKeyPath: "URL", options: .new, context: nil)
        self.contentView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
    
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }

    }
    

    @IBAction func backButtonTapped(_ sender: Any) {

         contentView.goBack()

    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
         contentView.goForward()
    }
    
    @IBAction func refreshButtonTapped(_ sender: Any) {
        
        contentView.reload()
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if keyPath == #keyPath(WKWebView.url){
            print("### URL",self.contentView.url!)
        }
        
        if keyPath == #keyPath(WKWebView.estimatedProgress){
            print("### EP", self.contentView.estimatedProgress)
        }
    }
    
    
}

extension BrowserViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if let urlTxt = urlTextField.text{
               let url = URL(string: urlTxt)

               if let url = url{
                         loadURL(url: url)
                }
               urlTextField.resignFirstResponder()
        }
        
        
        return true
    }
    
    func loadURL(url: URL){
        let urlRequest = URLRequest(url: url)
        contentView.load(urlRequest)
       
    }
    
}
