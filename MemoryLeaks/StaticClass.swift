//
//  StaticClass.swift
//  MemoryLeaks
//
//  Created by Ali Akhtar on 27/04/2019.
//  Copyright © 2019 Ali Akhtar. All rights reserved.
//

import Foundation

class StaticClass {

    
    static func someStaticMethod(_ valuePass: Int,compeltion: @escaping (Int) -> Void) {
        compeltion(valuePass)
    }
}
