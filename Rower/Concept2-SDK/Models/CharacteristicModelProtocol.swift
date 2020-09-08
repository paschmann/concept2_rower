//
//  CharacteristicModelProtocol.swift
//  Pods
//
//  Created by Jesse Curry on 10/24/15.
//  Edited by Paul Aschmann on 08/06/2020
//
import CoreData

protocol CharacteristicModel {
    init(fromData data:NSData)
    
    func updatePerformanceMonitor(performanceMonitor:PerformanceMonitor)
}
