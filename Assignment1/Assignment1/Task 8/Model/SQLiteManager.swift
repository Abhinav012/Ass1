//
//  SQLiteManager.swift
//  Assignment1
//
//  Created by Thanos on 12/12/19.
//  Copyright © 2019 Thanos. All rights reserved.
//

import Foundation
import SQLite3

class SQLiteManager{
    static let shared = SQLiteManager()
    
    
    var nameArray = [String]()
    var mailArray = [String]()
    
    func getDataBasePath()-> String
    {
        let dir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let path = dir.first!
        return path+"/myDataBase.sqlite"
    }
    
    func fetchAllUsersDetails(query:String){
        var dB:OpaquePointer?
        var stmt:OpaquePointer?
        let dBPath = getDataBasePath()
        if (sqlite3_open(dBPath, &dB)==SQLITE_OK)
        {
            if (sqlite3_prepare_v2(dB!, query, -1, &stmt, nil)==SQLITE_OK){
                while(sqlite3_step(stmt!)==SQLITE_ROW)
                {
                    let mailArray1 = sqlite3_column_text(stmt!, 0)
                    let iRate  = String(cString: mailArray1!)
                    let itemName1 = sqlite3_column_text(stmt!, 1)
                    let iName  = String(cString: itemName1!)
                    
                    print(iRate)
                    print(iName)
                    nameArray.append(iName)
                    mailArray.append(iRate)
                }
            }
            else{
                print("Error in prepare v2:\(sqlite3_errmsg(stmt!))")
            }
        }
        else{
            print("Error in opening DB:\(sqlite3_errmsg(stmt!))")
        }
    }
    
    
    
    
    func executeQuery(query:String)-> Bool
    {
        var success = false
        var dB:OpaquePointer?
        var stmt:OpaquePointer?
        
        let dBPath = getDataBasePath()
        if (sqlite3_open(dBPath, &dB)==SQLITE_OK)
        {
            if (sqlite3_prepare_v2(dB, query, -1, &stmt, nil)==SQLITE_OK)
            {
                if (sqlite3_step(stmt!)==SQLITE_DONE)
                {
                    success = true
                    sqlite3_close(dB!)
                    sqlite3_finalize(stmt!)
                }
            }
            else
            {
                print("Error in prepare statement:\(sqlite3_errmsg(stmt))")
            }
        }
        else{
            print("Error in opening DB:\(sqlite3_errmsg(stmt))")
        }
        return success
        
        
    }
    
    //CREATE TABLE
    func createtable()
    {
        let createQuery = "create table if not exists Record(name text,email text)"
        let isSuccess = executeQuery(query: createQuery)
        if isSuccess
        {
            print("table creation: success")
        }
    }
    
}


