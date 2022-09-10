//
//  SearchView.swift
//  AppleMusicAppSwiftUI
//
//  Created by Dmitry Dorodniy on 09.09.2022.
//

import SwiftUI

struct SearchView: View {
    @State var search = ""
    let columns = Array(repeating: GridItem(.flexible(), spacing: 20), count: 2)
    @State private var radioCovers = RadioModel.covers

    var body: some View {

        ScrollView {
        VStack(spacing: 18) {
//            HStack {
//            Text("Search")
//                    .font(.largeTitle)
//                    .fontWeight(.heavy)
//                    .foregroundColor(.primary)
//
//                Spacer(minLength: 0)
//            }

                HStack(spacing: 15) {
                    Image(systemName: "magnifyingglass")
                    //                .foregroundColor(.primary)

                    TextField("Search", text: $search)
                }
                .padding(.vertical, 10)
                .padding(.horizontal)
                .background(Color.primary.opacity(0.06))
                .cornerRadius(15)

                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(radioCovers) { cover in
                        Image(cover.imageSqr)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: (UIScreen.main.bounds.width - 50) / 2,
                                   height: 180)
                            .cornerRadius(15)
                    }
                }
            }
        .padding()

        }
}
                    }

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
