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
        //iOSとWatch間のデータ共有セットアップ
        if (WCSession.isSupported()) {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
    }
    
    override func didDeactivate() {
        super.didDeactivate()
    }
    
    //加速度の計測開始関数
    func StartAccelerator(){
        //加速度取得の周期
        motion.accelerometerUpdateInterval = 0.5
        
        //加速度の取得開始
        motion.startAccelerometerUpdates(to: OperationQueue.current!, withHandler: {(accelData: CMAccelerometerData?, errorOC:Error?) -> Void in
            //画面に表示
            self.xdataLabel.setText("xdata : " + String(format: "%06f", (accelData?.acceleration.x)!))
            self.ydataLabel.setText("ydata : " + String(format: "%06f", (accelData?.acceleration.y)!))
            self.zdataLabel.setText("zdata : " + String(format: "%06f", (accelData?.acceleration.z)!))
        })
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        if (message["StartFlag"] as! String?) != nil{
            StartAccelerator()
        }
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print("activationDidComplete")
    }

}
