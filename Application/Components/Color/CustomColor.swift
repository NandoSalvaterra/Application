//
//  CustomColor.swift
//  Application
//
//  Created by Luiz Fernando Salvaterra on 18/07/21.
//

import UIKit

enum CustomColor: String, CaseIterable {

    case red
    case blue
    case green
    case yellow
    case orange
    case gray

    func uiColor() -> UIColor {
        let color =  CustomColor.allCases.randomElement() ?? .gray
        switch color {
        case .red:
            return UIColor.red
        case .blue:
            return UIColor.blue
        case .green:
            return UIColor.green
        case .yellow:
            return UIColor.yellow
        case .orange:
            return UIColor.orange
        case .gray:
            return UIColor.gray
        }
    }
}

extension UIColor {

    static let red: UIColor = UIColor(named: "Red") ?? .gray
    static let blue: UIColor = UIColor(named: "Blue") ?? .gray
    static let green: UIColor = UIColor(named: "Green") ?? .gray
    static let yellow: UIColor = UIColor(named: "Yellow") ?? .gray
    static let orange: UIColor = UIColor(named: "Orange") ?? .gray
    static let gray: UIColor = UIColor(named: "Gray") ?? .gray
}
