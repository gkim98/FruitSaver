//
//  AboutViewController.swift
//  FruitSaverSwift
//
//  Created by Grant Kim on 4/10/18.
//  Copyright © 2018 Grant Kim. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentSize = CGSize(width: self.view.frame.width, height: 1200)
    }
}
