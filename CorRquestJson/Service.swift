//
//  Service.swift
//  Color
//
//  Created by Ronilson on 22/03/17.
//  Copyright © 2017 Ronilson. All rights reserved.
//

import Foundation

import Just

enum Result<T> {
    
    case success(result: T)
    case failure(error: Int, message: String)
}

class Service: Requesting, ColorUrl {
    
    static let sharedInstance = Service()
    
    func APIRequest(method: HTTPMethod, endPoint: RequestType, success: @escaping (Any) -> Void, failure: @escaping (Int) -> Void) {
        
        let url = getUrl(endPoint)
        
        switch method {
        case .GET :
            
            getTo(url: url, success: {
                result in
                success(result)
            }, failure: {
                status in
                failure(status)
            })
            
        default: print("HTTPMethod not supported")
        }
    }
    
    func APIRequestImage(url: String, success: @escaping (Any) -> Void, failure: @escaping (Int) -> Void)  {
        
        Just.get(url) {
            r in
            
            if r.ok {
                
                guard let response = r.content else {
                    print("no content")
                    return
                }
                
                Do.now {
                    success(response)
                }
            }
            else {
                
                guard let code = r.statusCode else {
                    print("failure without statusCode")
                    return
                }
                
                Do.now {
                    failure(code)
                }
            }
        }
    }
    
    private func getTo(url: String, success: @escaping (Any) -> Void, failure: @escaping (Int) -> Void) {
        
        Just.get(url) {
            r in
            
            if r.ok {
                
                guard let response = r.json else {
                    print("no json")
                    return
                }
                
                Do.now {
                    success(response)
                }
            }
            else {
                
                guard let code = r.statusCode else {
                    print("failure without statusCode")
                    return
                }
                
                Do.now {
                    failure(code)
                }
            }
        }
    }
}
