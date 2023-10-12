//
//  StoriesItemCell.swift
//  instagram-snapkit
//
//  Created by Павел Петров on 08.10.2023.
//

import SnapKit
import UIKit

class StoriesItemCell: UICollectionViewCell {
    // MARK: Public
    func config(with info: FeedStoriesItemCellInfo) {
        imageView.image = info.image
        usernameLabel.text = info.username
        plusButton.isHidden = !info.isAddButtonVisible
        unviewedCircle.isHidden = !info.isNewStory
    }
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private constants
    private enum UIConstants {
        static let imageSize: CGFloat = 60
        static let imageToCellInset: CGFloat = 6
        static let labelToCellInsent: CGFloat = 6
        static let imageToLabelOffset: CGFloat = 6
        static let usernameLabelFont: CGFloat = 12
        static let plusButtonSize: CGFloat = 20
        static let unviewedCircleSize: CGFloat = 72
    }
    
    // MARK: Private properties
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = UIConstants.imageSize / 2
        view.clipsToBounds = true
        return view
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.usernameLabelFont)
        label.textAlignment = .center
        return label
    }()
    
    private let plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "addStory"), for: .normal)
        return button
    }()
    
    private let unviewedCircle: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "storyRing")
        return view
    }()
}

// MARK: Private methods
private extension StoriesItemCell {
    func initialize() {
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.size.equalTo(UIConstants.imageSize)
            make.leading.top.trailing.equalToSuperview().inset(UIConstants.imageToCellInset)
        }
        contentView.addSubview(usernameLabel)
        usernameLabel.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(UIConstants.labelToCellInsent)
            make.top.equalTo(imageView.snp.bottom).offset(UIConstants.imageToLabelOffset)
        }
        contentView.addSubview(plusButton)
        plusButton.snp.makeConstraints { make in
            make.trailing.bottom.equalTo(imageView)
            make.size.equalTo(UIConstants.plusButtonSize)
        }
        contentView.addSubview(unviewedCircle)
        unviewedCircle.snp.makeConstraints { make in
            make.center.equalTo(imageView)
            make.size.equalTo(UIConstants.unviewedCircleSize)
        }
    }
}
