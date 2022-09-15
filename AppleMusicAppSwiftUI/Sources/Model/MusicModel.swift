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
                                                   artist: "Berlin Lebt 3",
                                                   imageSqr: "BerlinLebtStantion"),
                                        TrackModel(title: "Wind Of Change",
                                                   artist: "Scorpions",
                                                   imageSqr: "ScorpionsStation"),
                                        TrackModel(title: "Big Shmoke",
                                                   artist: "Scorpions",
                                                   imageSqr: "BigShmokeStantion"),
                                        TrackModel(title: "Chemical Heart",
                                                   artist: "Scorpions",
                                                   imageSqr: "ChemicalHeart"),
                                        TrackModel(title: "Day Of Groundhog",
                                                   artist: "Scorpions",
                                                   imageSqr: "DayOfGroundhogStantion"),
                                        TrackModel(title: "MirrorMan".uppercased(),
                                                   artist: "Scorpions",
                                                   imageSqr: "MirrorMan"),
                                        TrackModel(title: "Street Bully".uppercased(),
                                                   artist: "Scorpions",
                                                   imageSqr: "StreetBullyStantion"),
                                        TrackModel(title: "Walk".uppercased(),
                                                   artist: "Scorpions",
                                                   imageSqr: "WalkStantion")]
}

class CurrentMusic: ObservableObject {
    @Published var track: String = "Wind of change"
    @Published var album: String = "Scorpions"
    @Published var coverImage: String = "ScorpionsStation"
}
