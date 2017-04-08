//
//  ViewController.swift
//  MusicApp
//
//  Created by akash savediya on 02/04/17.
//  Copyright © 2017 akash savediya. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBAction func play(_ sender: Any) {
        player.play()
    }
    
    @IBAction func pause(_ sender: Any) {
        player.pause()
    }
    
    @IBAction func replay(_ sender: Any) {
   
        player.currentTime = 0
    }
    
    
    var player:AVAudioPlayer = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    
    do
    {
        let audioPath = Bundle.main.path(forResource: "song", ofType: ".mp3")
        try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
    }
    
    catch
    {
        //Error
    }

    }

}

