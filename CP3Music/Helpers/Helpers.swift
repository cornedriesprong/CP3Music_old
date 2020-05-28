//
//  Helpers.swift
//  CP3Music
//
//  Created by Corné on 23/02/2020.
//  Copyright © 2020 cp3.io. All rights reserved.
//

import Foundation

// modulo function which supports negative numbers
func mod(_ a: Int, _ n: Int) -> Int {
    precondition(n > 0, "modulus must be positive")
    let r = a % n
    return r >= 0 ? r : r + n
}

let ticksToSeconds: TimeInterval = {
    var tinfo = mach_timebase_info()
    let err = mach_timebase_info(&tinfo)
    let timecon = Double(tinfo.numer) / Double(tinfo.denom)
    return timecon * 0.000_000_001
}()

let secondsToTicks: TimeInterval = {
    var tinfo = mach_timebase_info()
    let err = mach_timebase_info(&tinfo)
    let timecon = Double(tinfo.denom) / Double(tinfo.numer)
    return timecon * 1_000_000_000
}()
