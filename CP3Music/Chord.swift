//
//  Chord.swift
//  CP3Music
//
//  Created by Corné on 08/05/2020.
//  Copyright © 2020 cp3.io. All rights reserved.
//

import Foundation

struct Chord {
    
    enum Quality {
        case major, minor, augmented, diminished, major7th, minor7th, dominant7th
        
        var symbol: String {
            switch self {
            case .major:
                return "M"
            case .minor:
                return "m"
            case .diminished:
                return "dim"
            case .augmented:
                return "aug"
            case .major7th:
                return "M7"
            case .minor7th:
                return "m7"
            case .dominant7th:
                return "7"
            }
        }
    }
    
    let pitches: Set<Pitch>
    let quality: Chord.Quality
    
    // NOTE: for now we only support non-inverted major and minor chords
    init?(pitches: Set<Pitch>) {
        
        guard pitches.count > 1 else {
            // a chord with a single note is not a chord
            return nil
        }
        
        self.pitches = pitches
        
        // TODO: detect chord type (2 note, triad, 7th, 9th, suspended)
        // TODO: try to find permutations
        
        // sort pitches
        let sortedPitches = pitches.sorted(by: { $0.midiNoteNumber < $1.midiNoteNumber })
        
        // first, assume lowest note is root
        let firstInterval = sortedPitches[0].interval(to: sortedPitches[1])
        switch firstInterval {
        case .m3:
            quality = .minor
        case .M3:
            quality = .major
        default:
            // TODO: implement detection for other chord types
            return nil
        }
    }
    
    func rootPitch() -> Pitch {
        // NOTE: for now we always assume the lower pitch is the root
        pitches.sorted(by: { $0.midiNoteNumber < $1.midiNoteNumber }).first!
    }
}

extension Chord: CustomStringConvertible {
    
    var description: String {
        return "\(rootPitch().class.description)\(self.quality.symbol)"
    }
}
