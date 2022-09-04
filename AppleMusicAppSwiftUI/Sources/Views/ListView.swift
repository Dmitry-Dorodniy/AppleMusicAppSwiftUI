//
//  ListView.swift
//  AppleMusicAppSwiftUI
//
//  Created by Dmitry Dorodniy on 04.09.2022.
//

import SwiftUI

struct ListView: View {

    @State var itemsList = ListModel.items
    @State private var multiSelection = Set<UUID>()

    var body: some View {
        NavigationView {
        List(selection: $multiSelection) {
            ForEach(itemsList, id: \.self.id) { item in
                Text(item.name).tag(item.name)
            }
            .onMove { itemsList.move(fromOffsets: $0, toOffset: $1) }
//            Text($0.name)

        }

       .listStyle(.plain)
        .toolbar {
            EditButton()
        }
    }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
