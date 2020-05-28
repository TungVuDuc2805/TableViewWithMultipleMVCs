//
//  ProfileCellController.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Tung Vu Duc on 5/28/20.
//  Copyright © 2020 Stanislav Ostrovskiy. All rights reserved.
//

import UIKit

class ProfileNamePictureCellController: ProfileCellProtocol {
    private var cell: NamePictureCell?
    private let dataModel: ProfileViewModelNamePictureItem
    
    init(dataModel: ProfileViewModelNamePictureItem) {
        self.dataModel = dataModel
    }
    
    func view(_ tableView: UITableView) -> UITableViewCell {
        cell = tableView.dequeueReusableCell(withIdentifier: "NamePictureCell") as? NamePictureCell
        configureCell()
        return cell!
    }
    
    private func configureCell(){
        cell?.nameLabel?.text = dataModel.name
        cell?.pictureImageView?.image = UIImage(named: "\(dataModel.pictureUrl)")
    }
    
}

class ProfileAboutCellController: ProfileCellProtocol {
    private var cell: AboutCell?
    private let dataModel: ProfileViewModelAboutItem
    
    init(dataModel: ProfileViewModelAboutItem) {
        self.dataModel = dataModel
    }
    
    func view(_ tableView: UITableView) -> UITableViewCell {
        cell = tableView.dequeueReusableCell(withIdentifier: "AboutCell") as? AboutCell
        configureCell()
        return cell!
    }
    
    private func configureCell(){
        cell?.aboutLabel?.text = dataModel.about
    }
    
}

class ProfileEmailCellController: ProfileCellProtocol {
    private var cell: EmailCell?
    private let dataModel: ProfileViewModelEmailItem
    
    init(dataModel: ProfileViewModelEmailItem) {
        self.dataModel = dataModel
    }
    
    func view(_ tableView: UITableView) -> UITableViewCell {
        cell = tableView.dequeueReusableCell(withIdentifier: "EmailCell") as? EmailCell
        configureCell()
        return cell!
    }
    
    private func configureCell(){
        cell?.emailLabel?.text = dataModel.email
    }
    
}

class ProfileAttributesCellController: ProfileCellProtocol {
    private var cell: AttributeCell?
    private let dataModel: ProfileViewModeAttributeItem
    
    init(dataModel: ProfileViewModeAttributeItem) {
        self.dataModel = dataModel
    }
    
    func view(_ tableView: UITableView) -> UITableViewCell {
        cell = tableView.dequeueReusableCell(withIdentifier: "AttributeCell") as? AttributeCell
        configureCell()
        return cell!
    }
    
    private func configureCell(){
        cell?.titleLabel?.text = dataModel.attribute.key
        cell?.valueLabel?.text = dataModel.attribute.value
    }
    
}

class ProfileFriendsCellController: ProfileCellProtocol {
    private var cell: FriendCell?
    private let dataModel: ProfileViewModeFriendsItem
    
    init(dataModel: ProfileViewModeFriendsItem) {
        self.dataModel = dataModel
    }
    
    func view(_ tableView: UITableView) -> UITableViewCell {
        cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell") as? FriendCell
        configureCell()
        return cell!
    }
    
    private func configureCell(){
        cell?.nameLabel?.text = dataModel.friend.name
        cell?.pictureImageView?.image = dataModel.friend.pictureUrl != nil ? UIImage(named: "\(dataModel.friend.pictureUrl!)") : UIImage.imageWith(color: .red)
    }
    
}

private extension UIImage {
    
    static func imageWith(color: UIColor) -> UIImage{
        let rect = CGRect(x: 0, y: 0, width: 10, height: 10)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
