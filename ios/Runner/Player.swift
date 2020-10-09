//
//  Player.swift
//  Runner
//
//  Created by David Maksa on 12.01.20.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

import UIKit
import AVKit

class Player: NSObject {

    let playerVC = AVPlayerViewController()
    
    override init() {
        super.init()
        
        playerVC.delegate = self
    }
    
    @objc func play(presenterVC: UIViewController) {
        
        playerVC.player = AVPlayer(url: URL(string: "https://www.radiantmediaplayer.com/media/bbb-360p.mp4")!)
        
        presenterVC.present(playerVC, animated: true, completion: nil)
    }
}

extension Player: AVPlayerViewControllerDelegate {
    
}
