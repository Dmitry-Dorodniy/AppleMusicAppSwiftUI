//
//  RadioModel.swift
//  AppleMusicAppSwiftUI
//
//  Created by Dmitry Dorodniy on 07.09.2022.
//

import Foundation

class Music: ObservableObject {
    @Published var stantions: [RadioModel] = RadioModel.covers
    @Published var albums: [TrackModel] = TrackModel.covers
}

class CurrentMusic: ObservableObject {
    @Published var track: String = "Wind of change"
    @Published var album: String = "Scorpions"
    @Published var coverImage: String = "ScorpionsStation"
}

struct RadioModel: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var imageRect: String?
    var imageSqr: String

    static var covers: [RadioModel] = [RadioModel(title: "Chillout",
                                                  imageRect: "Chillout",
                                                  imageSqr: "ChilloutStantion"),
                                       RadioModel(title: "Hip-Hop",
                                                  imageRect: "HipHop",
                                                  imageSqr: "HipHopStantion"),
                                       RadioModel(title: "Hits",
                                                  imageRect: "Hits",
                                                  imageSqr: "HitsStantion"),
                                       RadioModel(title: "Pop",
                                                  imageRect: "Pop",
                                                  imageSqr: "RussianPopStantion"),
                                       RadioModel(title: "Rock Classic",
                                                  imageRect: "RockClassic",
                                                  imageSqr: "RockRussianStantion"),
                                       RadioModel(title: "Smooth Jazz",
                                                  imageRect: "SmoothJazz",
                                                imageSqr: "SmoothJazzStantion")]
}

struct TrackModel: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var artist: String
    var imageSqr: String

    static var covers: [TrackModel] = [ TrackModel(title: "Berlin Lebt 3",
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
                                                   imageSqr: "WalkStantion")]
}
