//
//  Pitch.swift
//  CP3Music
//
//  Created by Corné on 23/02/2020.
//  Copyright © 2020 cp3.io. All rights reserved.
//

import UIKit

public struct Pitch: Hashable {
    
    public var midiNoteNumber: Int
    
    public var octave: Int {
        return Int(floor(Float(midiNoteNumber) / 12))
    }
    
    public var `class`: Class {
        return Class(rawValue: midiNoteNumber % 12)!
    }
    
    public init(midiNoteNumber: Int) {
        self.midiNoteNumber = midiNoteNumber
    }
    
    init(_ class: Class, _ accidental: Accidental = .natural, _ octave: Int) {
        self.midiNoteNumber = `class`.rawValue + accidental.rawValue + octave * 12
    }
    
    public func interval(to pitch: Pitch) -> Interval? {
        
        let value = pitch.midiNoteNumber - self.midiNoteNumber
        
        if value < 0 {
            let reversedValue = value * -1
            return Interval(rawValue: reversedValue)!.inverse()
            
        } else {
            return Interval(rawValue: value)!
        }
    }
}

extension Pitch {
    
    public enum Class: Int, Hashable, CustomStringConvertible {
        case c, cs, d, ds, e, f, fs, g, gs, a, `as`, b
        
        // TODO: add flats to descriptions based on accidental
        public var description: String {
            switch self {
            case .c:
                return "C"
            case .cs:
                return "C#"
            case .d:
                return "D"
            case .ds:
                return "D#"
            case .e:
                return "E"
            case .f:
                return "F"
            case .fs:
                return "F#"
            case .g:
                return "G"
            case .gs:
                return "G#"
            case .a:
                return "A"
            case .as:
                return "A#"
            case .b:
                return "B"
            }
        }
        
        public init(midiNoteNumber: Int) {
            let modPitch = mod(midiNoteNumber, 12)
            self.init(rawValue: modPitch)!
        }
    }
}
