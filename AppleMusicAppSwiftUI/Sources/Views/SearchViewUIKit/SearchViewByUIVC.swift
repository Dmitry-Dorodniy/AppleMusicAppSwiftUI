//
//  SearchViewByUIVC.swift
//  AppleMusicAppSwiftUI
//
//  Created by Dmitry Dorodniy on 18.09.2022.
//

import SwiftUI

struct SearchViewByUIVC: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let navigationController = UINavigationController(rootViewController: SearchViewController())
        return navigationController
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
}
