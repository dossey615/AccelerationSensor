//
//  InterfaceController.swift
//  AccelerationForWatch Extension
//
//  Created by 土居将史 on 2018/06/29.
//  Copyright © 2018年 土居将史. All rights reserved.
//

import WatchKit
import Foundation
import CoreMotion
import WatchConnectivity

class InterfaceController: WKInterfaceController, WCSessionDelegate{
    
    let motion: CMMotionManager = CMMotionManager()
    
    @IBOutlet var xdataLabel: WKInterfaceLabel!
    @IBOutlet var ydataLabel: WKInterfaceLabel!
    @IBOutlet var zdataLabel: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
    }
    
    override func willActivate() {
        super.willActivate()
        if (WCSession.isSupported()) {
            let session = WCSession.default
            session.delegate = self
            session.activate()
            StartAccelerator()
        }
    }
    
    override func didDeactivate() {
        super.didDeactivate()
    }
    
    func StartAccelerator(){
        motion.accelerometerUpdateInterval = 0.5
        motion.startAccelerometerUpdates(to: OperationQueue.current!, withHandler: {(accelData: CMAccelerometerData?, errorOC:Error?) -> Void in
            self.xdataLabel.setText("xdata : " + String(format: "%06f", (accelData?.acceleration.x)!))
            self.ydataLabel.setText("ydata : " + String(format: "%06f", (accelData?.acceleration.y)!))
            self.zdataLabel.setText("zdata : " + String(format: "%06f", (accelData?.acceleration.z)!))
        })
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print("activationDidComplete")
    }

}
