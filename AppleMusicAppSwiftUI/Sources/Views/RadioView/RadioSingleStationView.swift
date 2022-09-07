//
//  RadioSingleStationView.swift
//  AppleMusicAppSwiftUI
//
//  Created by Dmitry Dorodniy on 07.09.2022.
//

import SwiftUI

struct RadioSingleStationView: View {
    
    let station: RadioModel

    var body: some View {
        HStack {
            Image(station.imageSqr)
                .resizable()
                .scaledToFit()
                .frame(width: 100,
                       height: 100)
                .cornerRadius(10)

            VStack(alignment: .leading) {
                Text(station.title)
                    .font(.title2)
                Text("Apple Music station")
                    .foregroundColor(.secondary)
            }
            Spacer()
        }

    }
}

struct RadioSingleStationView_Previews: PreviewProvider {
    static var previews: some View {
        RadioSingleStationView(station: RadioModel.covers[0]).previewLayout(.sizeThatFits)
    }
}
