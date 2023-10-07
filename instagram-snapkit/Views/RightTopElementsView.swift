//
//  RightTopElements.swift
//  instagram-snapkit
//
//  Created by Павел Петров on 07.10.2023.
//

import SnapKit
import UIKit

class RightTopElementsView: UIView {
    // MARK: - init
    init() {
        super.init(frame: .zero)
        initialize()
    }
    
    init(imageName: String) {
        super.init(frame: .zero)
        self.imageView.image = UIImage(named: imageName)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private constants
    private enum UIConstants {
        static let logoWidth: CGFloat = 24
        static let logoHeight: CGFloat = 24
    }
    
    // MARK: - Private properties
    private let imageView: UIImageView = {
        let view = UIImageView()
        return view
    }()

    
}

// MARK: - Private methods
private extension RightTopElementsView {
    func initialize() {
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(UIConstants.logoWidth)
            make.height.equalTo(UIConstants.logoHeight)
        }
    }
}
