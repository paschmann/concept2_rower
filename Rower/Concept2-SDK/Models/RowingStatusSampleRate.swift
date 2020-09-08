//
//  RowingStatusSampleRate.swift
//  Pods
//
//  Created by Jesse Curry on 10/27/15.
//  Edited by Paul Aschmann on 08/06/2020
//
import CoreData
struct RowingStatusSampleRate: CharacteristicModel, CustomDebugStringConvertible {
    let DataLength = 1
    
    /*
     
     */
    
    var sampleRate:RowingStatusSampleRateType?
    
    init(fromData data: NSData) {
        var arr:[UInt8] = Array(repeating: 0, count: DataLength);
        data.getBytes(&arr, length: DataLength)
        
        sampleRate = RowingStatusSampleRateType(rawValue: arr[0])
    }
    
    // MARK: PerformanceMonitor
    func updatePerformanceMonitor(performanceMonitor:PerformanceMonitor) {
        performanceMonitor.sampleRate.value = sampleRate
    }
    
    // MARK: -
    var debugDescription:String {
        return "[RowingStatusSampleRate]\n\tsampleRate: \(sampleRate as Optional)"
    }
}

/*
 NSData extension to allow writing of this value
 */
extension NSData {
    convenience init(rowingStatusSampleRate:RowingStatusSampleRateType) {
        let arr:[UInt8] = [rowingStatusSampleRate.rawValue];
        
        self.init(bytes: arr, length: arr.count * MemoryLayout<UInt8>.size)
    }
}
