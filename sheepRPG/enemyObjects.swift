//
//  enemyObjects.swift
//  sheepRPG
//
//  Created by Ellis Saupe on 6/1/15.
//  Copyright (c) 2015 xterm. All rights reserved.
//

import Foundation
import UIKit
let goblin = player()
let mc = player()

var enemies = Array<player>()
var sheep = player()
func loadEnemies()
{
    sheep.vtl = 100
    sheep.hp = 65
    sheep.lvl = 1
    sheep.mdmgrst = 5
    sheep.pdmgrst = 2
    sheep.image = UIImage(named:"sheep") as UIImage?
    
    var enemy1 = player()
    enemy1.vtl = 100
    enemy1.hp = 67
    enemy1.lvl = 2
    enemy1.mdmgrst = 5
    enemy1.pdmgrst = 2
    enemy1.image = UIImage(named:"red") as UIImage?
    enemies.append(enemy1)
}


