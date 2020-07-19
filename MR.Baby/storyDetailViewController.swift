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
    @IBOutlet weak var audioTitleLabel: UILabel?
    @IBOutlet weak var storyDetailSubtitleLabel: UILabel?
    @IBOutlet weak var audioBackgroundImage: UIImageView?
    @IBOutlet weak var timeStartLabel: UILabel?
    @IBOutlet weak var timeEndLabel: UILabel?
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var favorutiesButton: UIButton!
    @IBOutlet weak var sliderTime1: UISlider?
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var backwardButton: UIButton!
    
    @IBOutlet weak var overlayShadow: UIImageView?
    
    @IBOutlet weak var overlayShadowTopToBottom: UIImageView?
    
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
    
    
    
//    MARK: Timer vars
    var audioTimer: Timer?
    var audioTime: Int = 0
    var timeLabel: String?
    var minutesLabel: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setInterface()
        audioPlayerConfigure()
        setTargets()
    
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if view.subviews.count == 0 {
            setInterface()
            audioPlayerConfigure()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let player = audioPlayer {
            player.stop()
        }
    }



    
    //    MARK: SetInterface
    
    func setInterface(){
        
        backwardButton.tintColor = UIColor.white
        forwardButton.tintColor = UIColor.white
        
        
        overlayShadow?.image = UIImage(named: "overlayShadow")
        overlayShadow?.contentMode = .scaleToFill
        overlayShadow?.alpha = 0.3
        
        overlayShadowTopToBottom?.image = UIImage(named: "overlayShadow")
        overlayShadowTopToBottom?.contentMode = .scaleToFill
        overlayShadowTopToBottom?.alpha = 0.05
        
        
    }
    
    
    
    func setTargets(){
        backButton.addTarget(self, action: #selector(backButtonTapped(_:)), for: .touchUpInside)
    }
    
    func audioPlayerConfigure(){
        resetTimer()
        startTimer()
        print(timeLabel)
        print(audioTime)
        
        let song = songs[position]
        let urlString = Bundle.main.path(forResource: song.audioName, ofType: song.audioType)
        
        audioTitleLabel?.text = song.title
        storyDetailSubtitleLabel?.text = song.audioSubtitle
        audioBackgroundImage?.image = UIImage(named: "\(song.backgroundImageName)")
        timeEndLabel?.text = song.duration
        sliderTime1?.addTarget(self, action: #selector(sliderTime), for: UIControl.Event.valueChanged)

       
        
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
        
    }
    
        
    //    MARK: SetTimer
        
        @objc func timerController() {
            audioTime += 1
            
            timeLabel = String(getTimeFromSeconds(seconds: audioTime))
            minutesLabel = String(getTimeFromMinutes(minutes: audioTime))
            timeStartLabel?.text = String(minutesLabel ?? "")
            
            if timeStartLabel?.text == timeEndLabel?.text {
                       forwardButtonClicked(self)
                   }

            print(timeLabel)
            print(minutesLabel)
            print(audioTime)
            
        }
        
        func startTimer() {
            audioTimer = Timer.scheduledTimer(timeInterval: 1.0,
                                 target: self,
                                 selector: #selector(timerController),
                                 userInfo: nil, repeats: true)
            
        }
        
        func resetTimer(){
            audioTimer?.invalidate()
            audioTimer = nil
            audioTime = 0
        }
        
        
        
    
    
    
    @IBAction func playStopButtonClicked(_ sender: UIButton) {
        if audioPlayer?.isPlaying == true {
            audioPlayer?.pause()
            playPauseButton.setImage(UIImage(named: "play_button_Icon"),
                                     for: UIControl.State.normal)
            audioTimer?.invalidate()
            
        } else {
            audioPlayer?.play()
            playPauseButton.setImage(UIImage(named: "pause_button_Icon"),
                                     for: UIControl.State.normal)
            
        }
        
    }
    
    
    
    @IBAction func forwardButtonClicked(_ sender: Any) {
        if position < (songs.count - 1) {
            position = position + 1
            audioPlayer?.stop()
            resetTimer()
            audioPlayerConfigure()
        } else {
            position = 0
            audioPlayer?.stop()
            audioPlayerConfigure()
        }
    }
    
    
    
    @IBAction func backwardButtonClicked(_ sender: Any) {
        if position > 0 {
            position = position - 1
            audioPlayer?.stop()
            audioPlayerConfigure()
        }
    }
    
    
    @IBAction func sliderTime(_ sender: Any) {
        //        let value = sliderTime1.value
        //        audioPlayer?.currentTime = value
        
    }
    
    
    @IBAction func favoritesButtonClicked(_ sender: Any) {
        
        if toggleStateFavorites == 1 {
            toggleStateFavorites = 2
            favorutiesButton.setImage(UIImage(systemName: "heart.fill"), for: UIControl.State.normal)
            
            
            
        } else {
            toggleStateFavorites = 1
            favorutiesButton.setImage(UIImage(systemName: "heart"), for: UIControl.State.normal)
            
        }
        
    }
    
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }
    
}
