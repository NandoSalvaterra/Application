//
//  ProductListView.swift
//  Application
//
//  Created by Luiz Fernando Salvaterra on 18/07/21.
//

import SwiftUI
import Library

struct ProductListView: View {
    
    @State private var priceSearchText = ""
    @State private var showingOptions = false

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $priceSearchText)
                List {
                    ForEach(array, id: \.self) { imageName in
                        ProductRowView(product: Product.mock())
                    }
                }.listStyle(PlainListStyle())
                .actionSheet(isPresented: $showingOptions) {
                    ActionSheet(
                        title: Text("Buscar:"),
                        buttons: [
                            .default(Text("O mais caro")) {
                                // selection = "Red"
                            },

                            .default(Text("O mais barato")) {
                                //   selection = "Green"
                            }
                        ]
                    )
                }
            }.navigationTitle("Produtos")
            .navigationBarItems(
                trailing: Image(systemName: "ellipsis.circle")
                    .onTapGesture {
                        showingOptions = true
                    }
            )
            .onAppear(perform: {

            })
        }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}
