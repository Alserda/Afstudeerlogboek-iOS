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
    static let baseURLString = "http://localhost:3000"
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