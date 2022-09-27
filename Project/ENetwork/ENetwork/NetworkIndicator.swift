//
//  NetworkIndicator.swift
//  Network
//
//  Created by Canberk Bibican on 28.08.2022.
//

import Foundation
import UIKit

final class NetworkIndicator {

    var greyView = UIView(frame: .zero)
    var activityIndicator = UIActivityIndicatorView(frame: .zero)
    var animationCounter: Int = .zero

    func changeShow(_ show: Bool?) {
        show == true ? (animationCounter += 1) : (animationCounter -= 1)
        if greyView.superview != nil {
            if animationCounter == 0 {
                activityIndicatorEnd()
            }
        } else {
            activityIndicatorBegin()
        }
    }

    private func activityIndicatorBegin() {
        let topController = UIApplication.shared.topViewController!
        activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        activityIndicator.hidesWhenStopped = true
        if #available(iOS 13.0, *) {
            activityIndicator.style = UIActivityIndicatorView.Style.medium
            activityIndicator.color = .black
        } else {
            activityIndicator.style = UIActivityIndicatorView.Style.gray
            activityIndicator.color = .black
        }
        greyView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        greyView.backgroundColor = .lightGray
        greyView.alpha = 0.5
        greyView.addSubview(activityIndicator)
        activityIndicator.center = greyView.center
        activityIndicator.startAnimating()

        topController.view.addSubview(greyView)
    }

    private func activityIndicatorEnd() {
        self.activityIndicator.stopAnimating()
        self.activityIndicator.removeFromSuperview()

        self.greyView.removeFromSuperview()
    }

}
