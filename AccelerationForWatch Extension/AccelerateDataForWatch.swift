//
//  AccelerateDataForWatch.swift
//  AccelerationForWatch Extension
//
//  Created by 土居将史 on 2018/07/16.
//  Copyright © 2018年 土居将史. All rights reserved.
//

import Foundation

class AcceleratrDate{
    
    //X軸の加速度
    var x: Double = 0.0
    //Y軸の加速度
    var y: Double = 0.0
    //Z軸の加速度
    var z: Double = 0.0
    
    //X軸の最大加速度
    var MaxX: Double = 0.0
    //Y軸の最大加速度
    var MaxY: Double = 0.0
    //Z軸の最大加速度
    var MaxZ: Double = 0.0
    
    //X軸の最低加速度
    var MinX: Double = 0.0
    //Y軸の最低加速度
    var MinY: Double = 0.0
    //Z軸の最低加速度
    var MinZ: Double = 0.0
    
    func checkMax(value: Double, max: Double) -> Double {
        if(max == 0.0){
            return value
        }else if(max < value){
            return value
        }else{
            return max
        }
    }
    
    func checkMin(value: Double, min: Double) -> Double {
        if(min == 0.0){
            return value
        }else if(min > value){
            return value
        }else{
            return min
        }
    }
}
