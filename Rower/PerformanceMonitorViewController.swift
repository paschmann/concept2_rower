//
//  PerformanceMonitorViewController.swift
//  Rower
//
//  Created by Aschmann, Paul on 9/1/20.
//  Copyright © 2020 Aschmann, Paul. All rights reserved.
//

import UIKit

class PerformanceMonitorViewController: UIViewController {
  var concept2monitor:PerformanceMonitor?
  
  var nameDisposable:Disposable?
  @IBOutlet var nameLabel:UILabel!
  var strokesPerMinuteDisposable:Disposable?
  @IBOutlet var strokesPerMinuteLabel:UILabel!
  var distanceDisposable:Disposable?
  @IBOutlet var distanceLabel:UILabel!
  
    override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    attachObservers()
    updateUI()
  }
  
    override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    detachObservers()
  }
  
  @IBAction func dismissAction(sender:AnyObject?) {
    self.dismiss(animated: true) { () -> Void in
    }
  }
  
  // MARK: View Updates
  private func updateUI() {
    nameLabel.text = concept2monitor?.peripheralName ?? "Unknown"
  }
  
  // MARK: Notifications
  private func attachObservers() {
    detachObservers()
    
    strokesPerMinuteDisposable = concept2monitor?.strokeRate.attach(observer: {
      [weak self] (strokeRate:C2StrokeRate) -> Void in
      if let weakSelf = self {
        DispatchQueue.global(qos: .background).async {
            DispatchQueue.main.async {
                weakSelf.strokesPerMinuteLabel.text = "\(strokeRate)"
            }
        }
      }
    })
    
    distanceDisposable = concept2monitor?.distance.attach(observer: {
      [weak self] (distance:C2Distance) -> Void in
      if let weakSelf = self {
        DispatchQueue.global(qos: .background).async {
            DispatchQueue.main.async {
                weakSelf.distanceLabel.text = "\(distance)"
            }
        }
      }
    })
  }
  
  private func detachObservers() {
    nameDisposable?.dispose()
    strokesPerMinuteDisposable?.dispose()
    distanceDisposable?.dispose()
  }
}
