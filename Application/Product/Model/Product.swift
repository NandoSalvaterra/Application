//
//  Product.swift
//  Application
//
//  Created by Luiz Fernando Salvaterra on 18/07/21.
//

import Foundation
import Library

class Product {

    public var id: String?
    public var name: String?
    public var information: String?
    public var imageURL: String?
    public var price: String?
    public var color: CustomColor?
    public var created: Date?

    init() { }

    init(libraryProduct: LibraryProduct) {
        self.id = libraryProduct.id
        self.name = libraryProduct.name
        self.information = libraryProduct.information
        self.imageURL = libraryProduct.imageURL
        self.price = libraryProduct.price
        self.color =  CustomColor(rawValue: libraryProduct.color ?? "") ?? .gray
        self.created = libraryProduct.created
    }

    static func mock() -> Product {
        let product = Product()
        product.id = "1"
        product.name = "Produto falso criado como mock data"
        product.information = "Descrição do produto criado de forma falsa para preencher dados"
        product.imageURL = "http://lorempixel.com/640/480/technics/"
        product.price = "123.00"
        product.color = .green
        product.created = Date()
        return product
    }
}
