//
//  Database.swift
//  SAAAAA
//
//  Created by Peter Alserda on 08/03/16.
//  Copyright © 2016 Peter Alserda. All rights reserved.
//

import Foundation
import RealmSwift
import SwiftyJSON

class Post: Object {
    dynamic var id: Int = 0
    dynamic var body: String = ""
    dynamic var date: String = ""
    dynamic var author: String = ""
    dynamic var color: String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}



class StorageManager {
    static let sharedInstance = StorageManager()
    let realm = try! Realm()
    
    func clearPosts(success: (Bool) -> ()) -> Void {
        try! realm.write({ () -> Void in
            realm.delete(realm.objects(Post))
            success(true)
        })
    }
    
    func storePost(with post: JSON, success: (Bool) -> ()) -> Void {
        let newPost = Post()
        newPost.id = post["post"]["id"].intValue
        newPost.body = post["post"]["body"].stringValue
        newPost.date = post["post"]["date"].stringValue
        newPost.author = post["post"]["author"]["title"].stringValue
        newPost.color = post["post"]["author"]["color"].stringValue
        
        try! realm.write({ () -> Void in
            realm.create(Post.self, value: newPost, update: true)
            success(true)
        })
    }

    func storePosts(with posts: JSON, success: (Bool) -> ()) -> Void {
        var counter: Int = 0
        for (_, post) in posts["posts"] {
            let newPost = Post()
            newPost.id = post["id"].intValue
            newPost.body = post["body"].stringValue
            newPost.date = post["date"].stringValue
            newPost.author = post["author"]["title"].stringValue
            newPost.color = post["author"]["color"].stringValue

            try! realm.write({ () -> Void in
                realm.create(Post.self, value: newPost, update: true)
            })
            
            counter += 1
            if (counter == posts["posts"].count) {
                success(true)
            }
        }
    }
}