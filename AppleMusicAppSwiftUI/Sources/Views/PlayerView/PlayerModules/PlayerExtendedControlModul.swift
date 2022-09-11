//
//  PlayerExtendedControlModul.swift
//  AppleMusicAppSwiftUI
//
//  Created by Dmitry Dorodniy on 11.09.2022.
//

import SwiftUI

struct PlayerExtendedControlModul: View {
    var body: some View {
        HStack {
            Button {
                print("gobackward.15")
            } label: {
                PlayerButtonImage(systemName: "gobackward.15", size: 35)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Button {
                print("play")
            } label: {
                PlayerButtonImage(systemName: "play.fill", size: 35)
            }
            Spacer()
            Button {
                print("goforward.15")
            } label: {
                PlayerButtonImage(systemName: "goforward.15", size: 35)
            }
        }
        .padding([.leading, .trailing], 40)
    }
}

struct PlayerExpandedControlModul_Previews: PreviewProvider {
    static var previews: some View {
        PlayerExtendedControlModul()
    }
}
