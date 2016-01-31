//
//  ViewController.swift
//  hideRedHideBlue
//
//  Created by Bryan Guise on 1/29/16.
//  Copyright © 2016 Bryan Guise. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var showBlueEye: UIImageView!
    @IBOutlet weak var showRedEye: UIImageView!
    
    var backgroundMusic : AVAudioPlayer?
    var shotgunSound : AVAudioPlayer?
    var nCount : Int = 0
    

    @IBOutlet weak var buttonRedEye: UIButton!
    @IBOutlet weak var buttonBlueEye: UIButton!
    @IBOutlet weak var resetButton: UIButton!
 
    
    func setupgame()  {
        backgroundMusic?.play()
        resetButton.hidden = true
    }
    
    func counter() {
        if nCount >= 4
        {
            resetButton.hidden = false
        }
    }
    
    //ABOVE VIEW DID LOAD METHOD FOR SOUNDS/MUSIC
    func setupAudioPlayerWithFile(file:NSString, type:NSString) -> AVAudioPlayer?  {
        //1
        let path = NSBundle.mainBundle().pathForResource(file as String, ofType: type as String)
        let url = NSURL.fileURLWithPath(path!)
        
        //2
        var audioPlayer:AVAudioPlayer?
        
        // 3
        do {
            try audioPlayer = AVAudioPlayer(contentsOfURL: url)
        } catch {
            print("Player not available")
        }
        
        return audioPlayer
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let shotgunSound = self.setupAudioPlayerWithFile("shotgunSound", type:"wav") {
            self.shotgunSound = shotgunSound
        }
        if let backgroundMusic = self.setupAudioPlayerWithFile("backgroundMusic", type:"wav") {
            self.backgroundMusic = backgroundMusic
        }
        setupgame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func actionBlue(sender: AnyObject) {
        
        showBlueEye.hidden = false
        shotgunSound?.play()
        nCount = nCount + 1
        counter()
    }
    
    @IBAction func actionRed(sender: AnyObject) {
        showRedEye.hidden = false
        shotgunSound?.play()
        nCount = nCount + 1
        counter()
    }
    
    @IBAction func actionReset(sender: AnyObject) {
        shotgunSound?.play()
        showRedEye.hidden = true
        showBlueEye.hidden = true
        resetButton.hidden = false
        nCount = 0
        setupgame()
    }

    
    

}

