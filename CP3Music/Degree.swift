//
//  Degree.swift
//  CP3Music
//
//  Created by Corné on 07/05/2020.
//  Copyright © 2020 cp3.io. All rights reserved.
//

import Foundation

public struct Degree {
    
    enum Numeral: Int8, CaseIterable {
        case i
        case bii
        case ii
        case biii
        case iii
        case iv
        case bv /* i.e., #iv */
        case v
        case bvi
        case vi
        case bvii
        case vii
    }
    
    enum Quality {
        case major, minor
    }
        
    private var numeral: Numeral
    private var quality: Quality
    
    public init?(chord: Chord, in scale: Scale) {
        
        switch chord.quality {
        case .major:
            self.quality = .major
        case .minor:
            self.quality = .minor
        }
        
        let noteValue = scale.key.root.rawValue + scale.key.accidental.rawValue
        let rootMidiNoteNumber = chord.rootPitch().midiNoteNumber
        let rawValue = mod(rootMidiNoteNumber - noteValue, Int8(Numeral.allCases.count))
        self.numeral = Numeral(rawValue: rawValue)!
    }
}

extension Degree: CustomStringConvertible {
    
    public var description: String {
        switch (numeral, quality) {
        case (.i, .major):
            return "I"
        case (.i, .minor):
            return "i"
        case (.bii, .major):
            return "♭II"
        case (.bii, .minor):
            return "♭ii"
        case (.ii, .minor):
            return "ii"
        case (.ii, .major):
            return "II"
        case (.biii, .major):
            return "♭III"
        case (.biii, .minor):
            return "♭iii"
        case (.iii, .major):
            return "III"
        case (.iii, .minor):
            return "iii"
        case (.iv, .major):
            return "IV"
        case (.iv, .minor):
            return "iv"
        case (.v, .major):
            return "V"
        case (.v, .minor):
            return "v"
        case (.bv, .major):
            return "♭V"
        case (.bv, .minor):
            return "♭v"
        case (.bvi, .major):
            return "♭VI"
        case (.bvi, .minor):
            return "♭vi"
        case (.vi, .major):
            return "VI"
        case (.vi, .minor):
            return "vi"
        case (.bvii, .major):
            return "♭VII"
        case (.bvii, .minor):
            return "♭vii"
        case (.vii, .major):
            return "VII"
        case (.vii, .minor):
            return "vii"
        }
    }
}
