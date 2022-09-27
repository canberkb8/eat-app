//
//  UIImageView.swift
//  EatApp
//
//  Created by Canberk Bibican on 2.09.2022.
//

import Foundation
import Kingfisher

extension UIImageView {
    func forURL(_ imageUrl: String, fail: @escaping (_ error: KingfisherError) -> Void) {
        var kf = self.kf
        kf.indicatorType = .activity
        guard let url = URL.init(string: imageUrl) else {
            return
        }
        let resizingProcessor = ResizingImageProcessor(referenceSize: CGSize(width: self.frame.size.width * UIScreen.main.scale, height: self.frame.size.height * UIScreen.main.scale), mode: .aspectFit)
        KF.url(url)
        //.placeholder(placeholderImage) // if there is no image
        .setProcessor(resizingProcessor)
            .loadDiskFileSynchronously()
            .cacheMemoryOnly()
            .fade(duration: 0.25)
        //.lowDataModeSource(.network(lowResolutionURL)) // low internet connection speed
        .onProgress { receivedSize, totalSize in }
            .onSuccess { result in }
            .onFailure { error in
            fail(error)
        }
            .set(to: self)
    }
}
