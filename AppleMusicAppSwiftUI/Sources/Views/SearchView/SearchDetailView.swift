//
//  SearchDetailView.swift
//  AppleMusicAppSwiftUI
//
//  Created by Dmitry Dorodniy on 12.09.2022.
//

import SwiftUI

struct SearchDetailView: View {
    
var selectedRadio: RadioModel
@StateObject var radio = Music()
    
    
    let rows = [GridItem(.flexible())]
    let columns = [GridItem(.flexible())]

    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                ScrollView(.horizontal, showsIndicators: false) {

                    LazyHGrid(rows: rows) {
                        RadioRectangleStantionView(cover: selectedRadio)
                        ForEach(radio.stantions) { cover in
                            if cover.imageRect != nil {
                                RadioRectangleStantionView(cover: cover)
                            }
                        }
                    }
                }
                Divider()
                    .padding(.leading, 5)
                Text("Stantion")
                    .bold()
                    .font(.title)
                    .padding(.leading, 5)

                LazyVGrid(columns: columns) {
//                    ForEach(radio) { cover in
//                        RadioSingleStationView(cover: cover)
//                    }
                }
            }
            .padding(.bottom, Metric.playerHeight)
        }
    }
}

struct SearchDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SearchDetailView(selectedRadio: RadioModel.covers[0])
    }
}

