//
//  Saaaa.swift
//  SAAAAA
//
//  Created by Peter Alserda on 09/03/16.
//  Copyright © 2016 Peter Alserda. All rights reserved.
//

import UIKit
import AVFoundation

class Saaaa: UIViewController {
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        navigationController?.navigationBarHidden = true
        playSaaaSound()
    }
    
    func playSaaaSound() -> Void {
        let audioSample = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("saaaa", ofType: "mp3")!)
        
        do {
            try audioPlayer = AVAudioPlayer(contentsOfURL: audioSample)
            audioPlayer.prepareToPlay()
            audioPlayer.play()
            NSTimer.scheduledTimerWithTimeInterval(audioPlayer.duration + 1.5, target: self, selector: "discardScreen", userInfo: nil, repeats: false)
        } catch {
            print("error")
        }
    }
    
    func discardScreen() {
        NSNotificationCenter.defaultCenter().postNotificationName("changeTabBarIndex", object: nil)
        
        navigationController?.popViewControllerAnimated(true)
        navigationController?.navigationBarHidden = false
    }
}
