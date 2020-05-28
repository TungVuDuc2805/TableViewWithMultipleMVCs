//
//  ProfileViewModel.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Stanislav Ostrovskiy on 4/25/17.
//  Copyright © 2017 Stanislav Ostrovskiy. All rights reserved.
//

import Foundation
import UIKit

class ProfileViewModel: NSObject {
    var items = [ProfileSectionControllerProtocol]()
    
    override init() {
        super.init()
        guard let data = dataFromFile("ServerData"), let profile = Profile(data: data) else {
            return
        }
        
        if let name = profile.fullName, let pictureUrl = profile.pictureUrl {
            let nameAndPictureItem = ProfileViewModelNamePictureItem(name: name, pictureUrl: pictureUrl)
            let sectionItem = ProfileSectionController(title: "Main Info", cells: [ProfileNamePictureCellController(dataModel: nameAndPictureItem)])
            items.append(sectionItem)
        }

        if let about = profile.about {
            let aboutItem = ProfileViewModelAboutItem(about: about)
            let sectionItem = ProfileSectionController(title: "About", cells: [ProfileAboutCellController(dataModel: aboutItem)])
            items.append(sectionItem)
        }

        if let email = profile.email {
            let dobItem = ProfileViewModelEmailItem(email: email)
            let sectionItem = ProfileSectionController(title: "Email", cells: [ProfileEmailCellController(dataModel: dobItem)])
            items.append(sectionItem)
        }

        var attributeCells = [ProfileAttributesCellController]()
        let attributes = profile.profileAttributes
        for attribute in attributes {
            let attributesItem = ProfileViewModeAttributeItem(attribute: attribute)
            attributeCells.append(ProfileAttributesCellController(dataModel: attributesItem))
        }
        let attributeSectionItem = ProfileSectionController(title: "Attributes", cells: attributeCells)
        items.append(attributeSectionItem)
         
        var friendCells = [ProfileFriendsCellController]()
        let friends = profile.friends
        for friend in friends {
            let friendsItem = ProfileViewModeFriendsItem(friend: friend)
            friendCells.append(ProfileFriendsCellController(dataModel: friendsItem))
        }
        let sectionItem = ProfileSectionController(title: "Friends", cells: friendCells)
        items.append(sectionItem)
    }
}

extension ProfileViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionController = items[indexPath.section]
        let cellController = sectionController.cells[indexPath.row]
        
        return cellController.view(tableView)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return items[section].title
    }
}

