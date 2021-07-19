//
//  CustomColor.swift
//  Application
//
//  Created by Luiz Fernando Salvaterra on 18/07/21.
//

import UIKit

enum CustomColor: String {

    case red
    case blue
    case green
    case yellow
    case orange
    case gray
}

extension UIColor {

    static let red: UIColor = UIColor(named: "Red")!
    static let blue: UIColor = UIColor(named: "Blue")!
    static let green: UIColor = UIColor(named: "Green")!
    static let yellow: UIColor = UIColor(named: "Yellow")!
    static let orange: UIColor = UIColor(named: "Orange")!
    static let gray: UIColor = UIColor(named: "Gray")!
}
