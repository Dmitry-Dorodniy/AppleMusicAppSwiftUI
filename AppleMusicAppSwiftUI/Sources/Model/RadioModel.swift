//
//  RadioModel.swift
//  AppleMusicAppSwiftUI
//
//  Created by Dmitry Dorodniy on 07.09.2022.
//

import Foundation

class Radio: ObservableObject {
    @Published var covers: [RadioModel] = RadioModel.covers
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
                                                imageSqr: "SmoothJazzStantion"),
                                       RadioModel(title: "Berlin Lebt 3",
                                                  imageSqr: "BerlinLebtStantion"),
                                       RadioModel(title: "Wind Of Change",
                                                  imageSqr: "ScorpionsStation"),
                                       RadioModel(title: "Big Shmoke",
                                                  imageSqr: "BigShmokeStantion"),
                                       RadioModel(title: "Chemical Heart",
                                                  imageSqr: "ChemicalHeart"),
                                       RadioModel(title: "Day Of Groundhog",
                                                  imageSqr: "DayOfGroundhogStantion"),
                                       RadioModel(title: "MirrorMan".uppercased(),
                                                  imageSqr: "MirrorMan"),
                                       RadioModel(title: "Street Bully".uppercased(),
                                                  imageSqr: "StreetBullyStantion"),
                                       RadioModel(title: "Walk".uppercased(),
                                                  imageSqr: "WalkStantion")]
}
