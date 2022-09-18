//
//  SearchCollectionViewCell.swift
//  AppleMusicAppSwiftUI
//
//  Created by Dmitry Dorodniy on 16.09.2022.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    static let identifier = "SearchCollectionViewCell"

    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 10
        return image
    }()

    private lazy var trackTitle: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = .white
        return title
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(imageView)
        imageView.addSubview(trackTitle)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with model: TrackModel) {
        imageView.image = UIImage(named: model.imageSqr)
        trackTitle.text = model.title
    }

    private func setupLayout() {
        imageView.frame = contentView.bounds

        NSLayoutConstraint.activate([
            trackTitle.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 10),
            trackTitle.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -10)
        ])
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupLayout()

    }

    override func prepareForReuse() {
        super.prepareForReuse()

//        imageView.image = nil
    }
}
