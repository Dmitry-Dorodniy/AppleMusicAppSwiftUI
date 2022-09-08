//
//  PlayerCoverView.swift
//  AppleMusicAppSwiftUI
//
//  Created by Dmitry Dorodniy on 05.09.2022.
//

import SwiftUI

struct PlayerCoverView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(UIColor.systemGray5))
                .frame(width: 70, height: 70)
                .shadow(radius: 5, x: 2, y: 2)
                .opacity(0.4)
            Image(systemName: "music.note")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .opacity(0.1)
            Image("Scorpions")
                .resizable()
                .frame(width: 70, height: 70)
                .scaledToFit()
        }
        .padding(20)
    }
}

struct PlayerCoverView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerCoverView()
    }
}
