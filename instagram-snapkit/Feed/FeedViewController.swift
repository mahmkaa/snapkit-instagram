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
    
    // MARK: - private methods
    private let tableView = UITableView()
    private var items: [FeedItemType] = [
        .stories([
            FeedStoriesItemCellInfo(image: UIImage(named: "profilePhoto")!, username: "Mevie", isAddButtonVisible: true, isNewStory: false),
            FeedStoriesItemCellInfo(image: UIImage(named: "storyPhoto1")!, username: "puh.lya", isAddButtonVisible: false, isNewStory: true),
            FeedStoriesItemCellInfo(image: UIImage(named: "storyPhoto2")!, username: "mish.pisyush", isAddButtonVisible: false, isNewStory: true),
            FeedStoriesItemCellInfo(image: UIImage(named: "storyPhoto3")!, username: "Li_Rong", isAddButtonVisible: false, isNewStory: false),
            FeedStoriesItemCellInfo(image: UIImage(named: "storyPhoto4")!, username: "Krisa_fun", isAddButtonVisible: false, isNewStory: true),
            FeedStoriesItemCellInfo(image: UIImage(named: "storyPhoto5")!, username: "Hitl.Rat", isAddButtonVisible: false, isNewStory: true),
            FeedStoriesItemCellInfo(image: UIImage(named: "storyPhoto6")!, username: "mouse.love.cheez", isAddButtonVisible: false, isNewStory: true)
        ]),
        .post(FeedPostItemInfo(userImage: UIImage(named: "profilePhoto")!, username: "Mevie", postSubtitle: "krisyota milota", postImage: UIImage(named: "postPhoto")!, numberOfLikes: 1488, comment: CommentShortInfo(username: "Li_Rong", commentText: "i love you ♥️")))
    ]
}

// MARK: - private methods

private extension FeedViewController {
    func initialize() {
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationItem.leftBarButtonItems = makeLeftBarItems()
        navigationItem.rightBarButtonItems = makeRightBarItems()
        tableView.dataSource = self
        tableView.separatorColor = .clear
        tableView.register(FeedStoriesSetCell.self, forCellReuseIdentifier: String(describing: FeedStoriesSetCell.self))
        tableView.register(FeedPostCell.self, forCellReuseIdentifier: String(describing: FeedPostCell.self))
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func makeLeftBarItems() -> [UIBarButtonItem] {
        let logoBarButtonItem = UIBarButtonItem(customView: LogoView())
        let dropDownButtonItem = UIBarButtonItem(title: nil, image: UIImage(systemName: "chevron.down"), target: self, action: nil, menu: makeDropDownMenu())
        return [logoBarButtonItem, dropDownButtonItem]
    }
    
    func makeRightBarItems() -> [UIBarButtonItem] {
        let likeImage = UIImage(named: "like.void")!
        let likesPhotoButton = UIBarButtonItem.customBarButtonItem(withImage: likeImage, target: self, action: #selector(didTapLikesPhoto(sender:)))
        
        let directImage = UIImage(named: "direct")!
        let directChatButton = UIBarButtonItem.customBarButtonItem(withImage: directImage, target: self, action: #selector(didTapDirect(sender:)))
        
        let addImage = UIImage(named: "addButton")!
        let addPostButton = UIBarButtonItem.customBarButtonItem(withImage: addImage, target: self, action: #selector(didAddPost(sender:)))
        
        let customSpace = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        customSpace.width = 24
        
        return [addPostButton, customSpace, directChatButton, customSpace, likesPhotoButton]
    }
    
    @objc func didTapLikesPhoto(sender: UIBarButtonItem) {
        print("Тут должен быть переход на экран лайкнутых фото")
    }
    
    @objc func didTapDirect(sender: UIBarButtonItem) {
        print("Тут должен быть переход на экран личных сообщений")
    }
    
    @objc func didAddPost(sender: UIBarButtonItem) {
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

// MARK: - UITableViewSource
extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        switch item {
        case .stories(let info):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FeedStoriesSetCell.self), for: indexPath) as! FeedStoriesSetCell
            cell.config(with: info)
            return cell
        case .post(let post):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FeedPostCell.self), for: indexPath) as! FeedPostCell
            cell.config(with: post)
            return cell
        }
    }
}

extension UIBarButtonItem {
    static func customBarButtonItem(withImage image: UIImage, target: Any?, action: Selector) -> UIBarButtonItem {
            let customView = UIImageView(image: image)
            customView.contentMode = .scaleAspectFit

            //Констрейны с помощью SnapKit
            customView.snp.makeConstraints { make in
                make.width.equalTo(24)
                make.height.equalTo(24)
                //make.bottom.equalToSuperview().inset(12)
            }

            let barButtonItem = UIBarButtonItem(customView: customView)
        barButtonItem.target = target as AnyObject
            barButtonItem.action = action

            return barButtonItem
        }
}
