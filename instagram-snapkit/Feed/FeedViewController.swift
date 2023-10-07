//
//  FeedViewController.swift
//  instagram-snapkit
//
//  Created by Павел Петров on 06.10.2023.
//

import SnapKit
import UIKit

class FeedViewController: UIViewController {
    // MARK: - view lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
}

// MARK: - private methods

private extension FeedViewController {
    func initialize() {
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationItem.leftBarButtonItems = makeLeftBarItems()
        navigationItem.rightBarButtonItems = makeRightBarItems()
    }
    
    func makeLeftBarItems() -> [UIBarButtonItem] {
        let logoBarButtonItem = UIBarButtonItem(customView: LogoView())
        let dropDownButtonItem = UIBarButtonItem(title: nil, image: UIImage(systemName: "chevron.down"), target: self, action: nil, menu: makeDropDownMenu())
        return [logoBarButtonItem, dropDownButtonItem]
    }
    
    func makeRightBarItems() -> [UIBarButtonItem] {
        let likesPhotoButton = UIBarButtonItem(customView: RightTopElementsView(imageName: "like.void"))
        let directChatButton = UIBarButtonItem(customView: RightTopElementsView(imageName: "direct"))
        let addPostButton = UIBarButtonItem(customView: RightTopElementsView(imageName: "addButton"))
        
        let customSpace = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        customSpace.width = 24
        
        likesPhotoButton.target = self
        likesPhotoButton.action = #selector(didTapLikesPhoto)
        
        directChatButton.target = self
        directChatButton.action = #selector(didTapDirect)
        
        addPostButton.target = self
        addPostButton.action = #selector(didAddPost)
        addPostButton.style = .plain
        
        return [likesPhotoButton, customSpace, directChatButton, customSpace, addPostButton]
    }
    
    @objc func didTapLikesPhoto() {
        print("Тут должен быть переход на экран лайкнутых фото")
    }
    
    @objc func didTapDirect() {
        print("Тут должен быть переход на экран личных сообщений")
    }
    
    @objc func didAddPost() {
        print("Тут должен быть переход на экран создания поста")
    }
    
    
    func makeDropDownMenu() -> UIMenu {
        let subsItem = UIAction(title: "Подписки", image: UIImage(systemName: "person.2")) { _ in
            print("subs")
        }
        let favsItem = UIAction(title: "Избранное", image: UIImage(systemName: "star")) { _ in
            print("favorites")
        }
        return UIMenu(title: "", children: [subsItem, favsItem])
    }
}
