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
    internal init() {}
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
    var hp: Double!
   
    
}
class moveset
{
    var magicdmg: Double!
    var physdmg: Double!
    var moveName: String!
    var moveHitChance: Int!
    var moveID: Int!
    
    var move1 = moveset.self
    var move2 = moveset.self
    var move3 = moveset.self
    var move4 = moveset.self
}

let moveMasterClass = moveset()

let movePunch = moveset()
let moveKick = moveset()
let moveShock = moveset()
let moveFireball = moveset()
let mc = player()
let monster = player()

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
    
    var MoveSetArray : [moveset] = []
    
    MoveSetArray.append(movePunch)
    MoveSetArray.append(moveKick)
    MoveSetArray.append(moveShock)
    MoveSetArray.append(moveFireball)
   
    
}
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

func dmgcalc(ent: player, ent2: player, move: moveset)
{
    var mdmg = (100 - ent.mdmgrst)/100 * move.magicdmg
    var pdmg = (100 - ent.pdmgrst)/100 * move.physdmg
    var dmgtot = mdmg + pdmg
    var dmgfinal = ent.vtl - dmgtot
    
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
    mc.pdmgrst = 1.0
    mc.mdmgrst = 1.0
    mc.vtl = 100
    MoveSetBox()
    dmgcalc(mc, monster, movePunch)
}

