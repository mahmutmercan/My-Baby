//
//  Utilities.swift
//  MR.Baby
//
//  Created by İlker isa Mercan on 19.07.2020.
//  Copyright © 2020 Mahmut Mercan. All rights reserved.
//

import Foundation
import UIKit

func getTimeFromSeconds(seconds sec: Int) -> String {
       let formatter = DateComponentsFormatter()
       formatter.allowedUnits = [.hour, .minute, .second]
       formatter.unitsStyle = .positional
       formatter.zeroFormattingBehavior = .pad
       
       let formattedString = formatter.string(from: TimeInterval(sec)) ?? "00:00"
       return formattedString
}

func getTimeFromMinutes(minutes min: Int) -> String {
    let formatter = DateComponentsFormatter()
    formatter.allowedUnits = [.minute, .second]
    formatter.unitsStyle = .positional
    formatter.zeroFormattingBehavior = .pad
    
    let formattedString = formatter.string(from: TimeInterval(min)) ?? "00:00"
    return formattedString
}

