//
//  movement.swift
//  sheepRPG
//
//  Created by Ellis Saupe on 6/1/15.
//  Copyright (c) 2015 xterm. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit

class map
{
    public init(){}

    var tiles = [Int](count:100, repeatedValue: 1)
    
    func buildArray()
    {
        //randomized, should reference preset maps.
        var i = 0
        while i < 100
        {
            tiles[i] = Int(arc4random_uniform(3)) + 1
            i += 1
        }
    }
    
    
}

class playerMove
{
    var
}