//
//  CreateTables.swift
//  TestSqlite_3
//
//  Created by 郭勇 on 22/8/20.
//  Copyright © 2020 郭勇. All rights reserved.
//

import Foundation
import SQLite

class CreateTable{
    
    // get the document path
    let path = NSSearchPathForDirectoriesInDomains(
        .documentDirectory,
        .userDomainMask,
        true
    ).first!
    
    // check does database exist?
    func checkDatabaseFile() -> Bool {
        return FileManager.default.fileExists(atPath: "\(path)/database.sqlite3")
    }
    
    // create database file
    func createDatabaseFile() -> Bool {
       do{
            _ = try Connection("\(path)/database.sqlite3")
            return true
        } catch {
            return false
        }
    }
    
    func createTables() -> Bool {
        do{
            // get databse connection
            let database = try Connection("\(path)/database.sqlite3")
            
            // create tables
            let ledgers = Table("ledgers")
            let bills = Table("bills")
            let units = Table("units")
            let budgets = Table("budgets")
            let categories = Table("categories")
            let subcategories = Table("subcategories")
            
            // create columns
            let id = Expression<Int>("id")
            let name = Expression<String>("name")
            let create_at = Expression<Date>("create_at")
            let customers_id = Expression<Int>("customers_id")
            
            let categories_id = Expression<Int>("categories_id")
            
            let symbol = Expression<String>("symbol")
            
            let units_id = Expression<Int>("units_id")
            
            let title = Expression<String>("title")
            let amount = Expression<Double>("amount")
            let description = Expression<String>("description")
            let type = Expression<Int>("type")
            let subcategories_id = Expression<Int>("subcategories_id")
            
            // create ledgers table
            try database.run(ledgers.create(ifNotExists: true) { t in
                t.column(id, primaryKey: .autoincrement)
                t.column(name)
                t.column(create_at)
                t.column(customers_id)
            })
            
            // create categories table
            try database.run(categories.create(ifNotExists: true) { t in
                t.column(id, primaryKey: .autoincrement)
                t.column(name)
                t.column(create_at)
            })
            
            // create subcategories table
            try database.run(categories.create(ifNotExists: true) { t in
                t.column(id, primaryKey: .autoincrement)
                t.column(name)
                t.column(create_at)
                t.column(categories_id)
                t.foreignKey(categories_id, references: categories, id, delete: .setNull)
            })
            
            // create units table
            try database.run(units.create(ifNotExists: true) { t in
                t.column(id, primaryKey: .autoincrement)
                t.column(name)
                t.column(symbol)
                t.column(create_at)
            })
            
            // create budgets table
            try database.run(budgets.create(ifNotExists: true) { t in
                t.column(id, primaryKey: .autoincrement)
                t.column(amount)
                t.column(create_at)
                t.column(units_id)
                t.foreignKey(units_id, references: units, id, delete: .setNull)
            })
            
            // create bills table
            try database.run(bills.create(ifNotExists: true) { t in
                t.column(id, primaryKey: .autoincrement)
                t.column(title)
                t.column(amount)
                t.column(description)
                t.column(type)
                t.column(create_at)
                t.column(units_id)
                t.column(categories_id)
                t.column(subcategories_id)
                t.foreignKey(units_id, references: units, id, delete: .setNull)
                t.foreignKey(categories_id, references: categories, id, delete: .setNull)
                t.foreignKey(subcategories_id, references: subcategories, id, delete: .setNull)
            })
            
            return true
        } catch {
            return false
        }
    }
    
    
    
}
