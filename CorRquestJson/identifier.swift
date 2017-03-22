//
//  identifier.swift
//  Color
//
//  Created by Ronilson on 22/03/17.
//  Copyright © 2017 Ronilson. All rights reserved.
//

import UIKit

protocol Identifying { }

extension Identifying where Self : NSObject {
    
    static var identifier: String { return String(describing: self) }
}

extension NSObject: Identifying { }
