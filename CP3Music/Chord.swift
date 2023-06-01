//
//  Chord.swift
//  CP3Music
//
//  Created by Corné on 08/05/2020.
//  Copyright © 2020 cp3.io. All rights reserved.
//

import Foundation

public struct Chord {
    
    public enum Quality {
        case major, minor
        
        public var intervals: [Interval] {
            switch self {
            case .major:
                return [.P0, .M3, .P5]
            case .minor:
                return [.P0, .m3, .P5]
            }
        }
        
        var symbol: String {
            switch self {
            case .major:
                return "M"
            case .minor:
                return "m"
            }
        }
    }
    
    public let pitches: Set<Pitch>
    public let quality: Chord.Quality
    
    // NOTE: for now we only support non-inverted major and minor chords
    public init?(pitches: Set<Pitch>) {
        
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
    
    public init?(root: Pitch, quality: Quality) {
        // build chord from root pitch
        self.quality = quality
        let pitchValues = quality.intervals.map { root.midiNoteNumber + $0.rawValue }
        self.pitches = Set(pitchValues.map { Pitch(midiNoteNumber: $0) })
    }
    
    public func rootPitch() -> Pitch {
        // NOTE: for now we always assume the lower pitch is the root
        pitches.sorted(by: { $0.midiNoteNumber < $1.midiNoteNumber }).first!
    }
}

extension Chord: CustomStringConvertible {
    
    public var description: String {
        return "\(rootPitch().class.description)\(self.quality.symbol)"
    }
}
