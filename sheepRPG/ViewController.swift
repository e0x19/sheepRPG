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
        loadEnemies()
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
        enemyNum += 1
    }
    
    func startFight(enemy:player)
    {
        var playerView = UIImageView()
        playerView.image = sheep.image!
        playerView.frame = CGRectMake(5, height-165, 200, 160)
        self.view.addSubview(playerView)
        var enemyView = UIImageView()
        enemyView.image = enemy.image!
        enemyView.frame = CGRectMake(width-205, height-165, 200, 160)
        self.view.addSubview(enemyView)
        
        var sheepHealthBarContainer = UIView()
        sheepHealthBarContainer.backgroundColor = UIColor.blackColor()
        sheepHealthBarContainer.frame = CGRectMake(5, height-190, 200, 20)
        self.view.addSubview(sheepHealthBarContainer)
        
        var sheepHealthBar = UIView()
        sheepHealthBar.backgroundColor = UIColor.greenColor()
        sheepHealthBar.frame = CGRectMake(5, height-190, 200*CGFloat(sheep.hp/sheep.vtl), 20)
        self.view.addSubview(sheepHealthBar)
        
        var sheepHealthText = UILabel()
        sheepHealthText.textColor = UIColor.whiteColor()
        sheepHealthText.textAlignment = NSTextAlignment.Center
        sheepHealthText.text = toString(sheep.hp) + "/" + toString(sheep.vtl)
        sheepHealthText.frame = CGRectMake(5, height-190, 200, 20)
        self.view.addSubview(sheepHealthText)
        
        var enemyHealthBarContainer = UIView()
        enemyHealthBarContainer.backgroundColor = UIColor.blackColor()
        enemyHealthBarContainer.frame = CGRectMake(width-205, height-190, 200, 20)
        self.view.addSubview(enemyHealthBarContainer)
        
        var enemyHealthBar = UIView()
        enemyHealthBar.backgroundColor = UIColor.redColor()
        enemyHealthBar.frame = CGRectMake(width-205, height-190, 200*CGFloat(sheep.hp/sheep.vtl), 20)
        self.view.addSubview(enemyHealthBar)
        
        var enemyHealthText = UILabel()
        enemyHealthText.textColor = UIColor.whiteColor()
        enemyHealthText.textAlignment = NSTextAlignment.Center
        enemyHealthText.text = toString(enemy.hp) + "/" + toString(enemy.vtl)
        enemyHealthText.frame = CGRectMake(width-205, height-190, 200, 20)
        self.view.addSubview(enemyHealthText)
        
    }
    
    func showCredits()
    {
        
    }
    
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
