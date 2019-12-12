//
//  DataManager.swift
//  Assignment1
//
//  Created by Thanos on 12/12/19.
//  Copyright © 2019 Thanos. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DataManager{
    
    static let shared = DataManager()
    
    
    
    
//    func setup(){
//        let delegate = UIApplication.shared.delegate as! AppDelegate
//        let context = delegate.persistentContainer.viewContext
//        }
    
    func insertProductDetails(id: String, name: String, price: Double){
       
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "ProductDetails", in: context)!
        let productDetail = NSManagedObject(entity: entity, insertInto: context)
        productDetail.setValue(id, forKey: "id")
        productDetail.setValue(name, forKey: "name")
        productDetail.setValue(price, forKey: "price")
        
        do{
            try context.save()
        }catch(let error){
            print(error)
        }
    }
    
    func updateProductDetails(id: String, name: String, price: Double){
    
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        let fetchRequest : NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "ProductDetails")
        fetchRequest.predicate = NSPredicate(format: "id = %@",id)
        
        do{
            let result = try context.fetch(fetchRequest)
            
            let fetchedObject = result[0] as! NSManagedObject
            fetchedObject.setValue(name, forKey: "name")
            fetchedObject.setValue(price, forKey: "price")
            
            do{
                try context.save()
            }catch(let error){
                print(error)
            }
            
            
        }catch(let error)
        {
            print(error)
        }
    }
    
    func fetchAllProductsDetail(){
        
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        let fetchRequest : NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "ProductDetails")
        do{
            let result = try context.fetch(fetchRequest)
            for fetchedObject in result as! [NSManagedObject]
            {
                print(fetchedObject.value(forKey: "id") as! String)
                print(fetchedObject.value(forKey: "name") as! String)
                print(fetchedObject.value(forKey: "price") as! Double)
            }
            
            
        }catch(let error)
        {
            print(error)
        }
    }
    
    func deleteProductDetails(id: String){
        
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        let fetchRequest : NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "ProductDetails")
        fetchRequest.predicate = NSPredicate(format: "id = %@",id)
        
        do{
            let result = try context.fetch(fetchRequest)
            
            let fetchedObject = result[0] as! NSManagedObject
            context.delete(fetchedObject)
            do{
                try context.save()
            }catch(let error){
                print(error)
            }
            
            
        }catch(let error)
        {
            print(error)
        }
    }
    
    
}
