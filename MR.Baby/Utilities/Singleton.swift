//
//  Singleton.swift
//  MR.Baby
//
//  Created by isa on 21.08.2020.
//  Copyright © 2020 Mahmut Mercan. All rights reserved.
//

import AVFoundation

class Singleton {
    static let sharedInstance = Singleton()
    private var audioPlayer: AVAudioPlayer?

    func play() {
        guard let url = Bundle.main.url(forResource: "Sound", withExtension: "mp3") else { return }
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            try AVAudioSession.sharedInstance().setActive(true)
            audioPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            guard let player = audioPlayer else { return }
            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }

    func stop() {
        audioPlayer?.stop()
    }
}
