//
//  GeneralView.swift
//  AppleMusicAppSwiftUI
//
//  Created by Dmitry Dorodniy on 04.09.2022.
//

import SwiftUI

struct GeneralView: View {

    @State var expand = false
    @State var isPlaying = false
    @Namespace var animation

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

                NavigationView {
                SearchView()
                      .navigationTitle("Search")
                }
                    .tabItem {
                        Text("Search")
                        Image(systemName:"magnifyingglass")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }

                NavigationView {
                    SearchViewByUIVC()
                }
                .tabItem {
                    Text("Search UIKit")
                    Image(systemName:"arrow.up.left.and.down.right.magnifyingglass")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
        }
        .safeAreaInset(edge: .bottom) {
            PlayerView(animation: animation,
                       isPlaying: $isPlaying,
                       expand: $expand)
                .offset(y: expand ? 0 : -(Metric.playerHeight / 2) + 6)
        }
        .ignoresSafeArea(expand ? .all : .keyboard)
    }
}

struct GeneralView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralView()
    }
}
