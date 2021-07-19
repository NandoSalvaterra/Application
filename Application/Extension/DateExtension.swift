//
//  DateExtension.swift
//  Application
//
//  Created by Luiz Fernando Salvaterra on 19/07/21.
//

import Foundation

extension Date {

var readableText: String {
    let dateFormatter = DateFormatter()
    let format = "dd/MM/YYYY"
    dateFormatter.dateFormat = format
    return dateFormatter.string(from: self)
}

}
