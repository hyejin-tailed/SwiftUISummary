//
//  Color+Extension.swift
//  SwiftUISummary
//
//  Created by Hailey on 2020/03/27.
//  Copyright © 2020 Hailey. All rights reserved.
//

import Foundation
import SwiftUI

extension Color {
    init(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat = 1) {
        let rColor : CGFloat = r / 255
        let gColor : CGFloat = g / 255
        let bColor : CGFloat = b / 255

        let thisColor = UIColor(red: rColor, green: gColor, blue: bColor, alpha: alpha)
        self = Color(thisColor)
    }
}

extension Color {

    public static var sunflowerYellow : Color {
        return Color.init(r: 255, g: 224, b: 0)
    }
    
    public static var warmBlue : Color {
        return Color.init(r: 65, g: 67, b: 228)
    }
}
