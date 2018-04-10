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

    @IBOutlet weak var fruitImage: UIImageView!
    @IBOutlet weak var emissionLabel: UILabel!
    @IBOutlet weak var emissionBar: UIView!
    @IBOutlet weak var sensitivityLabel: UILabel!
    @IBOutlet weak var sensitivityBar: UIView!
    @IBOutlet weak var adviceMessage: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = fruitType
        fruitImage.image = fruitPicture
        let emissionColor = colorMapping[fruits[fruitType]![0]]
        let sensitivityColor = colorMapping[fruits[fruitType]![1]]
        emissionBar.backgroundColor = emissionColor
        sensitivityBar.backgroundColor = sensitivityColor
        
        emissionLabel.text = "Ethylene Emission: \(fruits[fruitType]![0])"
        sensitivityLabel.text = "Ethylene Sensitive: \(fruits[fruitType]![1])"
        
        getAdvice()
    }
    
    func getAdvice() {
        let e = fruits[fruitType]![0]
        let s = fruits[fruitType]![1]
        
        if((e == "Low" || e == "Very Low" || e == "No") && s == "No") {
            adviceMessage.text = """
                This produce does not emit much ethylene nor is affected by ethylene. You can store this in any of the Fruit Saver compartments with any other produce.
            """
        } else if(e == "High" && s == "Yes") {
            adviceMessage.text = """
                This produce emits a lot of ethylene and is sensitive to it. Store this in the ventilated compartment of the Fruit Saver to prevent self-ripening. Keep away from ethylene-sensitive produce as best as possible.
            """
        } else if(e == "No" && s == "Yes") {
            adviceMessage.text = """
                This produce doesn't emit much ethylene but is sensitive to it. Keep away from high-ethylene producers by putting this in the bottom compartment of the Fruit Saver. However, for desired ripening, place in top compartment with the ethylene-producers.
            """
        } else if(e == "Medium" && s == "Yes") {
            adviceMessage.text = """
                This produce emits moderate levels of ethylene and is sensitive to it. Generally keep away from ethylene-sensitive produce, but self-ripening isn't too much of an issue. Place in top compartment or by itself in a bottom compartment of the Fruit Saver.
            """
        }
    }
}
