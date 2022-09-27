//
//  HomepageModel.swift
//  EatApp
//
//  Created by Canberk Bibican on 1.09.2022.
//

import Foundation
import UIKit

enum HomepageType {
    case DISCOUNT
    case CATEGORY
    case RECOMMEND
    case RESTUARANT
}

enum HomepageModel {
    
    enum HomepageData {
        
        struct DisplayModel {
            var type: HomepageType
        }
        
        struct HomepagePassData {
            var id: Int?
        }
    }
}
