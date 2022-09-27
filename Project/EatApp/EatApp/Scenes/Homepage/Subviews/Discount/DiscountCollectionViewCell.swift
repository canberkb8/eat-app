//
//  DiscountCollectionViewCell.swift
//  EatApp
//
//  Created by Canberk Bibican on 29.08.2022.
//

import UIKit

class DiscountCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: DiscountCollectionViewCell.self)

    @IBOutlet var discountImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.frame = self.bounds
        self.contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }

    func setup(discountModel: Discount) {
        discountImageView.forURL(discountModel.image ?? "", fail: { error in
            //self.imageView?.image = defaultImage
            print(error.errorCode)
        })
        discountImageView.cornerRadius = 10
        discountImageView.contentMode = .scaleAspectFill
    }

}
