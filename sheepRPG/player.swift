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
    var name: String!
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
    var moves: [move] = []
    
    //graphics
    var imageView = UIImageView()
    var healthContainer = UIView()
    var healthBar = UIView()
    var healthText = UILabel()
    

    func buildViews(width: CGFloat, height: CGFloat, sheep:Bool)
    {
        var x = width-205
        if sheep == true
        {
            x = 5
        }
        imageView.image = image!
        imageView.frame = CGRectMake(x, height-165, 200, 160)
        
        
    }
    
    func buildHealthBars(height: CGFloat)
    {
        healthContainer.backgroundColor = UIColor.blackColor()
        healthContainer.layer.cornerRadius = 8
        healthContainer.frame = CGRectMake(imageView.frame.origin.x, height-190, 200, 20)
        
        var color = UIColor.redColor()
        if imageView.frame.origin.x == 5
        {
            color = UIColor.greenColor()
        }
        healthBar.backgroundColor = color
        healthBar.layer.cornerRadius = 8
        healthBar.frame = CGRectMake(imageView.frame.origin.x, height-190, 200*CGFloat(hp/vtl), 20)
        
        healthText.textColor = UIColor.whiteColor()
        healthText.textAlignment = NSTextAlignment.Center
        healthText.text = toString(hp) + "/" + toString(vtl)
        healthText.frame = CGRectMake(imageView.frame.origin.x, height-190, 200, 20)
    }
}

class move
{
    internal init() {}
    var magicdmg: Double!
    var physdmg: Double!
    var moveName: String!
    var moveHitChance: Int!
    var moveID: Int!
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

func initialize()
{
    loadEnemies()
    loadMoves()
    
    mc.vtl = 100.0
    mc.pdmgrst = 25.0
    mc.mdmgrst = 20.0
    
    goblin.vtl = 100.0
    goblin.pdmgrst = 26.0
    goblin.mdmgrst = 25.0
    
    //dmgcalc(mc, goblin, MoveSetArray[0])
}

