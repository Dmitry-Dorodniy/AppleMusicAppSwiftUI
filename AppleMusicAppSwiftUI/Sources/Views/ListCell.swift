//
//  ListCell.swift
//  AppleMusicAppSwiftUI
//
//  Created by Dmitry Dorodniy on 04.09.2022.
//

import SwiftUI

struct ListCell: View {
    let item: ListModel

    var body: some View {
        HStack {
            Image(systemName: item.icon)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .foregroundColor(.accentColor)
                .padding([.trailing], 6)
            Text(item.name)
                .font(.title3)
                .padding([.top, .bottom], 5)
        }
    }
}

struct ListCell_Previews: PreviewProvider {
    static var previews: some View {
        ListCell(item: ListModel.items[0])
            .previewLayout(.fixed(width: 400, height: 50))
    }
}
