//
//  ProductListViewModel.swift
//  Application
//
//  Created by Luiz Fernando Salvaterra on 18/07/21.
//

import Foundation
import Library

class ProductListViewModel: ObservableObject {

    @Published var products: [Product] = []
    @Published var showLoadingView = false

    init() {

    }

    func fetchProducts() {

    }

}
