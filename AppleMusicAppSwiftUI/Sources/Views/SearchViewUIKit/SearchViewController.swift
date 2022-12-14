//
//  SearchViewController.swift
//  AppleMusicAppSwiftUI
//
//  Created by Dmitry Dorodniy on 15.09.2022.
//

import UIKit

class SearchViewController: UIViewController {

    private var musicSections = Section.allSections

    typealias DataSource = UICollectionViewDiffableDataSource<Section, TrackModel>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, TrackModel>

    private lazy var dataSource = makeDataSource()

    private lazy var searchController: UISearchController = {
        let search = UISearchController(searchResultsController: nil)
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Search music..."
        search.searchBar.autocapitalizationType = .none
        search.delegate = self
        search.searchResultsUpdater = self

        return search
    }()

    private lazy var collectionViewSearch: UICollectionView = {
        let collection = UICollectionView(frame: .zero,
                                          collectionViewLayout: createLayout())
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.register(SearchCollectionViewCell.self,
                            forCellWithReuseIdentifier: SearchCollectionViewCell.identifier)
        collection.register(SectionHeaderReusableView.self,
                            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                            withReuseIdentifier: SectionHeaderReusableView.identifier)
        return collection
    }()

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        applySnapshot(animatingDifferences: false)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        collectionViewSearch.frame = view.bounds
    }

    // MARK: - Setup private functions

    private func setupView() {
        navigationItem.searchController = searchController
        navigationItem.title = "Search"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.addSubview(collectionViewSearch)
    }

    // MARK: - Setup Collection View

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
                                      bottom: 50,
                                      trailing: 8)

//        section header
        let headerFooterSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(20)
        )
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerFooterSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        section.boundarySupplementaryItems = [sectionHeader]

        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }

    func makeDataSource() -> DataSource {
        let dataSource = DataSource(collectionView: collectionViewSearch,
                                    cellProvider: { (collectionView, indexPath, music) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: SearchCollectionViewCell.identifier,
                for: indexPath) as? SearchCollectionViewCell
            cell?.configure(with: music)
            return cell
        })

        dataSource.supplementaryViewProvider = {collectionView, kind, indexPath in
            guard kind == UICollectionView.elementKindSectionHeader else { return nil }
            let view = collectionView.dequeueReusableSupplementaryView( ofKind: kind,
                                                                        withReuseIdentifier: SectionHeaderReusableView.identifier,
                                                                        for: indexPath) as? SectionHeaderReusableView
            let section = self.dataSource.snapshot().sectionIdentifiers[indexPath.section]
            view?.titleLabel.text = section.title
            return view
        }
        return dataSource
    }


    func applySnapshot(animatingDifferences: Bool = true) {
        var snapshot = Snapshot()
        snapshot.appendSections(musicSections)
        musicSections.forEach { section in
            snapshot.appendItems(section.items, toSection: section)
        }
        dataSource.apply(snapshot, animatingDifferences: animatingDifferences)
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension SearchViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        guard let cover = dataSource.itemIdentifier(for: indexPath) else {
            return
        }

        print("selected \(cover.title)")

        //TODO: Add method to change PlayerView @ObservebleObject vars in SwiftUI from here
    }
}

// MARK: - UISearchResultsUpdating, UISearchControllerDelegate

extension SearchViewController: UISearchResultsUpdating, UISearchControllerDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        musicSections = filteredSections(for: searchController.searchBar.text)
        applySnapshot()
    }

    func filteredSections(for queryOrNil: String?) -> [Section] {
        let musicSections = Section.allSections

        guard let query = queryOrNil, !query.isEmpty else { return musicSections }
        //// ?????????????? ?????? ???????????? ?? ?????????????????? ??????????????, ???????????? ???????????????????? ??????????
        //        let matches = musicSections.filter { item in
        //            item.items.filter { $0.title.lowercased().contains(query.lowercased()) }.count != 0
        //        }

        let matches = musicSections.compactMap { section in
            let tracks = section.items.filter { $0.title.lowercased().contains(query.lowercased()) }
            return tracks.isEmpty ? nil : Section(title: section.title, items: tracks)
        }
        return matches
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
