//
//  PerformanceMonitorStore.swift
//  Pods
//
//  Created by Jesse Curry on 9/30/15.
//  Copyright © 2015 Bout Fitness, LLC. All rights reserved.
//

import CoreBluetooth

let PerformanceMonitorStoreDidAddItemNotification = "PerformanceMonitorStoreDidAddItemNotification"
let PerformanceMonitorStoreDidRemoveItemNotification = "PerformanceMonitorStoreDidRemoveItemNotification"

final class PerformanceMonitorStore {
  // Singleton
  static let sharedInstance = PerformanceMonitorStore()
  
  //////////////////////////////////////////////////////////////////////////////////////////////////
  var performanceMonitors = Set<PerformanceMonitor>()

  func addPerformanceMonitor(performanceMonitor:PerformanceMonitor) {
    performanceMonitors.insert(performanceMonitor)
    
    NotificationCenter.default.post(
        name: NSNotification.Name(rawValue: PerformanceMonitorStoreDidAddItemNotification),
      object: self)
  }
  
  func performanceMonitorWithPeripheral(peripheral:CBPeripheral) -> PerformanceMonitor? {
    var pm:PerformanceMonitor?
    
    performanceMonitors.forEach { (performanceMonitor:PerformanceMonitor) -> () in
      if performanceMonitor.peripheral == peripheral {
        pm = performanceMonitor
      }
    }
    
    return pm
  }
  
  func removePerformanceMonitor(performanceMonitor:PerformanceMonitor) {
    performanceMonitors.remove(performanceMonitor)
    
    NotificationCenter.default.post(
        name: NSNotification.Name(rawValue: PerformanceMonitorStoreDidRemoveItemNotification),
      object: self)
  }
}
