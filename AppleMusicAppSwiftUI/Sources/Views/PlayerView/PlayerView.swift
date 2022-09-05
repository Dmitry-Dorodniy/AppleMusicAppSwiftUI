//
//  PlayerView.swift
//  AppleMusicAppSwiftUI
//
//  Created by Dmitry Dorodniy on 04.09.2022.
//

import SwiftUI

struct PlayerView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(UIColor.secondarySystemBackground))
                .frame(maxWidth: .infinity, maxHeight: 100)
            
            HStack {

                PlayerCoverView()

                Text("Not playing")
                    .foregroundColor(.secondary)

                Spacer()

                Button {
                    print("play")
                } label: {
                    PlayerButtonImage(systemName: "play.fill")
                }

                Button {
                    print("play")
                } label: {
                    PlayerButtonImage(systemName: "forward.fill")
                }
            }
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
            .previewLayout(.fixed(width: 400, height: 100))
    }
}
