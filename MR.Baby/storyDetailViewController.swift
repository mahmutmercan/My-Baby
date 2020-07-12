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
    
    var nextAudioTitle = ""
    
//    Simge Çevirme
    var audioPlayer: AVAudioPlayer?
    var toggleState = 1
    var toggleStateFavorites = 1
    var toggleStateForward = 1
    
//    var ArrayForward = [String]()
    
        
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setInterface()
        setTargets()
//        ArrayForward = [selectedAudioTitle, selectedAudioSubtitle, selectedAudioName, selectedBackgroundImage, selectedStoryDuration, selectedAudioType]
        

    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if view.subviews.count == 1 {
            setInterface()
        }
    }
        
    func setInterface(){
        audioTitleLabel.text = selectedAudioTitle
        storyDetailSubtitleLabel.text = selectedAudioSubtitle
        audioBackgroundImage.image = UIImage(named: "\(selectedBackgroundImage)")
        timeEndLabel.text = selectedStoryDuration
                
        let selectedMusic = 1

        switch selectedMusic {
        case 1:
            let pathToSound = Bundle.main.path(forResource: "\(selectedAudioName)", ofType: "\(selectedAudioType)")!
            let url = URL(fileURLWithPath: pathToSound)

            do{
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
                
                var audioSession = AVAudioSession.sharedInstance()
                do {
                    try audioSession.setCategory(AVAudioSession.Category.playback)

                }
                catch {
                    
                }

            } catch {

            }
        default:
            return
        }

            
            
        }
    
    
    func setTargets(){
        
    }
    
    
    @IBAction func playStopButtonClicked(_ sender: UIButton) {
                
        if toggleState == 1 {
            audioPlayer?.pause()
            toggleState = 2
            playPauseButton.setImage(UIImage(named: "play_button_Icon"), for:
                UIControl.State.normal)


            
        } else {
            audioPlayer?.play()
            toggleState = 1
            playPauseButton.setImage(UIImage(named: "pause_button_Icon"), for: UIControl.State.normal)


        }
      
        
    }
        
//    --------------------------------------------------------------------------------------

    
    @IBAction func forwardButtonClicked(_ sender: Any) {


    }
    
//    --------------------------------------------------------------------------------------

    
    @IBAction func backwardButtonClicked(_ sender: Any) {
    }
    
    
    @IBAction func sliderTime(_ sender: Any) {
        
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
