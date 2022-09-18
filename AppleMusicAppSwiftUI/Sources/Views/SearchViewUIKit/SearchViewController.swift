//
//  SearchViewController.swift
//  AppleMusicAppSwiftUI
//
//  Created by Dmitry Dorodniy on 15.09.2022.
//

import UIKit
import SwiftUI

class SearchViewController: UIViewController {

    let music = Music().albums

    private lazy var searchController: UISearchController = {
        let search = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search music..."
        searchController.searchBar.autocapitalizationType = .none
        search.delegate = self

        return search
    }()

    private lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.dataSource = self
        collection.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
       navigationItem.searchController = searchController
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Search"



//        view.addSubview(searchController)
//       view.addSubview(collectionView)
//        collectionView.frame = view.bounds
//


    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        collectionView.frame = view.bounds

    }

//    private func setupLayout() {
//        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
//
////        NSLayoutConstraint.activate([
////            searchController.leadingAnchor.constraint(equalTo: view.leadingAnchor),
////            searchController.trailingAnchor.constraint(equalTo: view.trailingAnchor),
////            searchController.topAnchor.constraint(equalTo: view.topAnchor),
////
////            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
////            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
////            collectionView.topAnchor.constraint(equalTo: searchController.bottomAnchor),
////            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
////
////        ])
//
//    }

    private func createLayout() -> UICollectionViewLayout {
        let spacing: CGFloat = 5

        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: spacing, leading: spacing, bottom: spacing, trailing: spacing)


        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(0.5))

        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 0, leading: 0, bottom: Metric.playerHeight, trailing: 0)

        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }


}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return music.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? SearchCollectionViewCell else { return UICollectionViewCell()}
        cell.configure(with: music[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)

        let cover = music[indexPath.row]
        print("selected \(cover.title)")
//        currentMusic.track = cover.title
//        currentMusic.coverImage = cover.imageSqr
//        currentMusic.album = cover.artist
    }
}

extension SearchViewController: UISearchControllerDelegate  {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
  


    }
}

//extension SearchViewController: UICollectionViewDelegateFlowLayout {
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return(CGSize(width: view.frame.size.width/2 - 10,
//                      height: view.frame.size.width/2 - 10))
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 5, left: 5, bottom: 3, right: 3)
//    }
//}

