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
    var soundURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("game", ofType: "wav")!)
    
    var screen: CGRect! = UIScreen.mainScreen().bounds
    var width: CGFloat!
    var height: CGFloat!
    
    var bg = UIImage(named: "bg") as UIImage?
    var startbtn: UIButton!
    var start = UIImage(named:"Start") as UIImage?
    var creditbtn: UIButton!
    var menuLabel = UILabel()
    
    var console = UILabel()
    var btn1: UIButton!
    var btn2: UIButton!
    var btn3: UIButton!
    var btn4: UIButton!
    var btnArray = Array<UIButton!> ()
    var enemyTimer: NSTimer!
    
    var dead = false
    var fightEnded = false
    
    var enemyNum = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        width = screen.width
        height = screen.height
        self.view.backgroundColor = UIColor(patternImage:bg!)
        buildMenu()
        initialize()
    }
    
   func buildMenu()
    {
        inGamePlayer = AVAudioPlayer(contentsOfURL: soundURL, error: nil)
        inGamePlayer.numberOfLoops = -1
        inGamePlayer.play()
        
        btn1 = UIButton.buttonWithType(UIButtonType.System) as UIButton
        btn2 = UIButton.buttonWithType(UIButtonType.System) as UIButton
        btn3 = UIButton.buttonWithType(UIButtonType.System) as UIButton
        btn4 = UIButton.buttonWithType(UIButtonType.System) as UIButton
        btnArray.append(btn1)
        btnArray.append(btn2)
        btnArray.append(btn3)
        btnArray.append(btn4)
        
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
        reloadEnemyData()
        startFight(enemies[enemyNum])
    }
    
    func startFight(enemy:player)
    {
        console.text = ""
        enemy.buildViews(width, height: height, sheep: false)
        sheep.buildViews(width, height: height, sheep: true)
        enemy.buildHealthBars(height)
        sheep.buildHealthBars(height)
        sheep.buildManaBars(height)
        self.view.addSubview(sheep.imageView)
        self.view.addSubview(enemy.imageView)

        self.view.addSubview(sheep.healthContainer)
        self.view.addSubview(sheep.healthBar)
        self.view.addSubview(sheep.healthText)
        self.view.addSubview(sheep.manaContainer)
        self.view.addSubview(sheep.manaBar)
        self.view.addSubview(sheep.manaText)
        
        self.view.addSubview(enemy.healthContainer)
        self.view.addSubview(enemy.healthBar)
        self.view.addSubview(enemy.healthText)
        
        console.frame = CGRectMake(210, 50, width, 150)
        menuLabel.textColor = UIColor.blueColor()
        menuLabel.textAlignment = NSTextAlignment.Center
        self.view.addSubview(console)
        
        var i = 0
        for sheepmove in sheep.moves
        {
            var moveBtn = btnArray[i]
            var y: CGFloat! = height - 320 + CGFloat(30 * i)
            moveBtn.frame = CGRectMake(5, y, 200, 20)
            moveBtn.setTitle(sheepmove.moveName, forState:UIControlState.Normal)
            moveBtn.addTarget(self, action:"movePress:", forControlEvents:UIControlEvents.TouchUpInside)
            moveBtn.tag = i
            i += 1
            self.view.addSubview(moveBtn)
        }
        playerTurn()
    }
    
    func playerTurn()
    {
        var i = 0
        for btn in btnArray
        {
            btn.enabled = true
            if sheep.moves[i].manaCost > sheep.mp
            {
                btn.enabled = false
            }
            i++
        }
    }
    
    func movePress(sender:UIButton!)
    {
        for btn in btnArray
        {
            btn.enabled = false
        }
        sheep.mp = sheep.mp - sheep.moves[sender.tag].manaCost
        attack(enemies[enemyNum], type: sheep.moves[sender.tag], attacker: sheep)
    }
    
    func enemyTurn()
    {
        var enemy = enemies[enemyNum]
        if sheep.mp > sheep.mana - 10
        {
            sheep.mp = sheep.mana
        }
        else
        {
            sheep.mp = sheep.mp + 10
        }
        var attackMove = enemy.moves[Int(arc4random_uniform(4))]
        attack(sheep, type: attackMove, attacker: enemy)
    }
    
    func attack(target: player, type: move, attacker: player)
    {
        var mdmg = (100 - target.mdmgrst)/100 * type.magicdmg
        var pdmg = (100 - target.pdmgrst)/100 * type.physdmg
        var dmgtot = mdmg + pdmg
        console.text = attacker.name + " used " + type.moveName
        type.imageView.image = type.image!
        type.imageView.frame = CGRectMake(width/2 - 37, height/2, 75, 75)
        self.view.addSubview(type.imageView)
        var particlePos: CGFloat!
        
        if target.name == sheep.name
        {
            particlePos = -75
        }
        else
        {
            particlePos = width+75
        }
        UIView.animateWithDuration(1.5,
            delay: 0.0, options: nil,
            animations:{
                type.imageView.frame = CGRectMake(particlePos, -75, 75, 75)
                sheep.buildManaBars(self.height)
            },
            completion:
        {(value: Bool) in type.imageView.removeFromSuperview()
            if(hitchance(type.moveHitChance) == true)
            {
                target.hp = target.hp - dmgtot
                self.console.text = self.console.text! + " It did " + toString(dmgtot) + " damage."
                target.buildHealthBars(self.height)
            }
            else
            {
                self.console.text = self.console.text! + " It missed."
            }

            if target.hp <= 0
            {
                self.endFight()
            }
            else if target.name == sheep.name
            {
                self.playerTurn()
            }
            else
            {
                self.enemyTimer = NSTimer.scheduledTimerWithTimeInterval(1.5, target: self, selector: Selector("enemyTurn"), userInfo: nil, repeats: false)
            }
        })
        
    }
    
    func endFight()
    {
        clearView()
        var winner = enemies[enemyNum]
        fightEnded = true
        if sheep.hp > 0
        {
            winner = sheep
            console.text = "Congratulations, you've killed " + enemies[enemyNum].name + ".  Tap to continue"
            enemyNum = enemyNum + 1
            if enemyNum == enemies.count
            {
                dead = true
                enemyNum = 0
                win()
            }
        }
        else
        {
            dead = true
            console.text = "You have been killed by " + winner.name + ". Tap to restart"
            enemyNum = 0
        }
        self.view.addSubview(console)
        
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent)
    {
        if dead == true && fightEnded == true
        {
            startGame()
        }
        else if fightEnded == true
        {
            startFight(enemies[enemyNum])
        }
    }

    func win()
    {
        clearView()
        console.text = "Hot damn, you won. Tap to restart."
        self.view.addSubview(console)
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
