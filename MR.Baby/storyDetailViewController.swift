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
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var backwardButton: UIButton!
    @IBOutlet weak var slider: UISlider?
    @IBOutlet weak var overlayShadow: UIImageView?
    @IBOutlet weak var brandName: UILabel!
    
    
    
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
        
        slideBack()
        
        setInterface()
        setTargets()
        audioPlayerConfigure()
        sliderConfigure()

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
    
    func slideBack(){
        let gestureSlideBack = UISwipeGestureRecognizer(target: self, action: #selector(self.backButtonTapped))
        gestureSlideBack.direction = .right
        self.view.addGestureRecognizer(gestureSlideBack)
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
    
    @IBAction func changeAudioTime(sender: AnyObject){
        audioPlayer?.stop()
        audioPlayer?.currentTime =  TimeInterval(slider!.value)
        audioTime = Int(slider!.value)
        minutesLabel = String(getTimeFromMinutes(minutes: audioTime))
        timeStartLabel?.text = String(minutesLabel ?? "")
        audioPlayer?.prepareToPlay()
        audioPlayer?.play()
    }
    
    @objc func updateSlider() {
        slider?.value = Float(audioPlayer!.currentTime)

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
        
    }
    
    
}


extension storyDetailViewController{
    //    MARK: Funcs are here
    
    func sliderConfigure(){
//        self.slider?.minimumValue = 0.0
//        self.slider!.maximumValue = Float(audioPlayer!.duration)
    }
    
    func startTimer() {
        audioTimer = Timer.scheduledTimer(timeInterval: 1.0,
                                          target: self,
                                          selector: #selector(timerController),
                                          userInfo: nil, repeats: true)
        var updateSliderTimer: Timer?
        
        updateSliderTimer = Timer.scheduledTimer(timeInterval: 0.1,
                                                 target: self,
                                                 selector: #selector(updateSlider),
                                                 userInfo: nil, repeats: true)
        
    }
    
    func resetTimer(){
        audioTimer?.invalidate()
        audioTimer = nil
        audioTime = 0
    }
    
    //    MARK: SetInterface
    
    func setInterface(){
        setHeaderInterface()
        sliderInterface()
        brandNameInterface()
         
        backwardButton.tintColor = UIColor.white
        forwardButton.tintColor = UIColor.white
        
        
        overlayShadow?.image = UIImage(named: "overlayShadow")
        overlayShadow?.contentMode = .scaleToFill
        overlayShadow?.alpha = 0.5
        
    }
    
    
    func brandNameInterface(){
        brandName.text = String("  ") + String("My Baby") + String("  ")
        brandName.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        brandName.clipsToBounds = true
        brandName.layer.cornerRadius = 14.0
    }
    
    func setHeaderInterface(){
        backButonInitialUI()
        favoriteButonInitialUI()
        forwardAndBackwardButtonsUI()
    }
    
    func backButonInitialUI(){
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.tintColor = .black
        backButton.alpha = 0.8
        backButton.backgroundColor = .white
        backButton.layer.cornerRadius = 8.0
    }
    
    func favoriteButonInitialUI(){
        favorutiesButton.setImage(UIImage(systemName: "heart"), for: UIControl.State.normal)
        favorutiesButton.tintColor = .red
        favorutiesButton.alpha = 0.8
        favorutiesButton.backgroundColor = .white
        favorutiesButton.layer.cornerRadius = 8.0
    }
    
    func forwardAndBackwardButtonsUI(){
        forwardButton.tintColor = .black
        forwardButton.alpha = 1
        forwardButton.backgroundColor = UIColor.white.withAlphaComponent(0.1)
        forwardButton.layer.cornerRadius = forwardButton.frame.height / 2
        
        backwardButton.tintColor = .black
        backwardButton.alpha = 1
        backwardButton.backgroundColor = UIColor.white.withAlphaComponent(0.1)
        backwardButton.layer.cornerRadius = forwardButton.frame.height / 2
    }
    
    func setTargets(){
        backButton.addTarget(self, action: #selector(backButtonTapped(_:)), for: .touchUpInside)
    }
    
    func audioPlayerConfigure(){
        resetTimer()
        startTimer()
        
        
        let song = songs[position]
        let urlString = Bundle.main.path(forResource: song.audioName, ofType: song.audioType)
        
        audioTitleLabel?.text = song.title
        storyDetailSubtitleLabel?.text = song.audioSubtitle
        audioBackgroundImage?.image = UIImage(named: "\(song.backgroundImageName)")
        timeEndLabel?.text = song.duration
        
        
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
            player.play()
            player.volume = 0.5
        } catch {
            print("error pccurred")
        }
        self.slider?.minimumValue = 0.0
        self.slider!.maximumValue = Float(audioPlayer!.duration)

        
        
    }
    
    func sliderInterface(){
        slider?.maximumTrackTintColor = UIColor.white.withAlphaComponent(0.6)
        slider?.minimumTrackTintColor = UIColor(named: "costumMatGreen")
        slider?.thumbTintColor = UIColor(named: "costumGreen")
    }
    
}

