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
    var coresSction = String()
    var valor = String()
    var cores = [Cor]()
    
    init(id : Int, coresSction: String, valor: String) {
        
        self.id = id
        self.coresSction = coresSction
        self.valor = valor
    }
}
