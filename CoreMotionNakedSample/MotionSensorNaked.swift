//
//  MotionSensorNaked.swift
//  CoreMotionNakedSample
//
//  Created by 今井幸宣 on 2020/07/11.
//  Copyright © 2020 yukinobu.imai. All rights reserved.
//

import Foundation

import UIKit
import CoreMotion

class MotionSensorNaked: NSObject, ObservableObject {

    @Published var isStarted = false

    @Published var xStr = "0.0"
    @Published var yStr = "0.0"
    @Published var zStr = "0.0"

    let motionManager = CMMotionManager()

    func start() {
        if motionManager.isAccelerometerAvailable {
            motionManager.accelerometerUpdateInterval = 0.1
            motionManager.startAccelerometerUpdates(to: OperationQueue.current!) { (motion:CMAccelerometerData?, error:Error?) in
                self.updateMotionData(motionData: motion!)
            }
        }

        isStarted = true
    }

    func stop() {
        isStarted = false
        motionManager.stopAccelerometerUpdates()
    }

    private func updateMotionData(motionData:CMAccelerometerData) {
        xStr = String(motionData.acceleration.x)
        yStr = String(motionData.acceleration.y)
        zStr = String(motionData.acceleration.z)
    }
}

//class MotionSensorNaked: NSObject, ObservableObject {
//
//    @Published var isStarted = false
//
//    @Published var xStr = "0.0"
//    @Published var yStr = "0.0"
//    @Published var zStr = "0.0"
//
//    let motionManager = CMMotionManager()
//
//    func start() {
//        if motionManager.isGyroAvailable {
//            motionManager.gyroUpdateInterval = 0.1
//            motionManager.startGyroUpdates(to: OperationQueue.current!) { (motion:CMGyroData?, error:Error?) in
//                self.updateMotionData(motionData: motion!)
//            }
//        }
//
//        isStarted = true
//    }
//
//    func stop() {
//        isStarted = false
//        motionManager.stopGyroUpdates()
//    }
//
//    private func updateMotionData(motionData:CMGyroData) {
//        xStr = String(motionData.rotationRate.x)
//        yStr = String(motionData.rotationRate.y)
//        zStr = String(motionData.rotationRate.z)
//    }
//}

//class MotionSensorNaked: NSObject, ObservableObject {
//
//    @Published var isStarted = false
//
//    @Published var xStr = "0.0"
//    @Published var yStr = "0.0"
//    @Published var zStr = "0.0"
//
//    let motionManager = CMMotionManager()
//
//    func start() {
//        if motionManager.isMagnetometerAvailable {
//            motionManager.magnetometerUpdateInterval = 0.1
//            motionManager.startMagnetometerUpdates(to: OperationQueue.current!) { (motion:CMMagnetometerData?, error:Error?) in
//                self.updateMotionData(motionData: motion!)
//            }
//        }
//
//        isStarted = true
//    }
//
//    func stop() {
//        isStarted = false
//        motionManager.stopMagnetometerUpdates()
//    }
//
//    private func updateMotionData(motionData:CMMagnetometerData) {
//        xStr = String(motionData.magneticField.x)
//        yStr = String(motionData.magneticField.y)
//        zStr = String(motionData.magneticField.z)
//    }
//}
