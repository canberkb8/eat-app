//
//  HeaderView.swift
//  EatApp
//
//  Created by Canberk Bibican on 30.08.2022.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    static let identifier = String(describing: HeaderView.self)
    static let ofKind = "header"
    
    @IBOutlet var headerViewTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var title: String?{
        didSet{
            headerViewTitleLabel.text = title
        }
    }
    
    @IBAction func viewAllTap(_ sender: Any) {
        print(title ?? "")
    }
}
