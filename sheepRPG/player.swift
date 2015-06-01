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
    

    class moveset
    {
        var magicdmg: Double!
        var physdmg: Double!
        var moveName: String!
        var moveHitChance: Int!
    }

}

let movePunch = player.moveset()
let moveKick = player.moveset()
let moveShock = player.moveset()
let moveFireball = player.moveset()
let mc = player()


let monster = player()

func MoveSetBox()
{
    movePunch.moveName = "Punch!"
    movePunch.physdmg = 55.0
    movePunch.magicdmg = 0.0
    movePunch.moveHitChance = 80
    
    moveKick.moveName = "Kick!"
    moveKick.physdmg = 60.0
    moveKick.magicdmg = 0.0
    moveKick.moveHitChance = 65
    
    moveShock.moveName = "Shock!"
    moveShock.physdmg = 0.0
    moveShock.magicdmg = 50.0
    moveShock.moveHitChance = 65
    
    moveFireball.moveName = "Fireball!"
    moveFireball.physdmg = 0.0
    moveFireball.magicdmg = 40.0
    moveFireball.moveHitChance = 80
    
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

func dmgcalc(ent: player, ent2: player, move: player.moveset)
{
    var mdmg = (100 - ent.mdmgrst)/100 * move.magicdmg
    var pdmg = (100 - ent.pdmgrst)/100 * move.physdmg
    var dmgtot = mdmg + pdmg
    var dmgfinal = ent.vtl - dmgtot
    
    println("PLAYER HEALTH IS")
    println(ent.vtl)
    
    if(hitchance(move.moveHitChance) == true)
    {
        println("THE MOVE HITS")
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
    mc.vtl = 50
    MoveSetBox()
    dmgcalc(mc, monster, movePunch)

}