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
    var name: String!
    var vtl: Double!
    var pdmgrst: Double!
    var mdmgrst: Double!
    var hitchance: Double!
    var image: UIImage?
    var hp: Double!
    var mana: Double!
    var mp: Double!
    var moves: [move] = []
    
    //graphics
    var imageView = UIImageView()
    var healthContainer = UIView()
    var healthBar = UIView()
    var healthText = UILabel()
    var manaContainer = UIView()
    var manaBar = UIView()
    var manaText = UILabel()
    

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
        healthContainer.frame = CGRectMake(imageView.frame.origin.x, height-202, 200, 20)
        
        var color = UIColor.redColor()
        if imageView.frame.origin.x == 5
        {
            color = UIColor.greenColor()
        }
        healthBar.backgroundColor = color
        healthBar.layer.cornerRadius = 8
        healthBar.frame = CGRectMake(imageView.frame.origin.x, height-202, 200*CGFloat(hp/vtl), 20)
        
        healthText.textColor = UIColor.whiteColor()
        healthText.textAlignment = NSTextAlignment.Center
        healthText.text = toString(hp) + "/" + toString(vtl)
        healthText.frame = CGRectMake(imageView.frame.origin.x, height-202, 200, 20)
    }
    
    func buildManaBars(height: CGFloat!)
    {
        manaContainer.backgroundColor = UIColor.blackColor()
        manaContainer.layer.cornerRadius = 6
        manaContainer.frame = CGRectMake(imageView.frame.origin.x, height-180, 200, 10)
        
        manaBar.backgroundColor = UIColor.blueColor()
        manaBar.layer.cornerRadius = 8
        manaBar.frame = CGRectMake(imageView.frame.origin.x, height-180, 200*CGFloat(mp/mana), 10)
        
        manaText.textColor = UIColor.whiteColor()
        manaText.textAlignment = NSTextAlignment.Center
        manaText.text = toString(mp) + "/" + toString(mana)
        manaText.frame = CGRectMake(imageView.frame.origin.x, height-180, 200, 10)
    }
}

class move
{
    internal init() {}
    var magicdmg: Double! = 0
    var physdmg: Double! = 0
    var moveName: String!
    var moveHitChance: Int!
    var moveID: Int!
    var image: UIImage? = UIImage(named:"transparent")
    var imageView = UIImageView()
    var manaCost: Double!
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

