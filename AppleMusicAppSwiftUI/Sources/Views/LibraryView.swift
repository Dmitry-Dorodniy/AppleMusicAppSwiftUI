//
//  LibraryView.swift
//  AppleMusicAppSwiftUI
//
//  Created by Dmitry Dorodniy on 04.09.2022.
//

import SwiftUI



struct LibraryView: View {
  
    var body: some View {

            VStack(alignment: .center, spacing: 5) {
                Text("Looking for your music?")
                    .font(.title)
                    .bold()
                Text("Here will appear music you bought in iTunes Store.")
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding()
                Spacer()
                    .frame(height: 70)
            }


                .navigationTitle("Library")
               
        }

    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
