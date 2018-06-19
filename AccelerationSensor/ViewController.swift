//
//  ViewController.swift
//  AccelerationSensor
//
//  Created by 土居将史 on 2018/06/14.
//  Copyright © 2018年 土居将史. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    //MotionManagerのインスタンス生成
    let motion: CMMotionManager = CMMotionManager()

    //X,Y,Zの値を表示するTextLabel
    @IBOutlet weak var valueX: UILabel!
    @IBOutlet weak var valueY: UILabel!
    @IBOutlet weak var valueZ: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 更新周期を設定.
        motion.accelerometerUpdateInterval = 0.1
        
        motion.startAccelerometerUpdates(to: OperationQueue.current!, withHandler: {(accelData: CMAccelerometerData?, errorOC:Error?) -> Void in
            self.valueX.text = String(format: "%06f", (accelData?.acceleration.x)!)
            self.valueY.text = String(format: "%06f", (accelData?.acceleration.y)!)
            self.valueZ.text = String(format: "%06f", (accelData?.acceleration.z)!)
            })
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

