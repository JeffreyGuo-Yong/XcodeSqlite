//
//  ViewController.swift
//  TestSqlite_3
//
//  Created by 郭勇 on 22/8/20.
//  Copyright © 2020 郭勇. All rights reserved.
//

import UIKit
import SQLite

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let path = NSSearchPathForDirectoriesInDomains(
            .documentDirectory,
            .userDomainMask,
            true
        ).first!
        
        let database = CreateTable()
        
        if(!database.checkDatabaseFile()){
            if(database.createDatabaseFile() && database.createTables()){
                print("Create database success. Database file address: \(path)/database.sqlite3")
            }else{
                print("Create databse failed")
            }
        }else{
            print("Database existed. Database file address: \(path)/database.sqlite3")
        }
        
    }


}

