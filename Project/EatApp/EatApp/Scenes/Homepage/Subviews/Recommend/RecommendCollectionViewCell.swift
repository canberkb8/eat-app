//
//  RecommendCollectionViewCell.swift
//  EatApp
//
//  Created by Canberk Bibican on 2.09.2022.
//

import UIKit

class RecommendCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: RecommendCollectionViewCell.self)

    @IBOutlet var recommendImageView: UIImageView!
    @IBOutlet var recommendTitleLabel: UILabel!
    @IBOutlet var recommendDeliveryTimeLabel: UILabel!
    @IBOutlet var recommendDeliveryPricingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.frame = self.bounds
        self.contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }

    func setup(recommendModel: Restuarant) {
        recommendImageView.forURL(recommendModel.image ?? "", fail: { error in
            //self.imageView?.image = defaultImage
            print(error.errorCode)
        })
        recommendImageView.contentMode = .scaleAspectFill
        recommendTitleLabel.text = recommendModel.title ?? ""
        if recommendModel.deliveryTime != nil {
            recommendDeliveryTimeLabel.text = String(recommendModel.deliveryTime!) + " min"
        }else {
            recommendDeliveryTimeLabel.text = "unknown"
        }
        recommendDeliveryPricingLabel.text = recommendModel.deliveryPrice ?? ""
    }
    
    @IBAction func recommendButtonTap(_ sender: Any) {
        print("button tapped")
    }
}
