//
//  ColorUrl.swift
//  Color
//
//  Created by Ronilson on 22/03/17.
//  Copyright © 2017 Ronilson. All rights reserved.
//

import Foundation

protocol ColorUrl { }

extension ColorUrl {
    
    func getUrl(_ type: RequestType) -> String {
        
        return type.rawValue
    }
}

enum RequestType: String {
    
    case corUrl = "https://private-ec4102-colorapi1.apiary-mock.com/color"
    
}
