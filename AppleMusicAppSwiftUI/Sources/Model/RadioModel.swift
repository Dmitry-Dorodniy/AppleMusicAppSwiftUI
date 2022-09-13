//
//  RadioModel.swift
//  AppleMusicAppSwiftUI
//
//  Created by Dmitry Dorodniy on 07.09.2022.
//

import Foundation

class Music: ObservableObject {
    @Published var stantions: [RadioModel] = RadioModel.covers
    @Published var albums: [AlbumModel] = AlbumModel.covers
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

struct AlbumModel: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var imageSqr: String

    static var covers: [AlbumModel] = [ AlbumModel(title: "Berlin Lebt 3",
                                                   imageSqr: "BerlinLebtStantion"),
                                        AlbumModel(title: "Wind Of Change",
                                                   imageSqr: "ScorpionsStation"),
                                        AlbumModel(title: "Big Shmoke",
                                                   imageSqr: "BigShmokeStantion"),
                                        AlbumModel(title: "Chemical Heart",
                                                   imageSqr: "ChemicalHeart"),
                                        AlbumModel(title: "Day Of Groundhog",
                                                   imageSqr: "DayOfGroundhogStantion"),
                                        AlbumModel(title: "MirrorMan".uppercased(),
                                                   imageSqr: "MirrorMan"),
                                        AlbumModel(title: "Street Bully".uppercased(),
                                                   imageSqr: "StreetBullyStantion"),
                                        AlbumModel(title: "Walk".uppercased(),
                                                   imageSqr: "WalkStantion")]
}
