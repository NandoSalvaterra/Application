//
//  ProductListViewModel.swift
//  Application
//
//  Created by Luiz Fernando Salvaterra on 18/07/21.
//

import Foundation
import Combine
import Library

class ProductListViewModel: ObservableObject {

    @Published var products: [Product] = []
    @Published var filteredProducts: [Product] = []
    @Published var showLoadingView = false
    @Published var showErrorView = false

    private let provider: ProductProvider
    private var cancellables = Set<AnyCancellable>()

    init() {
        self.provider = ProductProvider()
    }

    func fetchProducts() {
        showLoadingView = true
        provider.getProducts()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    self.showLoadingView = false
                case .failure:
                    self.showErrorView = true
                }
            } receiveValue: { libraryProducts in
                self.products = libraryProducts.map{ Product(libraryProduct: $0)}
            }.store(in: &cancellables)
    }

    func searchProducts(price: String) {
        if let doublePrice = Double(price) {
            provider.searchProduts(price: doublePrice)
                .receive(on: DispatchQueue.main)
                .sink { completion in
                    switch completion {
                    case .finished:
                        self.showLoadingView = false
                    case .failure:
                        self.showErrorView = true
                    }
                } receiveValue: { libraryProducts in
                    self.filteredProducts = libraryProducts.map{ Product(libraryProduct: $0)}
                }.store(in: &cancellables)
        } else {
            showErrorView = true
        }
    }

    func filterProducts(cost: ProductCost) {
        showLoadingView = true
        provider.filterProducts(cost: cost)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    self.showLoadingView = false
                case .failure:
                    self.showErrorView = true
                }
            } receiveValue: { libraryProduct in
                self.filteredProducts = [(Product(libraryProduct: libraryProduct))]
            }.store(in: &cancellables)
    }

    func clearFilters() {
        filteredProducts.removeAll()
    }

    func clearSearch() {

    }
}
