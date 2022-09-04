//
//  GeneralView.swift
//  AppleMusicAppSwiftUI
//
//  Created by Dmitry Dorodniy on 04.09.2022.
//

import SwiftUI

struct GeneralView: View {

    init() {
        UITabBar.appearance().backgroundColor = UIColor.secondarySystemBackground
    }

    var body: some View {
        VStack {
            ZStack {
                TabView {
                    NavigationView {
                        LibraryView()
                            .toolbar {
                                EditButton()
                            }
                    }
                    .tabItem {
                        Text("Library")
                        Image("note")
                            .renderingMode(.template)

                    }

                    Text("RadioView")
                    .tabItem {
                        Text("Radio")
                        Image(systemName:"dot.radiowaves.left.and.right")
                    }

                    Text("Search")
                    .tabItem {
                        Text("Search")
                        Image(systemName:"magnifyingglass")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }

                }
                PlayerView()
                    .offset(y: 200)
            }

        }

    }
}

struct GeneralView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralView()
    }
}