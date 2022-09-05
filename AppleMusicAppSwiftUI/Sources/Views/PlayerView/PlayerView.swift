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
//                ZStack {
//                    RoundedRectangle(cornerRadius: 10)
//                        .fill(Color(UIColor.systemGray5))
//                        .frame(width: 70, height: 70)
//                        .shadow(radius: 5, x: 2, y: 2)
//                        .opacity(0.4)
//                    Image(systemName: "music.note")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 30, height: 30)
//                        .opacity(0.1)
//                }
//                .padding(20)

                Text("Not playing")
                    .foregroundColor(.secondary)

                Spacer()

                Button {
                    print("play")
                } label: {
                    Image(systemName: "play.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .padding()
                        .foregroundColor(.primary)
                }

                Button {
                    print("play")
                } label: {
                    Image(systemName: "forward.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .padding()
                        .foregroundColor(.secondary)
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
