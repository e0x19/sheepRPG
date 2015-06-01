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
    var menuBG = UIImage(named:"title") as UIImage?
    
    var sheep = player()
    
    // will be locally stored
    var enemyNum = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        buildMenu()
        
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
        
      //startFight(enemy)
    }
    
    func startFight(enemy:player)
    {
        
    }
    func showCredits()
    {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}
