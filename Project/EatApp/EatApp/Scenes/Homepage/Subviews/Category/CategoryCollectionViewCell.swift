//
//  CategoryCollectionViewCell.swift
//  EatApp
//
//  Created by Canberk Bibican on 1.09.2022.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet var categoryView: UIView!
    @IBOutlet var categoryImageView: UIImageView!
    @IBOutlet var categoryTitleLabel: UILabel!

    static let identifier = String(describing: CategoryCollectionViewCell.self)

    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.frame = self.bounds
        self.contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }

    func setup(categoryModel: Category) {
        categoryImageView.forURL(categoryModel.iconImage ?? "", fail: { error in
            //self.imageView?.image = defaultImage
            print(error.errorCode)
        })
        categoryImageView.contentMode = .scaleAspectFill
        categoryTitleLabel.text = categoryModel.name ?? ""
    }

}
