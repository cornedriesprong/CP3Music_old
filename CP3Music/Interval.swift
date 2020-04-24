//
//  Interval.swift
//  CP3Music
//
//  Created by Corné on 23/02/2020.
//  Copyright © 2020 cp3.io. All rights reserved.
//

import Foundation

public enum Interval: Int {
    case p0 = 0
    case m2 = 1
    case M2 = 2
    case m3 = 3
    case M3 = 4
    case p4 = 5
    case a4_d5 = 6
    case p5 = 7
    case m6 = 8
    case M6 = 9
    case m7 = 10
    case M7 = 11
    case p8 = 12
}

extension Interval: CustomStringConvertible {
    
    var description: String {
        switch self {
        case .p0:
            return "Unison"
        case .m2:
            return "Minor second"
        case .M2:
            return "Major second"
        case .m3:
            return "Minor third"
        case .M3:
            return "Major third"
        case .p4:
            return "Perfect fourth"
        case .a4_d5:
            return "Augmented fourth/diminished fifth"
        case .p5:
            return "Perfect fifth"
        case .m6:
            return "Minor sixth"
        case .M6:
            return "Major sixth"
        case .m7:
            return "Minor seventh"
        case .M7:
            return "Major sixth"
        case .p8:
            return "Perfect octave"
        }
    }
}
