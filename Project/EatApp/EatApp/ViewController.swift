//
//  ViewController.swift
//  EatApp
//
//  Created by Canberk Bibican on 28.08.2022.
//

import UIKit
import ENetwork

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        ENetworkTest.shared.testRun()
    }


}

