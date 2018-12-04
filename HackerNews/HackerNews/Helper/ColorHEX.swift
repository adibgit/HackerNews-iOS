//
//  ColorRGB.swift
//  HackerNews
//
//  Created by ADIB SURANI on 04/12/2018.
//  Copyright © 2018 Adib Surani. All rights reserved.
//

import Foundation
import UIKit
import SwiftHEXColors

struct ColorHEX {
    
    static func blackColor() -> UIColor { return UIColor(hexString: "#000000")! }
    static func whiteColor() -> UIColor { return UIColor(hexString: "#FFFFFF")! }
    static func greyColor()  -> UIColor { return UIColor(hexString: "#A1A1A1")! }
    static func redColor()  -> UIColor { return UIColor(hexString: "#A30000")! }
    static func lightPurpleColor() -> UIColor { return UIColor(hexString: "#7E57C2")! }
    static func transparentColor() -> UIColor { return UIColor(hexString: "#FFFFFF", alpha: 0.0)! }
    
}
