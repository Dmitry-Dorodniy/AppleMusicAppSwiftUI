//
//  SearchView.swift
//  AppleMusicAppSwiftUI
//
//  Created by Dmitry Dorodniy on 09.09.2022.
//

import SwiftUI

struct SearchView: View {
    @State private var search = ""
    @State private var radioCovers = RadioModel.covers
    
    let columns = Array(repeating: GridItem(.flexible(), spacing: 20), count: 2)

    var body: some View {

        ScrollView {
            VStack(spacing: 18) {
                HStack(spacing: 15) {
                    Image(systemName: "magnifyingglass")
                    TextField("Search", text: $search)
                }
                .padding(.vertical, 10)
                .padding(.horizontal)
                .background(Color.primary.opacity(0.06))
                .cornerRadius(15)

                LazyVGrid(columns: columns, spacing: 15) {
                    ForEach(radioCovers) { cover in
                        NavigationLink {
                            SearchDetailView()
                                .navigationTitle(cover.title)
                        } label: {
                            ZStack(alignment: .bottomLeading) {
                                Image(cover.imageSqr)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: (UIScreen.main.bounds.width - 50) / 2,
                                           height: 180)
                                    .cornerRadius(15)

                                Spacer()
                                Text(cover.title)
                                    .foregroundColor(.white)
                                    .padding([.bottom, .leading], 15)
                        }
                        }

//                        Button {
//                            print("\(cover.title) pressed")
//                        } label: {
//                            ZStack(alignment: .bottomLeading) {
//                                Image(cover.imageSqr)
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fill)
//                                    .frame(width: (UIScreen.main.bounds.width - 50) / 2,
//                                           height: 180)
//                                    .cornerRadius(15)
//
//                                Spacer()
//                                Text(cover.title)
//                                    .foregroundColor(.white)
//                                    .padding([.bottom, .leading], 15)
//                            }
//                        }
                    }
                }
                .padding(.top, 10)
            }
            .padding()
            .padding(.bottom, Metric.playerHeight)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
