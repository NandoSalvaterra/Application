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
                url: URL(string: product.imageURL ?? "")!,
                placeholder: { ProgressView() },
                image: { Image(uiImage: $0).resizable() }
            )
            .cornerRadius(4)
            .frame(width: 64, height: 64, alignment: .center)
            .padding(16)


            VStack(alignment: .leading, spacing: 4) {

                Text(product.name ?? "")
                    .font(.headline)

                Text("\("description".localized): \(product.information ?? "")")
                    .font(.caption)

                HStack {
                    Text("R$ \(product.price ?? "")")
                        .font(.caption)
                        .fixedSize()
                        .padding(6)
                        .background(Capsule().fill(Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1))))

                    HStack(spacing: 2) {
                        Image(systemName: "clock")
                        Text(product.created?.readableText ?? "")
                            .font(.caption)
                    }
                    .padding(4)
                    .background(Capsule().fill(Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1))))

                    Image(systemName: "pencil.tip.crop.circle")
                        .foregroundColor(Color.white)
                        .padding(4)

                        .background(Color(product.color!.uiColor()))
                        .cornerRadius(16)

                }.padding(.top, 6)

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
