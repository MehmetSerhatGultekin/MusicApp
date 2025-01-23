//
//  PlayerVC.swift
//  MusicApp
//
//  Created by Mehmet Serhat Gültekin on 22.01.2025.
//

import UIKit
import AVFoundation

class PlayerVC: UIViewController {
    
    public var position: Int = 0
    public var songs: [Song] = []
    
    @IBOutlet var holder: UIView!
    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() { // alt görünümlerinin (subviews) yerleşiminin (layout) güncellendiği noktada çağrılır.
        super.viewDidLayoutSubviews()
        if holder.subviews.count == 0 {
            configure()
        }
    }
        func configure() {
            let song = songs[position]
            
            let urlString = Bundle.main.path(forResource: song.trackName, ofType: "mp3")
            
            do {
               try  AVAudioSession.sharedInstance().setMode(.default)
               try  AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                
                guard let urlString = urlString else {
                    print("urlstring is nill")
                    return
                }
                
                player = try AVAudioPlayer(contentsOf: URL(string: urlString)!)
                
                guard let player = player else {
                    print("player is nil")
                    return
                }
                
                player.play()
            }
            catch {
                print("error occured")
            }
        }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let player = player {
            player.stop()
        }
    }
    
}
