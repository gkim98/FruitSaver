//
//  fruits.swift
//  FruitSaverSwift
//
//  Created by Grant Kim on 4/9/18.
//  Copyright © 2018 Grant Kim. All rights reserved.
//

import Foundation

let h = "high"
let m = "medium"
let l = "low"
let vl = "very low"
let y = "yes"
let n = "no"

// first index -> ethylene emitting (high, medium, low, very low, medium)
// second index -> ethylene sensitive (yes, no)

let fruits = [
    "apple": [h, y],
    "apricot": [h, y],
    "avocado": [h, y], // special case (ripe v unripe hardcode)
    "banana": [l, y], // also special case
    "cherry": [vl, n],
    "cucumber": [vl, y],
    "grapefruit": [vl, n],
    "grape": [vl, y],
    "kiwi": [h, y], // special case,
    "lemon": [vl, n],
    "mango": [m, y],
    "orange": [vl, n],
    "peach": [h, y],
    "pear": [h, y],
    "pineapple": [vl, n],
    "strawberry": [vl, n],
    "tomato": [m, n], //special case
    "coconut": [n, n],
    "corn": [n, n],
    "garlic": [n, n],
    "onion": [n, n],
    "broccoli": [n, y],
    "cabbage": [n, y],
    "carrot": [n, y],
    "lettuce": [n, y],
    "potato": [n, y]
]
