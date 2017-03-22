//
//  CoresService.swift
//  Color
//
//  Created by Ronilson on 22/03/17.
//  Copyright © 2017 Ronilson. All rights reserved.
//


import SwiftyJSON

struct CoresService {
    
    func coresService(json: JSON) -> [Cor] {
        
        var cores = [Cor]()
        
        for (_, cor) in json {
            
            let cor = parseCor(json: cor)
            
            cores.append(cor)
        }
        
        return cores
    }
    
    func parseCor(json: JSON) -> Cor {
        
        let id = json["id"].stringValue
        let cor = json["cor"].stringValue
        
        let cores = Cor(id: id, cor: cor)
        
        return cores
    }
}


