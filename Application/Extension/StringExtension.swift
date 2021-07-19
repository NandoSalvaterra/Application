//
//  StringExtension.swift
//  Application
//
//  Created by Luiz Fernando Salvaterra on 19/07/21.
//

import Foundation

extension String {

    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
