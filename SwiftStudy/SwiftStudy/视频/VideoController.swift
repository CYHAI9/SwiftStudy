//
//  VideoController.swift
//  SwiftStudy
//
//  Created by ChenYinHai on 2019/8/8.
//  Copyright © 2019 陈海哥. All rights reserved.
//

import UIKit
import AVKit

class VideoController: UIViewController {

    var avPlayer:AVPlayer?
    var avItem:AVPlayerItem?
    var avplayerLayer :AVPlayerLayer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fixUi()
    }
    
    func fixUi() -> Void {
        
        self.avItem = AVPlayerItem.init(url:URL.init(fileURLWithPath:Bundle.main.path(forResource: "test", ofType: "mp4")!))
        self.avPlayer = AVPlayer.init(playerItem: self.avItem)
        self.avplayerLayer = AVPlayerLayer.init(player: self.avPlayer)
        self.avplayerLayer?.frame = CGRect.init(origin:CGPoint.init(x: 0, y: 84), size: CGSize.init(width:self.view.frame.size.width, height: self.view.frame.size.width * 2/3))
        self.view.layer.addSublayer(self.avplayerLayer!)
        self.avPlayer?.play()
        
    }
    
}
