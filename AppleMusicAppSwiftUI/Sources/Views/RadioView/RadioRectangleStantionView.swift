//
//  RadioRectangleStantionView.swift
//  AppleMusicAppSwiftUI
//
//  Created by Dmitry Dorodniy on 07.09.2022.
//

import SwiftUI

struct RadioRectangleStantionView: View {

    let covers: RadioModel

    var body: some View {
        VStack(alignment: .leading) {
            Text("featured station".uppercased())
                .foregroundColor(.secondary)
                .font(.caption2)
            Text(covers.title)
                .font(.title3)
                .padding(.bottom, -5)
            Text("Apple Music station")
                .foregroundColor(.secondary)
            ZStack(alignment: .bottomLeading) {
                Image(covers.imageRect)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
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
        RadioRectangleStantionView(covers: RadioModel.covers[0]).previewLayout(.sizeThatFits)
    }
}
