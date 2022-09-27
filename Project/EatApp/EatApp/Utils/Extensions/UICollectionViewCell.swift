//
//  UICollectionViewCell.swift
//  EatApp
//
//  Created by Canberk Bibican on 30.08.2022.
//

import Foundation
import UIKit

extension UICollectionViewCell {

    class var storyboardID: String {
        return "\(self)"
    }

    static func registerCellXib(with collectionView: UICollectionView) {
        let nib = UINib(nibName: self.storyboardID, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: self.storyboardID)
    }
}
