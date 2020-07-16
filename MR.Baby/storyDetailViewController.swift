//
//  storyDetailViewController.swift
//  MR.Baby
//
//  Created by İlker isa Mercan on 4.07.2020.
//  Copyright © 2020 Mahmut Mercan. All rights reserved.
//

import UIKit
import AVFoundation

class storyDetailViewController: UIViewController {
    
    public var position: Int = 0
    public var songs: [Song] = []
        
//    IBOutler ler
    @IBOutlet weak var audioTitleLabel: UILabel!
    @IBOutlet weak var storyDetailSubtitleLabel: UILabel!
    @IBOutlet weak var audioBackgroundImage: UIImageView!
    @IBOutlet weak var timeStartLabel: UILabel!
    @IBOutlet weak var timeEndLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var favorutiesButton: UIButton!
    @IBOutlet weak var sliderTime1: UISlider!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var backwardButton: UIButton!
    
        
//    Struck Çekme
    var selectedAudioTitle = ""
    var selectedAudioSubtitle = ""
    var selectedAudioName = ""
    var selectedBackgroundImage = ""
    var selectedStoryDuration = ""
    var selectedAudioType = ""
    var selectedCategorySongs1: [Song]! = []

    
    var nextAudioTitle = ""
    
//    Simge Çevirme
    var audioPlayer: AVAudioPlayer?
    var toggleState = 1
    var toggleStateFavorites = 1
    var toggleStateForward = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setInterface()
        setTargets()

    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if view.subviews.count == 0 {
            setInterface()
        }
    }
        
    func setInterface(){
        
        audioTitleLabel.text = selectedAudioTitle
        storyDetailSubtitleLabel.text = selectedAudioSubtitle
        audioBackgroundImage.image = UIImage(named: "\(selectedBackgroundImage)")
        timeEndLabel.text = selectedStoryDuration
        sliderTime1.addTarget(self, action: #selector(sliderTime), for: UIControl.Event.valueChanged)

//        let song = songs[position]
        let urlString = Bundle.main.path(forResource: "\(selectedAudioName)", ofType: "\(selectedAudioType)")
        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            
            guard let urlString = urlString else {
                return
            }
            audioPlayer = try AVAudioPlayer(contentsOf: URL(string: urlString)!)
            guard let player = audioPlayer else {
                return
            }
//            player.currentTime = 0
            player.play()
        } catch {
            print("error pccurred")
        }
        
        
                
//        let selectedMusic = 1
//
//        switch selectedMusic {
//        case 1:
//            let pathToSound = Bundle.main.path(forResource: "\(selectedAudioName)", ofType: "\(selectedAudioType)")!
//            let url = URL(fileURLWithPath: pathToSound)
//
//            do{
//                audioPlayer = try AVAudioPlayer(contentsOf: url)
//                audioPlayer?.play()
//
//                var audioSession = AVAudioSession.sharedInstance()
//                do {
//                    try audioSession.setCategory(AVAudioSession.Category.playback)
//
//                }
//                catch {
//
//                }
//
//            } catch {
//
//            }
//        default:
//            return
//        }

            
            
        }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let player = audioPlayer {
            player.stop()
        }
    }
    
    
    
    func setTargets(){
        
    }
    
    
    @IBAction func playStopButtonClicked(_ sender: UIButton) {
        if audioPlayer?.isPlaying == true {
            audioPlayer?.pause()
            playPauseButton.setImage(UIImage(named: "play_button_Icon"), for:
                UIControl.State.normal)

            
        } else {
            audioPlayer?.play()
            playPauseButton.setImage(UIImage(named: "pause_button_Icon"), for: UIControl.State.normal)

            
        }
                
//        if toggleState == 1 {
//            audioPlayer?.pause()
//            toggleState = 2
//            playPauseButton.setImage(UIImage(named: "play_button_Icon"), for:
//                UIControl.State.normal)
//
//
//
//        } else {
//            audioPlayer?.play()
//            toggleState = 1
//            playPauseButton.setImage(UIImage(named: "pause_button_Icon"), for: UIControl.State.normal)
//
//
//        }
      
        
    }
        
//    --------------------------------------------------------------------------------------

    
    @IBAction func forwardButtonClicked(_ sender: Any) {
        if position < (songs.count - 1) {
            position = position + 1
            audioPlayer?.stop()
            for subview in view.subviews {
                subview.removeFromSuperview()
            }
            setInterface()
            
        }



    }
    
//    --------------------------------------------------------------------------------------

    
    @IBAction func backwardButtonClicked(_ sender: Any) {
        if position > 0 {
            position = position - 1
            audioPlayer?.stop()
            for subview in view.subviews {
                subview.removeFromSuperview()
            }
            setInterface()
            
        }
    }
    
    
    @IBAction func sliderTime(_ sender: Any) {
//        let value = sliderTime1.value
//        audioPlayer?.currentTime = value
        
    }
    
    
    
    
//    --------------------------------------------------------------------------------------

    
    @IBAction func favoritesButtonClicked(_ sender: Any) {
        
        if toggleStateFavorites == 1 {
            toggleStateFavorites = 2
            favorutiesButton.setImage(UIImage(systemName: "heart.fill"), for: UIControl.State.normal)
            

            
        } else {
            toggleStateFavorites = 1
            favorutiesButton.setImage(UIImage(systemName: "heart"), for: UIControl.State.normal)

        }

        
        
    }
    
//    --------------------------------------------------------------------------------------
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }
    
//    --------------------------------------------------------------------------------------
    


}
