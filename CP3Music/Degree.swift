//
//  Degree.swift
//  CP3Music
//
//  Created by Corné on 07/05/2020.
//  Copyright © 2020 cp3.io. All rights reserved.
//

import Foundation

public enum Degree: Int, CaseIterable {
    case i, bii, ii, biii, iii, iv, bv/* i.e., #IV */, v, bvi, vi, bvii, vii
    
    // root note
    public init(of pitch: Pitch, in scale: Scale) {
        
        let modMidiNoteNumber = pitch.midiNoteNumber % 12
        let noteValue = scale.key.root.rawValue + scale.key.accidental.rawValue
        let rawValue = mod(modMidiNoteNumber - noteValue, Degree.allCases.count)
        self.init(rawValue: rawValue)!
    }
    
}

extension Degree: CustomStringConvertible {
    
    public var description: String {
        switch self {
        case .i:
            return "I"
        case .bii:
            return "♭ii"
        case .ii:
            return "ii"
        case .biii:
            return "♭iii"
        case .iii:
            return "iii"
        case .iv:
            return "IV"
        case .bv:
            return "#IV"
        case .v:
            return "V"
        case .bvi:
            return "♭vi"
        case .vi:
            return "vi"
        case .bvii:
            return "♭vii"
        case .vii:
            return "vii"
        }
    }
}
