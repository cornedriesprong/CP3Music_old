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
    
    // compound
    case m9 = 13
    case M9 = 14
    case m10 = 15
    case M10 = 16
    case p11 = 17
    case a11_d12 = 18
    case p12 = 19
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
        case .m9:
            return "Minor ninth"
        case .M9:
            return "Major ninth"
        case .m10:
            return "Minor tenth"
        case .M10:
            return "Major tenth"
        case .p11:
            return "Perfect eleventh"
        case .a11_d12:
            return "Augmented eleventh/diminished twelfth"
        case .p12:
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
}
