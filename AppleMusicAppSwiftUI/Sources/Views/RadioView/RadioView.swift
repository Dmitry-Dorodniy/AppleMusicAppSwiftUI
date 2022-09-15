//
//  RadioView.swift
//  AppleMusicAppSwiftUI
//
//  Created by Dmitry Dorodniy on 07.09.2022.
//

import SwiftUI

struct RadioView: View {

    @State private var radio = Music().stantions
    let rows = [GridItem(.flexible())]
    let columns = [GridItem(.flexible())]
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: rows) {
                        ForEach(radio) { cover in
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
                    ForEach(radio) { cover in
                        RadioSingleStationView(cover: cover)
                    }
                }
            }
            .padding(.bottom, Metric.playerHeight)
        }
    }
}

struct RadioView_Previews: PreviewProvider {
    static var previews: some View {
        RadioView()
    }
}
