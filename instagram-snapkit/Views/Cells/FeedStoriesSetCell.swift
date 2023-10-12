//
//  FeedStoriesSetCell.swift
//  instagram-snapkit
//
//  Created by Павел Петров on 07.10.2023.
//

import SnapKit
import UIKit

class FeedStoriesSetCell: UITableViewCell {
    // MARK: - Public
    func config(with info: FeedStoriesCellInfo) {
        self.items = info
        collectionView.reloadData()
    }
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        intialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private constants
    private enum UIConstants {
        static let collectionViewHeight: CGFloat = 105.5
        static let collectionWidth: CGFloat = 72
        static let collectionHeight: CGFloat = 98
    }
    
    // MARK: - Private properties
    private var collectionView: UICollectionView!
    private var items: FeedStoriesCellInfo = []
}

// MARK: - Private methods
private extension FeedStoriesSetCell {
    func intialize() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(StoriesItemCell.self, forCellWithReuseIdentifier: String(describing: StoriesItemCell.self))
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        contentView.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(UIConstants.collectionViewHeight)
        }
    }
}

extension FeedStoriesSetCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: StoriesItemCell.self), for: indexPath) as! StoriesItemCell
        cell.config(with: items[indexPath.item])
        return cell
    }
}

extension FeedStoriesSetCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIConstants.collectionWidth, height: UIConstants.collectionHeight)
    }
}
