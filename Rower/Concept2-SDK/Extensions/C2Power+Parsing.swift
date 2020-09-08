//
//  C2Power+Parsing.swift
//  Pods
//
//  Created by Jesse Curry on 10/26/15.
//  Edited by Paul Aschmann on 08/06/2020
//

extension C2Power {
  /**
   */
  init(powerWithLow low:UInt16, high:UInt16) {
    self = C2Power(low | (high << 8))
  }
}
