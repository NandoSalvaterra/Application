//
//  ProductListView.swift
//  Application
//
//  Created by Luiz Fernando Salvaterra on 18/07/21.
//

import SwiftUI
import Library

struct ProductListView: View {

    @StateObject private var viewModel = ProductListViewModel()
    @State private var priceSearchText = ""
    @State private var isFiltering = false
    @State private var showingOptions = false

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    SearchBar(text: $priceSearchText)
                    List {
                        ForEach(isFiltering ? viewModel.filteredProducts : viewModel.products , id: \.id) { product in
                            ProductRowView(product: product)
                        }
                    }.listStyle(PlainListStyle())
                    .actionSheet(isPresented: $showingOptions) {
                        ActionSheet(
                            title: Text("search".localized),
                            buttons: [
                                .default(Text("expensive".localized)) {
                                    isFiltering = true
                                    viewModel.filterProducts(cost: .highest)
                                },

                                .default(Text("cheapest".localized)) {
                                    isFiltering = true
                                    viewModel.filterProducts(cost: .lowest)
                                },
                                .default(Text("clear_filter".localized)) {
                                    isFiltering = false
                                    viewModel.clearFilters()
                                },
                            ]
                        )
                    }
                }
                if viewModel.showLoadingView {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .frame(width: 120, height: 120, alignment: .center)
                        .background(Color(#colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 0.9045599075)))
                        .cornerRadius(8)
                }
            }.navigationTitle("products".localized)
            .navigationBarItems(
                trailing: Image(systemName: "ellipsis.circle")
                    .foregroundColor( isFiltering ? .blue : .black)
                    .onTapGesture {
                        showingOptions = true
                    }
            )
            .alert(isPresented: $viewModel.showErrorView, content: {
                Alert(title: Text("error".localized), message: Text("error_message".localized), dismissButton: .default(Text("Ok")))
            })
            .onAppear(perform: {
                viewModel.fetchProducts()
            })
            .onChange(of: priceSearchText) { text in
                isFiltering = !text.isEmpty
                if text.isEmpty { return }
                viewModel.searchProducts(price: text)
            }
        }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}
