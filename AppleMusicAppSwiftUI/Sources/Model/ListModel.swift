//
//  ListModel.swift
//  AppleMusicAppSwiftUI
//
//  Created by Dmitry Dorodniy on 04.09.2022.
//

import Foundation

struct ListModel: Identifiable, Hashable {
    let name: String
    let icon: String
    let id = UUID()

    static var items: [ListModel] = [ListModel(name: "Плейлисты",
                                               icon: "music.note.list"),
                                     ListModel(name: "Артисты",
                                               icon: "music.mic"),
                                     ListModel(name: "Альбомы",
                                               icon: "square.stack"),
                                     ListModel(name: "Песни",
                                               icon: "music.note"),
                                     ListModel(name: "Телешоу и фильмы",
                                               icon: "tv"),
                                     ListModel(name: "Видеоклипы",
                                               icon: "music.note.tv"),
                                     ListModel(name: "Жанры",
                                               icon: "guitars"),
                                     ListModel(name: "Сборники",
                                               icon: "person.2.crop.square.stack"),
                                     ListModel(name: "Авторы",
                                               icon: "music.quarternote.3"),
                                     ListModel(name: "Загружено",
                                               icon: "arrow.down.circle"),
                                     ListModel(name: "Домашняя коллекция",
                                               icon: "music.note.house")]
}
