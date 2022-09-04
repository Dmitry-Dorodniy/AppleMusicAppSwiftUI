//
//  GeneralView.swift
//  AppleMusicAppSwiftUI
//
//  Created by Dmitry Dorodniy on 04.09.2022.
//

import SwiftUI

struct GeneralView: View {
    var body: some View {
        ZStack {
            TabView {
                NavigationView {
                    LibraryView()
                        .toolbar {
                            EditButton()
//                                .tint(.red)
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
//            .tint(.red)
//            .accentColor(.red)
        }
    }
}

struct GeneralView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralView()
    }
}
