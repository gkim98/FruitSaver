//
//  FruitInfoViewController.swift
//  FruitSaverSwift
//
//  Created by Grant Kim on 4/9/18.
//  Copyright © 2018 Grant Kim. All rights reserved.
//

import UIKit
import Vision

class FruitInfoViewController: UIViewController {
    
    var fruitType = ""
    var fruitPicture = UIImage()

    @IBOutlet weak var fruitLabel: UILabel!
    @IBOutlet weak var fruitImage: UIImageView!
    @IBOutlet weak var emissionLabel: UILabel!
    @IBOutlet weak var emissionBar: UIView!
    @IBOutlet weak var sensitivityLabel: UILabel!
    @IBOutlet weak var sensitivityBar: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fruitLabel.text = fruitType
        fruitImage.image = fruitPicture
        let emissionColor = colorMapping[fruits[fruitType]![0]]
        let sensitivityColor = colorMapping[fruits[fruitType]![1]]
        emissionBar.backgroundColor = emissionColor
        sensitivityBar.backgroundColor = sensitivityColor
        
        emissionLabel.text = "Ethylene Emission: \(fruits[fruitType]![0])"
        sensitivityLabel.text = "Ethylene Sensitive: \(fruits[fruitType]![1])"
        
    }
}
