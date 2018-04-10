//
//  fruits.swift
//  FruitSaverSwift
//
//  Created by Grant Kim on 4/9/18.
//  Copyright © 2018 Grant Kim. All rights reserved.
//

import Foundation
import UIKit

let h = "High"
let m = "Medium"
let l = "Low"
let vl = "Very Low"
let y = "Yes"
let n = "No"

// first index -> ethylene emitting (high, medium, low, very low, medium)
// second index -> ethylene sensitive (yes, no)

let fruits = [
    "Granny Smith": [h, y],
    "Apricot": [h, y],
    "Avocado": [h, y], // special case (ripe v unripe hardcode)
    "Banana": [m, y], // also special case
    "Cherry": [vl, n],
    "Cucumber": [vl, y],
    "Grapefruit": [vl, n],
    "Grape": [vl, y],
    "Kiwi": [h, y], // special case,
    "Lemon": [vl, n],
    "Mango": [m, y],
    "Orange": [vl, n],
    "Peach": [h, y],
    "Pear": [h, y],
    "Pineapple": [vl, n],
    "Strawberry": [vl, n],
    "Tomato": [m, n], //special case
    "Coconut": [n, n],
    "Corn": [n, n],
    "Garlic": [n, n],
    "Onion": [n, n],
    "Broccoli": [n, y],
    "Cabbage": [n, y],
    "Carrot": [n, y],
    "Lettuce": [n, y],
    "Potato": [n, y]
]

let colorMapping = [
    "High": UIColor(red: 233/255.0, green: 89/255.0, blue: 66/255.0, alpha: 1),
    "Medium": UIColor(red: 241/255.0, green: 238/255.0, blue: 98/255.0, alpha: 1),
    "Low": UIColor(red: 69/255.0, green: 193/255.0, blue: 62/255.0, alpha: 1),
    "Very Low": UIColor(red: 76/255.0, green: 160/255.0, blue: 72/255.0, alpha: 1),
    "Yes": UIColor(red: 233/255.0, green: 89/255.0, blue: 66/255.0, alpha: 1),
    "No": UIColor(red: 76/255.0, green: 160/255.0, blue: 72/255.0, alpha: 1)
]
