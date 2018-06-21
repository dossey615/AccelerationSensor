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
    var accelData:[AcceleratrDate] = []
    let acInfo = AcceleratrDate()

    //X,Y,Zの値を表示するTextLabel
    @IBOutlet weak var valueX: UILabel!
    @IBOutlet weak var valueY: UILabel!
    @IBOutlet weak var valueZ: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
  
    @IBAction func StartButton(_ sender: Any) {
        MeasureAccel()
    }
    @IBAction func StopButton(_ sender: Any) {
        if (motion.isAccelerometerActive) {
            for i in (0..<accelData.count){
                print(accelData[i].x)
            }
            print(accelData.count)
            motion.stopAccelerometerUpdates()
            let next = storyboard!.instantiateViewController(withIdentifier: "resultView")
            self.present(next,animated: true, completion: nil)
        }
    }
    
    func MeasureAccel(){
        // 更新周期を設定.
        motion.accelerometerUpdateInterval = 0.5
        //値を取得し、表示
        motion.startAccelerometerUpdates(to: OperationQueue.current!, withHandler: {(accelData: CMAccelerometerData?, errorOC:Error?) -> Void in
            self.valueX.text = String(format: "%06f", (accelData?.acceleration.x)!)
            self.valueY.text = String(format: "%06f", (accelData?.acceleration.y)!)
            self.valueZ.text = String(format: "%06f", (accelData?.acceleration.z)!)
            self.acInfo.x = (accelData?.acceleration.x)!
            self.acInfo.y = (accelData?.acceleration.y)!
            self.acInfo.z = (accelData?.acceleration.z)!
            self.accelData.append(self.acInfo)
        })
        
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

