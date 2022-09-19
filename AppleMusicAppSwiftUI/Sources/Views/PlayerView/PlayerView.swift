//
//  PlayerView.swift
//  AppleMusicAppSwiftUI
//
//  Created by Dmitry Dorodniy on 04.09.2022.
//

import SwiftUI

struct PlayerView: View {

    var animation: Namespace.ID
    @Binding var isPlaying: Bool
    @Binding var expand: Bool
    @State private var volume: CGFloat = 7
    @State private var albums = Music().albums
    @EnvironmentObject var currentMusic: CurrentMusic
  

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(UIColor.secondarySystemBackground))
                .frame(maxHeight: expand ? .infinity : Metric.playerHeight)
                .opacity(0.95)

            VStack {

                if expand {
                Capsule()
                    .fill(.secondary)
                    .frame(width: expand ? 60 : 0, height: expand ? 4 : 0)
                    .opacity(expand ? 1 : 0)
                    .padding(.top, expand ? 30 : 0)
                    .padding(.vertical, expand ? 30 : 0)
                }

                HStack {

                    PlayerCoverView(expand: $expand, isPlaying: $isPlaying)

                    if !expand {
                        Text(currentMusic.track)
                            .font(.title3)
                            .matchedGeometryEffect(id: "Title", in: animation)
                            .padding(.leading, -10)

                        Spacer()

                        Button {
                            print("play")
                            isPlaying.toggle()
                        } label: {
                            PlayerButtonImage(systemName: isPlaying ? "pause.fill" : "play.fill", size: 25)
                        }

                        Button {
                            print("play")
                        } label: {
                            PlayerButtonImage(systemName: "forward.fill", size: 25)
                        }
                    }
                }

                // MARK: - Expanded view

                if expand {
                    VStack {
                        HStack {
                            VStack(alignment: .leading, spacing: 10) {
                                Text(currentMusic.track)
                                    .font(.title3)

                                Text(currentMusic.album)
                                    .foregroundColor(.secondary)
                            }
                           .matchedGeometryEffect(id: "Title", in: animation)

                            Spacer()

                            Button {
                                print("more...")
                            } label: {
                                PlayerButtonImage(systemName: "ellipsis", size: 20)
                            }
                        }
                        .padding()

                        PlayerProgressLine()

                        PlayerExtendedControlModul(isPlaying: $isPlaying)

                        HStack(spacing: 15) {
                            Image(systemName: "speaker.fill")
                            Slider(value: $volume, in: 0...10, onEditingChanged: {_ in
                                print("volume \(volume)")
                            })
                                .tint(.gray)
                            Image(systemName: "speaker.wave.2.fill")
                        }
                        .padding()

                        PlayerExtendedBottomButtons()
                            .padding()
                    }
                    .frame(width: expand ? nil : 0, height: expand ? nil : 0)
                    .opacity(expand ? 1 : 0)
                }
                if expand {
                    Spacer()
                }
            }
        }
        .onTapGesture(count: 1) {
            withAnimation(.spring()){
                expand.toggle()
            }
        }
    }
}

enum Metric {
    static var playerHeight: CGFloat = 90
    static var screenHeight = UIScreen.main.bounds.height
}
