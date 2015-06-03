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
let moveFireballBig = move()
let moveBiteCow = move()
let moveBitePig = move()
let movePeck = move()
let moveFlap = move()
let moveScrub = move()
let moveGetShockedBuddy = move()

func loadMoves()
{
    movePunch.moveName = "Punch!"
    movePunch.physdmg = 30.0
    movePunch.moveHitChance = 90
    movePunch.image = UIImage(named:"punch") as UIImage?
    movePunch.manaCost = 0.0
    
    moveKick.moveName = "Kick!"
    moveKick.physdmg = 40.0
    moveKick.moveHitChance = 65
    moveKick.image = UIImage(named:"kick") as UIImage?
    moveKick.manaCost = 20.0
    
    moveShock.moveName = "Shock!"
    moveShock.magicdmg = 60.0
    moveShock.moveHitChance = 65
    moveShock.image = UIImage(named:"shock") as UIImage?
    moveShock.manaCost = 40.0
    
    moveFireball.moveName = "Fireball!"
    moveFireball.magicdmg = 40
    moveFireball.moveHitChance = 85
    moveFireball.image = UIImage(named:"fire") as UIImage?
    moveFireball.manaCost = 30
    
    moveBiteCow.moveName = "Bite"
    moveBiteCow.physdmg = 30
    moveBiteCow.moveHitChance = 80
    moveBiteCow.image = UIImage(named:"punch") as UIImage?
    moveBiteCow.manaCost = 30.0
    
    moveFireballBig.moveName = "Bigger Fireball!"
    moveFireballBig.magicdmg = 60.0
    moveFireballBig.moveHitChance = 80
    moveFireballBig.image = UIImage(named:"fire") as UIImage?
    
    moveGetShockedBuddy.moveName = "Bigger Shock!"
    moveGetShockedBuddy.magicdmg = 90
    moveGetShockedBuddy.moveHitChance = 50
    moveGetShockedBuddy.image = UIImage(named:"shock") as UIImage?
    
    moveBitePig.moveName = "Bite!"
    moveBitePig.physdmg = 50
    moveBitePig.moveHitChance = 70
    moveBitePig.image = UIImage(named:"punch") as UIImage?
    
    movePeck.moveName = "Peck!"
    movePeck.physdmg = 90
    movePeck.moveHitChance = 50
    movePeck.image = UIImage(named:"punch") as UIImage?
    
    moveScrub.moveName = "scrub"
    moveScrub.moveHitChance = 100
    
    
}

var enemies = Array<player>()
var sheep = player()

func reloadEnemyData()
{
    sheep.mp = sheep.mana
    sheep.hp = sheep.vtl
    for enemy in enemies
    {
        enemy.hp = enemy.vtl
    }
    
}

func loadEnemies()
{
    sheep.name = "Sheep"
    sheep.vtl = 250
    sheep.hp = 250
    sheep.mana = 100
    sheep.mp = 100
    sheep.mdmgrst = 5
    sheep.pdmgrst = 2
    sheep.image = UIImage(named:"sheep") as UIImage?
    sheep.moves.append(movePunch)
    sheep.moves.append(moveKick)
    sheep.moves.append(moveShock)
    sheep.moves.append(moveFireball)

    
    var enemy1 = player()
    enemy1.vtl = 200
    enemy1.hp = 200
    enemy1.name = "Bessy"
    enemy1.mdmgrst = 10
    enemy1.pdmgrst = 10
    enemy1.image = UIImage(named:"cow") as UIImage?
    enemy1.moves.append(moveBiteCow)
    enemy1.moves.append(moveKick)
    enemy1.moves.append(moveFireball)
    enemy1.moves.append(moveScrub)
    enemies.append(enemy1)
    
    var enemy2 = player()
    enemy2.vtl = 150
    enemy2.hp = 150
    enemy2.name = "Thomas"
    enemy2.mdmgrst = 5
    enemy2.pdmgrst = 5
    enemy2.image = UIImage(named:"pig") as UIImage?
    enemy2.moves.append(moveBitePig)
    enemy2.moves.append(moveKick)
    enemy2.moves.append(moveGetShockedBuddy)
    enemy2.moves.append(moveScrub)
    enemies.append(enemy2)
    
    var enemy3 = player()
    enemy3.vtl = 5
    enemy3.hp = 5
    enemy3.name = "Mistah Goose"
    enemy3.mdmgrst = 5
    enemy3.pdmgrst = 2
    enemy3.image = UIImage(named:"goose") as UIImage?
    enemy3.moves.append(movePeck)
    enemy3.moves.append(moveKick)
    enemy3.moves.append(moveGetShockedBuddy)
    enemy3.moves.append(moveFireballBig)
    enemies.append(enemy3)

}




