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
    var xCord: CGFloat!
    var yCord: CGFloat!
    var size: Double!
    var lvl: Double!
    var vtl: Double!
    var armr: Double!
    var dfns: Double!
    var matk: Double!
    var patk: Double!
    var spd: Double!
    var pdmgrst: Double!
    var mdmgrst: Double!
    var pdfns: Double!
    var mdfns: Double!
    
    func dmgcalc(ent: player, mdmg: Double, pdmg: Double, dmgflat: Double) -> Double
    {
        var pdm = ent.pdmgrst - pdmg
        var mdm = ent.mdmgrst - mdmg
        var dmgtot: Double!
        var dmgfin: Double!
    
        
        
        return ent.vtl - dmgtot
    }
}


func initialize()
{
    var mc = player()
    mc.pdmgrst = 26.0
    mc.mdmgrst = 27.6
    mc.vtl = 500.0
    
    mc.dmgcalc(mc, mdmg: 50, pdmg: 60, dmgflat: 59)
    println(mc.vtl)
}