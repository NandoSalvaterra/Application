//
//  ProductRowView.swift
//  Application
//
//  Created by Luiz Fernando Salvaterra on 18/07/21.
//

import SwiftUI

struct ProductRowView: View {

    let product: Product

    var body: some View {
        HStack(spacing: 0) {
            AsyncImage(
                url: URL(string: "http://lorempixel.com/640/480/people/")!,
                placeholder: { ProgressView() },
                image: { Image(uiImage: $0).resizable() }
            )
            .cornerRadius(4)
            .frame(width: 64, height: 64, alignment: .center)
            .padding(16)


            VStack(alignment: .leading, spacing: 4) {

                Text(product.name ?? "")
                    .font(.headline)

                Text(product.information ?? "")
                    .font(.caption)

                HStack {
                    Text("R$ 123,52")
                        .font(.caption)
                        .fixedSize()
                        .padding(6)
                        .background(Capsule().fill(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))))


                    HStack(spacing: 2) {
                        Image(systemName: "clock")
                        Text("10/02/2021")
                            .font(.caption)
                    }
                    .padding(4)
                    .background(Capsule().fill(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))))

                    Image(systemName: "pencil.tip.crop.circle")
                        .foregroundColor(.blue)
                }

            }.padding(.horizontal, 8)
            
            Spacer()
        }
    }
}

struct ProductRowView_Previews: PreviewProvider {
    static var previews: some View {
        ProductRowView(product: Product.mock())
    }
}
