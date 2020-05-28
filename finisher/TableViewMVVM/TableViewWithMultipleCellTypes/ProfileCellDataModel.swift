//
//  ProfileCellDataModel.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Tung Vu Duc on 5/28/20.
//  Copyright © 2020 Stanislav Ostrovskiy. All rights reserved.
//

import Foundation

class ProfileViewModelNamePictureItem {
 
    var name: String
    var pictureUrl: String
    
    init(name: String, pictureUrl: String) {
        self.name = name
        self.pictureUrl = pictureUrl
    }
}

class ProfileViewModelAboutItem {
    var about: String
    
    init(about: String) {
        self.about = about
    }
}

class ProfileViewModelEmailItem {
    var email: String
    
    init(email: String) {
        self.email = email
    }
}

class ProfileViewModeAttributeItem {
    
    var attribute: Attribute
    
    init(attribute: Attribute) {
        self.attribute = attribute
    }
}

class ProfileViewModeFriendsItem {
    
    var friend: Friend
    
    init(friend: Friend) {
        self.friend = friend
    }
}
