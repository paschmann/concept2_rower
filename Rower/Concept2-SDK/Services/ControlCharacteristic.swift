//
//  ControlCharacteristic.swift
//  Pods
//
//  Created by Jesse Curry on 10/24/15.
//  Edited by Paul Aschmann on 08/06/2020
//

import CoreBluetooth

public enum ControlCharacteristic:Characteristic {
    case Command
    case Response
    
    init?(uuid:CBUUID) {
        switch uuid {
        case ControlCharacteristic.Command.UUID:
            self = .Command
        case ControlCharacteristic.Response.UUID:
            self = .Response
        default:
            return nil
        }
    }
    
    var UUID:CBUUID {
        switch self {
        case .Command:
            return CBUUID(string: "CE060021-43E5-11E4-916C-0800200C9A66")
        case .Response:
            return CBUUID(string: "CE060022-43E5-11E4-916C-0800200C9A66")
        }
    }
    
    func parse(data:NSData?) -> CharacteristicModel? {
        switch self {
        case .Command:
            return nil
        case .Response:
            return nil
        }
    }
}
