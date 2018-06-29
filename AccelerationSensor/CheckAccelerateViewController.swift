//
//  CheckAccelerateViewController.swift
//  AccelerationSensor
//
//  Created by 土居将史 on 2018/06/14.
//  Copyright © 2018年 土居将史. All rights reserved.
//

import UIKit
import CoreMotion

class CheckAccelerateViewController: UIViewController {
    
    //MotionManagerのインスタンス生成
    let motion: CMMotionManager = CMMotionManager()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var accelData:[AcceleratrDate] = []


    //X,Y,Zの値を表示するTextLabel
    @IBOutlet weak var valueX: UILabel!
    @IBOutlet weak var valueY: UILabel!
    @IBOutlet weak var valueZ: UILabel!
    
    @IBOutlet weak var StartSet: UIButton!
    @IBOutlet weak var StopSet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        StopSet.isEnabled = false
    }

    
    @IBAction func StartButton(_ sender: Any) {
        StartSet.isEnabled = false
        StopSet.isEnabled = true
        MeasureAccel()
    }
    @IBAction func StopButton(_ sender: Any) {
        if (motion.isAccelerometerActive) {
            motion.stopAccelerometerUpdates()
            let next = storyboard!.instantiateViewController(withIdentifier: "resultView")
            self.present(next,animated: true, completion: nil)
            StartSet.isEnabled = true
            StopSet.isEnabled = false
        }
    }
    func MeasureAccel(){
        // 更新周期を設定.
        motion.accelerometerUpdateInterval = 0.1
        //値を取得し、表示
        motion.startAccelerometerUpdates(to: OperationQueue.current!, withHandler: {(accelData: CMAccelerometerData?, errorOC:Error?) -> Void in
            let acInfo = AcceleratrDate()
            self.valueX.text = String(format: "%06f", (accelData?.acceleration.x)!)
            self.valueY.text = String(format: "%06f", (accelData?.acceleration.y)!)
            self.valueZ.text = String(format: "%06f", (accelData?.acceleration.z)!)
            acInfo.x = (accelData?.acceleration.x)!
            acInfo.y = (accelData?.acceleration.y)!
            acInfo.z = (accelData?.acceleration.z)!
            self.appDelegate.resultData.append(acInfo)
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

