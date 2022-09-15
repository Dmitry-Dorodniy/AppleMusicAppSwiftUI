//
//  PlayerView.swift
//  AppleMusicAppSwiftUI
//
//  Created by Dmitry Dorodniy on 04.09.2022.
//

import SwiftUI

struct PlayerView: View {

    var animation: Namespace.ID
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

                    PlayerCoverView(expand: $expand)

                    if !expand {
                        Text(currentMusic.track)
                            .font(.title3)
                        //                        .fontWeight(.bold)
                        //                    .foregroundColor(.secondary)
                            .matchedGeometryEffect(id: "Title", in: animation)
                            .padding(.leading, -10)

                        Spacer()

                        Button {
                            print("play")
                        } label: {
                            PlayerButtonImage(systemName: "play.fill", size: 25)
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
                            //                        if expand {
                            VStack(alignment: .leading, spacing: 10) {
                                Text(currentMusic.track)
                                    .font(.title3)
//                                    .foregroundColor(.white)
//                                   .matchedGeometryEffect(id: "Title", in: animation)

                                Text(currentMusic.album)
                                    .foregroundColor(.secondary)
//                                    .padding(.top, 3)
                                //                                .matchedGeometryEffect(id: "Label", in: animation)
                            }
                           .matchedGeometryEffect(id: "Title", in: animation)
                            //   }

                            Spacer()

                            Button {
                                print("more...")
                            } label: {
                                PlayerButtonImage(systemName: "ellipsis", size: 20)
                            }
                        }
                        .padding()

                        PlayerProgressLine()

                        PlayerExtendedControlModul()
                        

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
//                    .matchedGeometryEffect(id: "Title", in: animation)
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

//struct PlayerView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlayerView()
//            .previewLayout(.fixed(width: 400, height: 100))
//    }
//}

enum Metric {
    static var playerHeight: CGFloat = 90
    static var screenHeight = UIScreen.main.bounds.height
//    static var safeArea = UIApplication.shared.windows.first?.safeAreaInsets
}
