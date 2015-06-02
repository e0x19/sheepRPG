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

let movePunch = move()
let moveKick = move()
let moveShock = move()
let moveFireball = move()
func loadMoves()
{
    movePunch.moveName = "Punch!"
    movePunch.physdmg = 55.0
    movePunch.magicdmg = 0.0
    movePunch.moveHitChance = 80
    movePunch.moveID = 1
    movePunch.image = UIImage(named:"punch") as UIImage?
    
    moveKick.moveName = "Kick!"
    moveKick.physdmg = 60.0
    moveKick.magicdmg = 0.0
    moveKick.moveHitChance = 65
    moveKick.moveID = 2
    moveKick.image = UIImage(named:"kick") as UIImage?
    
    moveShock.moveName = "Shock!"
    moveShock.physdmg = 0.0
    moveShock.magicdmg = 50.0
    moveShock.moveHitChance = 65
    moveShock.moveID = 3
    moveShock.image = UIImage(named:"shock") as UIImage?
    
    moveFireball.moveName = "Fireball!"
    moveFireball.physdmg = 0.0
    moveFireball.magicdmg = 40.0
    moveFireball.moveHitChance = 80
    moveFireball.moveID = 4
    moveFireball.image = UIImage(named:"fire") as UIImage?
}

var enemies = Array<player>()
var sheep = player()
func loadEnemies()
{
    sheep.name = "Sheep"
    sheep.vtl = 500
    sheep.hp = 500
    sheep.lvl = 1
    sheep.mdmgrst = 5
    sheep.pdmgrst = 2
    sheep.image = UIImage(named:"sheep") as UIImage?
    sheep.moves.append(movePunch)
    sheep.moves.append(moveKick)
    sheep.moves.append(moveShock)
    sheep.moves.append(moveFireball)

    
    var enemy1 = player()
    enemy1.vtl = 500
    enemy1.hp = 500
    enemy1.name = "Steve"
    enemy1.lvl = 2
    enemy1.mdmgrst = 5
    enemy1.pdmgrst = 2
    enemy1.image = UIImage(named:"red") as UIImage?
    enemy1.moves.append(movePunch)
    enemy1.moves.append(moveKick)
    enemy1.moves.append(moveShock)
    enemy1.moves.append(moveFireball)
    enemies.append(enemy1)
}

//var MoveSetArray : [move] = []



