//
//  Loader.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Tung Vu Duc on 5/28/20.
//  Copyright © 2020 Stanislav Ostrovskiy. All rights reserved.
//

import Foundation

protocol ProfileLoader {
    func load() -> [ProfileSectionControllerProtocol]
}

class DummyProfileLoader: ProfileLoader {
    
    func load() -> [ProfileSectionControllerProtocol] {
        var items = [ProfileSectionControllerProtocol]()
        guard let data = dataFromFile("ServerData"), let profile = Profile(data: data) else {
            return []
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
        
        return items
    }
    
}
