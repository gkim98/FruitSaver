//
//  FruitInfoViewController.swift
//  FruitSaverSwift
//
//  Created by Grant Kim on 4/9/18.
//  Copyright © 2018 Grant Kim. All rights reserved.
//

import UIKit

class FruitInfoViewController: UIViewController {
    
    var fruitType = ""

    @IBOutlet weak var fruitLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fruitLabel.text = fruitType
    }
}
