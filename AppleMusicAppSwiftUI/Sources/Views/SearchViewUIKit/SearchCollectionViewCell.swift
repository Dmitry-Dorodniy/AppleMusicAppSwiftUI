//
//  SearchCollectionViewCell.swift
//  AppleMusicAppSwiftUI
//
//  Created by Dmitry Dorodniy on 16.09.2022.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    static let identifier = "SearchCollectionViewCell"

    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 10
        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(imageView)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with model: TrackModel) {
        imageView.image = UIImage(named: model.imageSqr)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        imageView.frame = contentView.bounds
    }

    override func prepareForReuse() {
        super.prepareForReuse()

//        imageView.image = nil
    }
}
