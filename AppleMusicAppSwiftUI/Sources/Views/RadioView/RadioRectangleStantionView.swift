//
//  RadioRectangleStantionView.swift
//  AppleMusicAppSwiftUI
//
//  Created by Dmitry Dorodniy on 07.09.2022.
//

import SwiftUI

struct RadioRectangleStantionView: View {

    let cover: RadioModel

    var body: some View {
        VStack(alignment: .leading) {
            Divider()
            Text("featured station".uppercased())
                .foregroundColor(.secondary)
                .font(.caption2)
            Text(cover.title)
                .font(.title3)
                .padding(.bottom, -5)
            Text("Apple Music station")
                .foregroundColor(.secondary)
            ZStack(alignment: .bottomLeading) {
                if let image = cover.imageRect {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                }
                Text("Apple Music station")
                    .foregroundColor(.white)
                    .padding([.leading, .bottom], 5)
            }
        }
        .padding(.leading, 5)
    }
}

struct RadioRectangleStantionView_Previews: PreviewProvider {
    static var previews: some View {
        RadioRectangleStantionView(cover: RadioModel.covers[0]).previewLayout(.sizeThatFits)
    }
}
