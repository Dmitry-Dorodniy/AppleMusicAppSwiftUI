//
//  SearchDetailView.swift
//  AppleMusicAppSwiftUI
//
//  Created by Dmitry Dorodniy on 12.09.2022.
//

import SwiftUI

struct SearchDetailView: View {
var radioCover: RadioModel

    var body: some View {

        Text(radioCover.title)
    }
}

struct SearchDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SearchDetailView(radioCover: RadioModel.covers[0])
    }
}
