//
//  Requesting.swift
//  Color
//
//  Created by Ronilson on 22/03/17.
//  Copyright © 2017 Ronilson. All rights reserved.
//

import Just


protocol Requesting {
    
    func APIRequest(method: HTTPMethod, endPoint: RequestType, success: @escaping (Any) -> Void, failure: @escaping (Int) -> Void)
}
