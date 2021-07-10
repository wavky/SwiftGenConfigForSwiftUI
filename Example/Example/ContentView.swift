//
//  ContentView.swift
//  Example
//
//  Created by Wavky on 2021/07/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            Spacer()
            VStack() {
                Text("★★★★★")
                    .foregroundColor(
                        Asset.Color.star.color
                    )
                Text("5 stars")
            }.font(.caption)
            VStack(alignment: .leading) {
                HStack() {
                    Text(
                        L10n.Avocado.toast.key
                    ).font(.title)
                    Spacer()
                    Image(
                        Asset.Image.avocado.name
                    )
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 150, alignment: .center)
                    .alignmentGuide(.lastTextBaseline, computeValue: {
                        dimension in
                        dimension[.bottom]
                    })
                    Spacer()
                }.lineLimit(1)
                Text("Ingredients: Avocado, Almond Butter, Bread, Red Pepper Flakes")
                    .font(.caption)
                    .lineLimit(1)
            }
        }.frame(width: 350, height: 200, alignment: .leading)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
