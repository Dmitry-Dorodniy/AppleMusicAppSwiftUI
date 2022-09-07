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
    @Environment(\.dismiss) var dismiss

    var body: some View {
        List(selection: $multiSelection) {
            ForEach(itemsList, id: \.self.id) { item in
                ListCell(item: item)
            }
            .onMove { itemsList.move(fromOffsets: $0, toOffset: $1) }
        }
        .environment(\.editMode, .constant(.active))
        .listStyle(.plain)
        .toolbar {
            NavigationLink {
            } label: {
                Button {
                    dismiss()
                } label: {
                    Text("Done")
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
