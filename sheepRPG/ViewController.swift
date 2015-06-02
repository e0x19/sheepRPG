//
//  ViewController.swift
//  sheepRPG
//
//  Created by Nathan Scheidler on 5/29/15.
//  Copyright (c) 2015 xterm. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation

class ViewController: UIViewController {
    
    var inGamePlayer = AVAudioPlayer()
    //var gameURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("game", ofType: "wav")!)
    
    var menuPlayer = AVAudioPlayer()
    //var menuURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("menu", ofType: "wav")!)
    
    var sfxPlayer = AVAudioPlayer()
    
    var screen: CGRect! = UIScreen.mainScreen().bounds
    var width: CGFloat!
    var height: CGFloat!
    
    var startbtn: UIButton!
    var start = UIImage(named:"Start") as UIImage?
    var creditbtn: UIButton!
    var menuLabel = UILabel()
    //var menuBG = UIImage(named:"title") as UIImage?
    
    // will be locally stored
    var enemyNum = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        width = screen.width
        height = screen.height
        buildMenu()
        initialize()
    }
    
   func buildMenu()
    {
        startbtn = UIButton.buttonWithType(UIButtonType.System) as UIButton
        startbtn.frame = CGRectMake(width/2 - 50, height/2 - 60, 100, 80)
        startbtn.setBackgroundImage(start, forState: UIControlState.Normal)
        startbtn.addTarget(self, action:"startGame", forControlEvents:UIControlEvents.TouchUpInside)
        self.view.addSubview(startbtn)
        
        creditbtn = UIButton.buttonWithType(UIButtonType.System) as UIButton
        creditbtn.frame = CGRectMake(width/2 - 50, height/2 + 30, 100, 40)
        creditbtn.backgroundColor = UIColor.greenColor()
        creditbtn.setTitle("Credits", forState:UIControlState.Normal)
        creditbtn.addTarget(self, action:"showCredits", forControlEvents:UIControlEvents.TouchUpInside)
        creditbtn.layer.cornerRadius = 5
        self.view.addSubview(creditbtn)
        
        menuLabel.frame = CGRectMake(width/2 - 100, 100, 200, 50)
        menuLabel.textColor = UIColor.blueColor()
        menuLabel.textAlignment = NSTextAlignment.Center
        menuLabel.font = UIFont(name: menuLabel.font.fontName, size: 18)
        menuLabel.text = "XTERM 2K15 ROUND2"
        self.view.addSubview(menuLabel)
    }
   
    func startGame()
    {
        clearView()
        startFight(enemies[enemyNum])
    }
    
    func startFight(enemy:player)
    {

        enemy.buildViews(width, height: height, sheep: false)
        sheep.buildViews(width, height: height, sheep: true)
        enemy.buildHealthBars(height)
        sheep.buildHealthBars(height)
        self.view.addSubview(sheep.imageView)
        self.view.addSubview(enemy.imageView)

        self.view.addSubview(sheep.healthContainer)
        self.view.addSubview(sheep.healthBar)
        self.view.addSubview(sheep.healthText)
        
        self.view.addSubview(enemy.healthContainer)
        self.view.addSubview(enemy.healthBar)
        self.view.addSubview(enemy.healthText)
        
        playerTurn(enemy)
        
    }
    
    func playerTurn(enemy:player)
    {
        var i = 0
        for sheepmove in sheep.moves
        {
        var moveBtn = UIButton.buttonWithType(UIButtonType.System) as UIButton
        var y: CGFloat! = height - 320 + CGFloat(30 * i)
        moveBtn.frame = CGRectMake(5, y, 200, 20)
        moveBtn.setTitle(sheepmove.moveName, forState:UIControlState.Normal)
        moveBtn.addTarget(self, action:"movePress:", forControlEvents:UIControlEvents.TouchUpInside)
        moveBtn.tag = i
        self.view.addSubview(moveBtn)
        i += 1
        }
        
    }
    
    func movePress(sender:UIButton!)
    {
        var attacker = sheep
        var thistarget = enemies[enemyNum]
        var thismove = sheep.moves[sender.tag]
        attack(thistarget, type:thismove)
    }
    
    func enemyTurn(enemy:player)
    {
        
    }
    
    func attack(target: player, type: move)
    {
        var mdmg = (100 - target.mdmgrst)/100 * type.magicdmg
        var pdmg = (100 - target.pdmgrst)/100 * type.physdmg
        var dmgtot = mdmg + pdmg
        target.hp = target.hp - dmgtot
        
        if(hitchance(type.moveHitChance) == true)
        {
            println("THE MOVE HITS")
            println("PLAYER HEALTH IS")
            println(target.hp)
        }
        else
        {
            println("THE MOVE DOES NOT HIT")
        }
        
        target.buildHealthBars(height)
    }
    
    func endFight(enemy: player)
    {
        enemyNum += 1
    }
    
    func showCredits()
    {}
    
    func clearView()
    {
        for view in self.view.subviews
        {
            view.removeFromSuperview()
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}
