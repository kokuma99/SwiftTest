//
//  SqlUtils.swift
//  Test1026
//
//  Created by kokuma on 2016/12/9.
//  Copyright © 2016年 kokuma. All rights reserved.
//

import Foundation

import SQLite


// 文件路径
let path = NSSearchPathForDirectoriesInDomains(
    .DocumentDirectory, .UserDomainMask, true
    ).first!

// 数据库文件
var db: Connection? ;

// 获取链接（不存在文件，则自动创建）
 func GetConnection() ->Int
{
    do{
        db =  try Connection("\(path)/db.sqlite")
        
    }catch _{
        return 0;
        
    }
    return 1;
}


// 创建 ZUSER 表
private func CreateTable_USER()
{
    GetConnection();
    let ZUSER = Table("ZUSER")
    let id = Expression<Int64>("id")
    let username = Expression<String?>("username")
    let password = Expression<String?>("password")
    do
    {
        try db!.run(ZUSER.create(ifNotExists: true) { t in     // CREATE TABLE "users" (
            t.column(id, primaryKey: true) //     "id" INTEGER PRIMARY KEY NOT NULL,
            t.column(username, unique: true)  //     "email" TEXT UNIQUE NOT NULL,
            t.column(password, unique: true) })
        //
    }catch _{
        //
    }
}

// 创建表
func CreateTable()
{
    print("\(path)")
    
    CreateTable_USER();
}



func test_db(){
    do{
        let db = try Connection("path/to/db.sqlite3")
        let users = Table("users")
        let id = Expression<Int64>("id")
        let name = Expression<String?>("name")
        let email = Expression<String>("email")
        
        try db.run(users.create { t in
            t.column(id, primaryKey: true)
            t.column(name)
            t.column(email, unique: true)
            })
        // CREATE TABLE "users" (
        //     "id" INTEGER PRIMARY KEY NOT NULL,
        //     "name" TEXT,
        //     "email" TEXT NOT NULL UNIQUE
        // )
        
        let insert = users.insert(name <- "Alice", email <- "alice@mac.com")
        let rowid = try db.run(insert)
        // INSERT INTO "users" ("name", "email") VALUES ('Alice', 'alice@mac.com')
        
        for user in try db.prepare(users) {
            print("id: \(user[id]), name: \(user[name]), email: \(user[email])")
            // id: 1, name: Optional("Alice"), email: alice@mac.com
        }
        // SELECT * FROM "users"
        
        let alice = users.filter(id == rowid)
        
        try db.run(alice.update(email <- email.replace("mac.com", with: "me.com")))
        // UPDATE "users" SET "email" = replace("email", 'mac.com', 'me.com')
        // WHERE ("id" = 1)
        
        try db.run(alice.delete())
        // DELETE FROM "users" WHERE ("id" = 1)
        
       try db.scalar(users.count) // 0
        // SELECT count(*) FROM "users"
        
        
    }catch{
        // handle error
    }
    
}