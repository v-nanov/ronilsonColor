//
//  CorService.swift
//  Color
//
//  Created by Ronilson on 22/03/17.
//  Copyright © 2017 Ronilson. All rights reserved.
//

import UIKit
import SwiftyJSON

class CorService {
    
    func getApplication(parameters: [String: Any]? = nil, success: @escaping (_ cor: [CoresSction]) -> Void, fail: @escaping (_ error: String) -> Void) {
        
        Service.sharedInstance.APIRequest(method: .GET, endPoint: .corUrl,
                                          
                                          success: { result in
                                            
                                            success(self.parseCores(json: JSON(result)))
                                            
        }, failure: { failure in
            
            fail("Não foi possível carregar as cores.")
        }
        )
    }
    
    fileprivate func parseCores(json: JSON) -> [CoresSction] {
        
        var cores = [CoresSction]()
        
        for (_, cor) in json {
            
            let cor = parseCor(json: cor)
            
            cores.append(cor)
        }
        
        return cores
    }
    
    fileprivate func parseCor(json: JSON) -> CoresSction {
        
        let coresService = CoresService()
        
        let id = json["id"].intValue
        let coresTitles = json["coresTitles"].stringValue
        
        var cor = CoresSction(id: id, coresTitle: coresTitles)
        cor.cores = coresService.coresService(json: json["cores"])
        return cor
    }
}
