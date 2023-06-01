//
//  Interval.swift
//  CP3Music
//
//  Created by Corné on 23/02/2020.
//  Copyright © 2020 cp3.io. All rights reserved.
//

import Foundation

public enum Interval: Int8 {
    // simple
    case P0 = 0
    case m2 = 1
    case M2 = 2
    case m3 = 3
    case M3 = 4
    case P4 = 5
    case a4_d5 = 6
    case P5 = 7
    case m6 = 8
    case M6 = 9
    case m7 = 10
    case M7 = 11
    case P8 = 12
    
    // compound
    case m9 = 13
    case M9 = 14
    case m10 = 15
    case M10 = 16
    case P11 = 17
    case a11_d12 = 18
    case P12 = 19
    case m13 = 20
    case M13 = 21
    case m14 = 22
    case M14 = 23
    case P15 = 24
    case a15 = 25
    
    public func inverse() -> Interval {
        
        if self.rawValue <= 12 {
            return Interval(rawValue: abs(self.rawValue - 12))!
        } else {
            return Interval(rawValue: abs(self.rawValue - 24))!
        }
    }
}

extension Interval: CustomStringConvertible {
    
    public var description: String {
        switch self {
        case .P0:
            return "Unison"
        case .m2:
            return "Minor second"
        case .M2:
            return "Major second"
        case .m3:
            return "Minor third"
        case .M3:
            return "Major third"
        case .P4:
            return "Perfect fourth"
        case .a4_d5:
            return "Augmented fourth/diminished fifth"
        case .P5:
            return "Perfect fifth"
        case .m6:
            return "Minor sixth"
        case .M6:
            return "Major sixth"
        case .m7:
            return "Minor seventh"
        case .M7:
            return "Major sixth"
        case .P8:
            return "Perfect octave"
        case .m9:
            return "Minor ninth"
        case .M9:
            return "Major ninth"
        case .m10:
            return "Minor tenth"
        case .M10:
            return "Major tenth"
        case .P11:
            return "Perfect eleventh"
        case .a11_d12:
            return "Augmented eleventh/diminished twelfth"
        case .P12:
            return "Perfect twelfth"
        case .m13:
            return "Minor thirteenth"
        case .M13:
            return "Major thirteenth"
        case .m14:
            return "Minor fourteenth"
        case .M14:
            return "Major fourteenth"
        case .P15:
            return "Perfect fifteenth"
        case .a15:
            return "Augmented fifteenth"
        }
    }
    
    public var shortDescription: String {
        switch self {
        case .P0:
            return "p0"
        case .m2:
            return "m2"
        case .M2:
            return "M2"
        case .m3:
            return "m3"
        case .M3:
            return "M3"
        case .P4:
            return "p4"
        case .a4_d5:
            return "a4/d5"
        case .P5:
            return "P5"
        case .m6:
            return "m6"
        case .M6:
            return "M6"
        case .m7:
            return "m7"
        case .M7:
            return "M7"
        case .P8:
            return "P8"
        case .m9:
            return "m9"
        case .M9:
            return "M9"
        case .m10:
            return "m10"
        case .M10:
            return "M10"
        case .P11:
            return "P11"
        case .a11_d12:
            return "a11/d12"
        case .P12:
            return "P12"
        case .m13:
            return "m13"
        case .M13:
            return "M13"
        case .m14:
            return "m14"
        case .M14:
            return "M14"
        case .P15:
            return "P15"
        case .a15:
            return "a15"
        }
    }
}
