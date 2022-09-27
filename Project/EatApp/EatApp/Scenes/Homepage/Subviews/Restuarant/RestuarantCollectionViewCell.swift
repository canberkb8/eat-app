//
//  RestuarantCollectionViewCell.swift
//  EatApp
//
//  Created by Canberk Bibican on 11.09.2022.
//

import UIKit

class RestuarantCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: RestuarantCollectionViewCell.self)

    @IBOutlet var restuarantImageView: UIImageView!

    @IBOutlet var restuarantName: UILabel!
    @IBOutlet var restuarantOpen: PaddingLabel!
    @IBOutlet var restuarantRating: UILabel!
    @IBOutlet var restuarantRatingView: UIView!
    @IBOutlet var restuarantCategory: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.frame = self.bounds
        self.contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }

    func setup(restuarantModel: Restuarant) {
        restuarantImageView.forURL(restuarantModel.image ?? "", fail: { error in
            //self.imageView?.image = defaultImage
            print(error.errorCode)
        })
        restuarantName.text = restuarantModel.title ?? ""
        if restuarantModel.rating != nil && restuarantModel.ratingCount != nil {
            restuarantRatingView.isHidden = false
            restuarantRating.text = String(restuarantModel.rating!) + " / " + String(restuarantModel.ratingCount!)
        } else {
            restuarantRatingView.isHidden = true
        }
        if !(restuarantModel.open ?? false) {
            restuarantOpen.backgroundColor = .red
            restuarantOpen.text = "Kapalı"
        } else {
            restuarantOpen.text = ""
            restuarantOpen.backgroundColor = .white
        }

    }

}
