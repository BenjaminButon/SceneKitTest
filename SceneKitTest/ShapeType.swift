//
//  ShapeType.swift
//  SceneKitTest
//
//  Created by Benko Ostap on 05.06.18.
//  Copyright © 2018 Ostap Benko. All rights reserved.
//

import Foundation

enum ShapeType: Int{
    case box = 0
    case sphere
    case pyramid
    case torus
    case capsule
    case cylinder
    case cone
    case tube
    
    
    static func random() -> ShapeType{
        let maxValue = tube.rawValue
        let rand = arc4random_uniform(UInt32(maxValue))
        return ShapeType(rawValue: Int(rand))!
    }
}
