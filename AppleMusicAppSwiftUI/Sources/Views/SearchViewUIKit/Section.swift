//
//  Section.swift
//  AppleMusicAppSwiftUI
//
//  Created by Dmitry Dorodniy on 29.09.2022.
//

import UIKit
// 1
struct Section: Hashable {
    var id = UUID()
    var title: String
    var items: [TrackModel]

}

extension Section {
    static var allSections: [Section] = [
        Section(title: "Tracks", items: [TrackModel(title: "Berlin Lebt 3",
                                                    artist: "Tarek",
                                                    imageSqr: "BerlinLebtStantion"),
                                         TrackModel(title: "Wind Of Change",
                                                    artist: "Scorpions",
                                                    imageSqr: "ScorpionsStation"),
                                         TrackModel(title: "Big Shmoke",
                                                    artist: "Kweku Smoke",
                                                    imageSqr: "BigShmokeStantion"),
                                         TrackModel(title: "Chemical Heart",
                                                    artist: "NSD Tommy",
                                                    imageSqr: "ChemicalHeart"),
                                         TrackModel(title: "Day Of Groundhog",
                                                    artist: "Scorpions",
                                                    imageSqr: "DayOfGroundhogStantion"),
                                         TrackModel(title: "MirrorMan".uppercased(),
                                                    artist: "Sipho the Gift",
                                                    imageSqr: "MirrorMan"),
                                         TrackModel(title: "Street Bully".uppercased(),
                                                    artist: "2PHACE CAPONE",
                                                    imageSqr: "StreetBullyStantion"),
                                         TrackModel(title: "Walk".uppercased(),
                                                    artist: "MINUSUSHI, BXNOSTOWN",
                                                    imageSqr: "WalkStantion")]),

        Section(title: "Stantions", items: [TrackModel(title: "Chillout",
                                                       artist: "radio",
                                                       imageSqr: "ChilloutStantion",
                                                       imageRect: "Chillout"),
                                            TrackModel(title: "Hip-Hop",
                                                       artist: "radio",
                                                       imageSqr: "HipHopStantion",
                                                       imageRect: "HipHop"),
                                            TrackModel(title: "Hits",
                                                       artist: "radio",
                                                       imageSqr: "HitsStantion",
                                                       imageRect: "Hits"),
                                            TrackModel(title: "Pop",
                                                       artist: "radio",
                                                       imageSqr: "RussianPopStantion",
                                                       imageRect: "Pop"),
                                            TrackModel(title: "Rock Classic",
                                                       artist: "radio",
                                                       imageSqr: "RockRussianStantion",
                                                       imageRect: "RockClassic"),
                                            TrackModel(title: "Smooth Jazz",
                                                       artist: "radio",
                                                       imageSqr: "SmoothJazzStantion",
                                                       imageRect: "SmoothJazz")
        ])]
}
