//
//  AudioItems.swift
//  MR.Baby
//
//  Created by isa on 10.08.2020.
//  Copyright © 2020 Mahmut Mercan. All rights reserved.
//

import Foundation

class AudioItems: NSObject {
    var title: String?
    var audioCoverImage: String?
    var audioPackageCount: String?
    var audioCategory: String?
    
    init(title: String, audioCoverImage: String, audioPackageCount: String, audioCategory: String) {
        self.title = title
        self.audioPackageCount = audioPackageCount
        self.audioCoverImage = audioCoverImage
        self.audioCategory = audioCategory
    }
}

var exampleAudioItems: [AudioItems] = [AudioItems(title: "audio Title", audioCoverImage: "cover Image", audioPackageCount: "25", audioCategory: "Sample") ]

class AudioItemSong: NSObject {
    var title: String?
    
    init(title: String) {
        self.title = title
    }
}

