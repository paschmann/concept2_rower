//
//  C2CalorieCount+Parsing.swift
//  Pods
//
//  Created by Jesse Curry on 10/26/15.
//  Edited by Paul Aschmann on 08/06/2020
//

extension C2CalorieCount {
    /**
     */
    init(calorieCountWithLow low:UInt16, high:UInt16) {
        self = C2CalorieCount(low | (high << 8))
    }
}
