//
//  Common.swift
//  dhlottery-api
//
//  Created by junehee on 6/7/24.
//

import UIKit

struct Color {
    static func randomBgColor() -> UIColor? {
        let red = UIColor(red: 255/255, green: 102/255, blue: 102/255, alpha: 1)
        let yellow = UIColor(red: 203/255, green: 255/255, blue: 100/255, alpha: 1)
        let green = UIColor(red: 102/255, green: 255/255, blue: 102/255, alpha: 1)
        let purple = UIColor(red: 102/255, green: 102/255, blue: 255/255, alpha: 1)
        let gray = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1)
        
        let colors = [red, yellow, green, purple, gray]
        
        return colors.randomElement()
    }
}
