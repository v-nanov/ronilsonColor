//
//  Do.swift
//  Color
//
//  Created by Ronilson on 22/03/17.
//  Copyright © 2017 Ronilson. All rights reserved.
//

import Foundation

struct Do {
    
    static func wait(seconds: Double, completion: @escaping () -> Void) {
        
        let time = DispatchTime.now() + seconds
        
        DispatchQueue.main.asyncAfter(deadline: time) {
            
            completion()
        }
    }
    
    static func now(completion: @escaping () -> Void) {
        
        DispatchQueue.main.async {
            
            completion()
        }
    }
}
