//
//  ProfileSectionController.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Tung Vu Duc on 5/28/20.
//  Copyright © 2020 Stanislav Ostrovskiy. All rights reserved.
//

import Foundation

protocol ProfileSectionControllerProtocol {
    var title: String {get}
    var cells: [ProfileCellProtocol] {get set}
    var rowCount: Int {get}
    init(title: String, cells: [ProfileCellProtocol])
}

extension ProfileSectionControllerProtocol {
    var rowCount: Int {
        return cells.count
    }
}

class ProfileSectionController: ProfileSectionControllerProtocol {
    
    var title: String
    var cells: [ProfileCellProtocol]
    
    required init(title: String, cells: [ProfileCellProtocol]) {
        self.title = title
        self.cells = cells
    }
    
}
