//
//  ColloectionViewExViewController.swift
//  Assignment1
//
//  Created by Thanos on 14/12/19.
//  Copyright © 2019 Thanos. All rights reserved.
//

import UIKit
import SWRevealViewController

class CollectionViewExViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    var restaurantArr = ["alto_vino", "chingari", "coriander_kitchen", "kangan", "shabree"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
  }
    
}

extension CollectionViewExViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sampleCell", for: indexPath) as! SampleCollectionViewCell
        cell.vendorImageView.image = UIImage(named: restaurantArr[indexPath.row])
        cell.vendorName.text = restaurantArr[indexPath.row].capitalized.replacingOccurrences(of: "_", with: " ")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      
        return CGSize(width: self.view.frame.width, height: 206)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.layer.cornerRadius = 5
    }
    
}
