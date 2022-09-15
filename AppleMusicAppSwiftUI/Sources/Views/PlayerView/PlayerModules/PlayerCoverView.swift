//
//  PlayerCoverView.swift
//  AppleMusicAppSwiftUI
//
//  Created by Dmitry Dorodniy on 05.09.2022.
//

import SwiftUI

struct PlayerCoverView: View {

    @Binding var expand: Bool
    @Binding var isPlaying: Bool
    @EnvironmentObject var currentMusic: CurrentMusic

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

            Image(currentMusic.coverImage)
                .resizable()
                .frame(width: expand ? Metric.screenHeight / 3 : 70,
                       height: expand ? Metric.screenHeight / 3 : 70)
                .cornerRadius(expand ? 10 : 0)
                .shadow(radius: 5, x: 2, y: 2)
                .scaledToFit()
        }
        .padding(20)
    }
}

