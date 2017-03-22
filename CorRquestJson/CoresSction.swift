//
//  Cores.swift
//  Color
//
//  Created by Ronilson on 22/03/17.
//  Copyright © 2017 Ronilson. All rights reserved.
//

import Foundation

struct CoresSction{
    
    var id : Int
    var coresTitle = String()
    var cores = [Cor]()
    
    init(id : Int, coresTitle: String) {
        
        self.id = id
        self.coresTitle = coresTitle
    }
}
