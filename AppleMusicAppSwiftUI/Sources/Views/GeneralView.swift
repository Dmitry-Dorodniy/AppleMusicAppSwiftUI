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
        ZStack {
            TabView {
                NavigationView {
                    LibraryView()
                        .navigationTitle("Library")
                        .toolbar {
                            NavigationLink {
                                ListView()
                                    .navigationTitle("Library")
                            } label: {
                                Text("Edit")
                            }
                        }
                }
                .tabItem {
                    Text("Library")
                    Image("note")
                        .renderingMode(.template)
                }

                NavigationView {
                RadioView()
                        .navigationTitle("Radio")
                }

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
        }
        .safeAreaInset(edge: .bottom) {
            PlayerView()
                .offset(y: -45)
        }
    }
}

struct GeneralView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralView()
    }
}
