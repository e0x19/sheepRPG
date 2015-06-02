//
//  player.swift
//  sheepRPG
//
//  Created by Ben Simon on 5/29/15.
//  Copyright (c) 2015 xterm. All rights reserved.
//

import Foundation
import UIKit


class player
{
    public init() {}
    var xCord: CGFloat!
    var yCord: CGFloat!
    var size: Double!
    var lvl: Double!
    var vtl: Double!
    var dfns: Double!
    var spd: Double!
    var pdmgrst: Double!
    var mdmgrst: Double!
    var xp: Double!
    var hitchance: Double!
    var image: UIImage?
    var magicdmg: Double!
    var physdmg: Double!
    var moveName: String!
    var moveHitChance: Int!
    var moveID: Int!
    var entMoveArray: [player] = []
}
var MoveSetArray : [player] = []
func MoveSetBox()
{
    movePunch.moveName = "Punch!"
    movePunch.physdmg = 55.0
    movePunch.magicdmg = 0.0
    movePunch.moveHitChance = 80
    movePunch.moveID = 1
    
    moveKick.moveName = "Kick!"
    moveKick.physdmg = 60.0
    moveKick.magicdmg = 0.0
    moveKick.moveHitChance = 65
    moveKick.moveID = 2
    
    moveShock.moveName = "Shock!"
    moveShock.physdmg = 0.0
    moveShock.magicdmg = 50.0
    moveShock.moveHitChance = 65
    moveShock.moveID = 3
    
    moveFireball.moveName = "Fireball!"
    moveFireball.physdmg = 0.0
    moveFireball.magicdmg = 40.0
    moveFireball.moveHitChance = 80
    moveFireball.moveID = 4
    
    MoveSetArray.append(movePunch)
    MoveSetArray.append(moveKick)
    MoveSetArray.append(moveShock)
    MoveSetArray.append(moveFireball)
}

let movePunch = player()
let moveKick = player()
let moveShock = player()
let moveFireball = player()

func hitchance(hit: Int!) -> Bool
{
    var randGen = Int(arc4random_uniform(101))
    if randGen <= hit
    {
        return true
    }
    else
    {
    return false
    }
}

func dmgcalc(ent: player, ent2: player, move: player)
{
    var mdmg = (100 - ent.mdmgrst)/100 * move.magicdmg
    var pdmg = (100 - ent.pdmgrst)/100 * move.physdmg
    var dmgtot = mdmg + pdmg
    var dmgfinal: Double! = ent.vtl - dmgtot
    
    if(hitchance(move.moveHitChance) == true)
    {
        println("THE MOVE HITS")
        println("PLAYER HEALTH IS")
        println(dmgfinal)
    }
    else
    {
        println("THE MOVE DOES NOT HIT")
    }
}

func initialize()
{
    mc.vtl = 100.0
    mc.pdmgrst = 25.0
    mc.mdmgrst = 20.0
    
    goblin.vtl = 100.0
    goblin.pdmgrst = 26.0
    goblin.mdmgrst = 25.0

    MoveSetBox()
    
    dmgcalc(mc, goblin, MoveSetArray[0])
}

