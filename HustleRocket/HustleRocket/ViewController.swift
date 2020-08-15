//
//  ViewController.swift
//  HustleRocket
//
//  Created by Andrés Berumen on 7/18/19.
//  Copyright © 2019 Andrés Berumen. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    // Outlets
    @IBOutlet weak var darkBlue: UIImageView!
    @IBOutlet weak var powerButton: UIButton!
    @IBOutlet weak var cloudHolder: UIView!
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var hustleMode: UILabel!
    @IBOutlet weak var on: UILabel!
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        } catch let error as NSError {
            print(error.description)
        }
    }


    
    // Actions
    @IBAction func powerButtonPressed(_ sender: UIButton) {
        cloudHolder.isHidden = false
        darkBlue.isHidden = true
        powerButton.isHidden = true
        
        player.play()
        
        UIView.animate(withDuration: 2.3, animations: {
            self.rocket.frame = CGRect(x: 0, y: 100, width: 414, height: 674)
        }) { (finished) in
            self.hustleMode.isHidden = false
            self.on.isHidden = false
        }
    }
}

