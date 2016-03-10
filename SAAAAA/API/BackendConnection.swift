//
//  Backend.swift
//  SAAAAA
//
//  Created by Peter Alserda on 08/03/16.
//  Copyright © 2016 Peter Alserda. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

enum Router: URLRequestConvertible {
//    static let baseURLString = "http://localhost:3000"
    static let baseURLString = "http://ancient-tundra-37609.herokuapp.com"
    static var OAuthToken: String?
    
    case FetchLogposts
    case CreateLogpost([String: AnyObject])
    
    var method: Alamofire.Method {
        switch self {
        case .FetchLogposts:
            return .GET
        case .CreateLogpost:
            return .POST
        }
    }
    
    var path: String {
        switch self {
        case .FetchLogposts:
            return "/posts"
        case .CreateLogpost:
            return "/posts"
        }
    }
    
    var URLRequest: NSMutableURLRequest {
        let URL = NSURL(string: Router.baseURLString)!
        let mutableURLRequest = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(path))
        mutableURLRequest.HTTPMethod = method.rawValue
        
        if let token = Router.OAuthToken {
            mutableURLRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        switch self {
        case .CreateLogpost(let parameters):
            return Alamofire.ParameterEncoding.JSON.encode(mutableURLRequest, parameters: parameters).0
        default:
            return mutableURLRequest
        }
    }
}

class BackendConnection {
    static let sharedInstance = BackendConnection()
    
    func createLogpost(date date: String, body: String, author: String, success: (response: JSON) -> (), failed: (error: NSError) -> ()) -> Void {
        let parameters = [
            "post": [
                "date": date,
                "body": body,
                "author": author
                
            ]
        ]

        Alamofire.request(Router.CreateLogpost(parameters)).responseJSON { (response) -> Void in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value);
                    
                    success(response: json)
                }
            case .Failure(let error):
                failed(error: error)
            }
        }
    }
    
    func fetchLogposts(success: (response: JSON) -> (), failed: (error: NSError) -> ()) -> Void {
        Alamofire.request(Router.FetchLogposts).responseJSON { (response) -> Void in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value);
                    
                    success(response: json)
                }
            case .Failure(let error):
                failed(error: error)
            }
        }
    }
    
}