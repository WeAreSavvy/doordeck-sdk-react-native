//
//  Util.swift
//  doordeck-sdk-swift
//
//  Copyright © 2019 Doordeck. All rights reserved.
//

import Foundation
#if os(iOS)
import AudioToolbox.AudioServices
#endif

class Util {
    func onMain(_ block: @escaping () -> Void) {
        DispatchQueue.main.async(execute: block)
    }
    
    func vibrateNow () {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
    
    func isLowPowerModeEnabled() -> Bool {
        guard ProcessInfo.processInfo.isLowPowerModeEnabled == false else { return true }
        return false
    }
}
