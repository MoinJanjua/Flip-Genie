//
//  BackgroundColourProvider.swift
//  CoinFlip
//
//  Created by Shayan Rastegar on 08/03/2017.
//  Copyright © 2017 Shayan Rastegar. All rights reserved.
//

import UIKit
import GameKit

struct BackgroundColourProvider {
    let colours = [
        UIColor(red: 90/255.0, green: 187/255.0, blue: 181/255.0, alpha: 1.0), // teal
        UIColor(red: 223/255.0, green: 86/255.0, blue: 94/255.0, alpha: 1.0), // red
        UIColor(red: 239/255.0, green: 130/255.0, blue: 100/255.0, alpha: 1.0), // orange
        UIColor(red: 77/255.0, green: 75/255.0, blue: 82/255.0, alpha: 1.0), // dark
        UIColor(red: 105/255.0, green: 94/255.0, blue: 133/255.0, alpha: 1.0), // purple
        UIColor(red: 85/255.0, green: 176/255.0, blue: 112/255.0, alpha: 1.0), // green
        UIColor(red: 128/255.0, green: 132/255.0, blue: 43/255.0, alpha: 1.0), // olive
        UIColor(red: 255/255.0, green: 215/255.0, blue: 165/255.0, alpha: 1.0), // nude
        UIColor(red: 152/255.0, green: 242/255.0, blue: 204/255.0, alpha: 1.0), // mint green
        UIColor(red: 255/255.0, green: 141/255.0, blue: 158/255.0, alpha: 1.0), // pink
        UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1.0), // white
        UIColor(red: 255/255.0, green: 223/255.0, blue: 186/255.0, alpha: 1.0), // peach
        UIColor(red: 204/255.0, green: 204/255.0, blue: 255/255.0, alpha: 1.0), // lavender
        UIColor(red: 255/255.0, green: 255/255.0, blue: 204/255.0, alpha: 1.0), // light yellow
        UIColor(red: 230/255.0, green: 230/255.0, blue: 250/255.0, alpha: 1.0), // light purple
        UIColor(red: 173/255.0, green: 216/255.0, blue: 230/255.0, alpha: 1.0), // light blue
        UIColor(red: 144/255.0, green: 238/255.0, blue: 144/255.0, alpha: 1.0), // light green
        UIColor(red: 255/255.0, green: 182/255.0, blue: 193/255.0, alpha: 1.0), // light pink
        UIColor(red: 240/255.0, green: 230/255.0, blue: 140/255.0, alpha: 1.0), // khaki
        UIColor(red: 245/255.0, green: 222/255.0, blue: 179/255.0, alpha: 1.0), // wheat
    ]
    
    func randomColour() -> UIColor {
        let randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: colours.count)
        return colours[randomNumber]
    }
}


