//
//  SearchViewController.swift
//  AppleMusicAppSwiftUI
//
//  Created by Dmitry Dorodniy on 15.09.2022.
//

import UIKit

class SearchViewController: UIViewController {


    let music = Music()

    private lazy var collectionView: UICollectionView = {
        let collection = UICollectionView()
        collection.delegate = self
        collection.dataSource = self
        return collection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }

}
