//
//  PlayerButtonImage.swift
//  AppleMusicAppSwiftUI
//
//  Created by Dmitry Dorodniy on 05.09.2022.
//

import SwiftUI

struct PlayerButtonImage: View {

    var systemName: String
    var size: CGFloat
    
    var body: some View {
        Image(systemName: systemName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: size, height: size)
            .padding()
            .foregroundColor(.primary)
    }
}

struct PlayerButtonImage_Previews: PreviewProvider {
    static var previews: some View {
        PlayerButtonImage(systemName: "play", size: 15)
    }
}
