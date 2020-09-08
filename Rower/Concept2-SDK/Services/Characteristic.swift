//
//  Characteristic.swift
//  Pods
//
//  Created by Jesse Curry on 10/24/15.
//  Edited by Paul Aschmann on 08/06/2020
//

import CoreBluetooth

protocol Characteristic {
    var UUID:CBUUID { get }
    
    func parse(data:NSData?) -> CharacteristicModel?
}
