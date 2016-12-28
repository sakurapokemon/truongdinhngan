//
//  Extensions.swift
//  GameEnglish
//
//  Created by dinhngan on 12/27/16.
//  Copyright © 2016 dinhngan. All rights reserved.
//

import Foundation
extension Array {
    mutating func shuffle() {
        if count < 2 { return }
        for i in 0..<(count - 1) {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            //swap(&self[i], &self[j])
            customSwap(&self[i], b: &self[j])
        }
    }
}

func customSwap<T>(inout a: T, inout b: T) {
    let temp = a
    a = b
    b = temp
}