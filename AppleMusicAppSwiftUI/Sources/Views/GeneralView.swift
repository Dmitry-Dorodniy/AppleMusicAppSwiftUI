//
//  GeneralView.swift
//  AppleMusicAppSwiftUI
//
//  Created by Dmitry Dorodniy on 04.09.2022.
//

import SwiftUI

struct GeneralView: View {

    @State var expand = false
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
            }
//            PlayerView(animation: animation, expand: $expand)
//                .padding(.bottom)
////                .offset(y: 229)
        }
        .safeAreaInset(edge: .bottom) {
            PlayerView(animation: animation, expand: $expand)
                .offset(y: expand ? 0 : -(Metric.playerHeight / 2) + 5)
        }
      //  .blur(radius: expand ? 20 : 0)
        .ignoresSafeArea(expand ? .all : .keyboard)
    }
}

struct GeneralView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralView()
    }
}
