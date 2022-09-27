//
//  UIView.swift
//  EatApp
//
//  Created by Canberk Bibican on 1.09.2022.
//

import Foundation
import UIKit

extension UIView {

    @IBInspectable var cornerRadius: CGFloat {
        get { return self.cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }

    @IBInspectable var borderWidth: CGFloat {
        get { return layer.borderWidth }
        set {
            layer.borderWidth = newValue
        }
    }

    @IBInspectable var borderColor: UIColor? {
        get { return UIColor(cgColor: layer.borderColor!) }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }

    @IBInspectable
    var shadowRadius: CGFloat {
        get { return layer.shadowRadius }
        set {
            layer.shadowRadius = newValue
        }
    }
    @IBInspectable
    var shadowOffset: CGSize {

        get { return layer.shadowOffset } set {
            layer.shadowOffset = newValue
        }
    }

    @IBInspectable
    var shadowColor: UIColor {
        get { return UIColor.init(cgColor: layer.shadowColor!) }
        set {
            layer.shadowColor = newValue.cgColor
        }
    }
    @IBInspectable
    var shadowOpacity: Float {
        get { return layer.shadowOpacity }
        set {
            layer.shadowOpacity = newValue
        }
    }

    func addTapGesture(action: @escaping () -> Void) {
        let tap = MyTapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        tap.action = action
        tap.numberOfTapsRequired = 1
        self.addGestureRecognizer(tap)
        self.isUserInteractionEnabled = true
    }

    @objc func handleTap(_ sender: MyTapGestureRecognizer) {
        sender.action!()
    }
}

class MyTapGestureRecognizer: UITapGestureRecognizer {
    var action: (() -> Void)? = nil
}
