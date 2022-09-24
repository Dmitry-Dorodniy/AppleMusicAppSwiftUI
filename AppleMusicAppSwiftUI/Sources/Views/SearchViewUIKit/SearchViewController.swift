//
//  SearchViewController.swift
//  AppleMusicAppSwiftUI
//
//  Created by Dmitry Dorodniy on 15.09.2022.
//

import UIKit

class SearchViewController: UIViewController {

    var music = Music().albums

    typealias DataSource = UICollectionViewDiffableDataSource<Section, TrackModel>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, TrackModel>

    private lazy var searchController: UISearchController = {
        let search = UISearchController(searchResultsController: nil)
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Search music..."
        search.searchBar.autocapitalizationType = .none
        search.delegate = self
        search.searchResultsUpdater = self

        return search
    }()

    private lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero,
                                          collectionViewLayout: createLayout())
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.dataSource = self
        collection.register(SearchCollectionViewCell.self,
                            forCellWithReuseIdentifier: "cell")
        return collection
    }()

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        collectionView.frame = view.bounds
    }

    // MARK: - Setup private functions

    private func setupView() {
        navigationItem.searchController = searchController
        navigationItem.title = "Search"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.addSubview(collectionView)
    }

    private func createLayout() -> UICollectionViewLayout {
        let spacing: CGFloat = 8

        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: spacing,
                                   leading: spacing,
                                   bottom: spacing,
                                   trailing: spacing)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(0.5))

        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 0,
                                      leading: 8,
                                      bottom: Metric.playerHeight,
                                      trailing: 8)

        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return music.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
                                                            for: indexPath) as? SearchCollectionViewCell else
                                                            { return UICollectionViewCell()}
        cell.configure(with: music[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)

        let cover = music[indexPath.row]
        print("selected \(cover.title)")

    //TODO: Add method to change PlayerView @ObservebleObject vars in SwiftUI from here
    }
}

// MARK: - UISearchResultsUpdating, UISearchControllerDelegate

extension SearchViewController: UISearchResultsUpdating, UISearchControllerDelegate {
    func updateSearchResults(for searchController: UISearchController) {

        if ((searchController.searchBar.text?.isEmpty) == false) {
            guard let text = searchController.searchBar.text else { return }
            let tracks = music.filter { track in
                track.title.lowercased().contains(text.lowercased())
            }
            music = tracks
        } else {
            music = Music().albums
        }
        collectionView.reloadData()
    }
}

// MARK: - Canvas SUI Preview

import SwiftUI
struct CanvasProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }

    struct ContainerView: UIViewControllerRepresentable {

        let vc = SearchViewController()
        func makeUIViewController(context: UIViewControllerRepresentableContext<CanvasProvider.ContainerView>) ->
        some UIViewController {
            return vc
        }

        func updateUIViewController(_ uiViewController: CanvasProvider.ContainerView.UIViewControllerType,
                                    context: UIViewControllerRepresentableContext<CanvasProvider.ContainerView>) {
        }
    }
}

enum Section {
    case main
}
