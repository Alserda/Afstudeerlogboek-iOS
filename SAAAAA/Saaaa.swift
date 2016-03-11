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
    let viewDuration: Double = 2.4
    @IBOutlet var balloon: UIImageView!
    @IBOutlet var balloonHorizontalConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        navigationController?.navigationBarHidden = true

        playSaaaSound()
        
        NSTimer.scheduledTimerWithTimeInterval(viewDuration, target: self, selector: "discardScreen", userInfo: nil, repeats: false)
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(0.4 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) { () -> Void in
            NSTimer.scheduledTimerWithTimeInterval(0.04, target: self, selector: "animateBalloon", userInfo: nil, repeats: true)
        }
    }
    
    func animateBalloon() {
        switch balloonHorizontalConstraint.constant {
        case -46:
            balloonHorizontalConstraint.constant = -50
        default:
            balloonHorizontalConstraint.constant = -46
        }
    }
    
    func playSaaaSound() -> Void {
        let audioSample = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("saaaa", ofType: "mp3")!)
        
        do {
            try audioPlayer = AVAudioPlayer(contentsOfURL: audioSample)
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        } catch {
            print("error")
        }
    }
    
    func discardScreen() {
        navigationController?.navigationBarHidden = false
        tabBarController?.selectedIndex = 0
        navigationController?.popToRootViewControllerAnimated(true)
    }
}
