//
//  Scale.swift
//  CP3Music
//
//  Created by Corné on 23/02/2020.
//  Copyright © 2020 cp3.io. All rights reserved.
//

import Foundation

public struct Scale {
    
    let key: Key
    let quality: Scale.Quality
    
    var pitches: [Pitch.Class] {
        
        return quality.intervals.compactMap { interval in
            let raw = mod(key.root.rawValue + interval.rawValue + key.accidental.rawValue, 12)
            return Pitch.Class(rawValue: raw)
        }
    }
    
    var relative: [Scale] {
        
        // iterate over all qualities except current one
        let qualities = Set(Scale.Quality.allCases).subtracting([quality])
        var scales = [Scale]()
        
        // find all the keys with the same pitches as the current one
        for quality in qualities {
            for root in Key.Root.allCases {
                for accidental in Accidental.allCases {
                    let key = Key(root, accidental)
                    let scale = Scale(key, quality)
                    if Set(pitches) == Set(scale.pitches) {
                        scales.append(scale)
                    }
                }
            }
        }
        
        return scales
    }
    
    var parallel: Scale? {
        switch quality {
        case .major:
            return Scale(key, .minor)
        case .minor:
            return Scale(key, .major)
        default:
            return nil
        }
    }
    
    init(_ key: Key, _ quality: Scale.Quality) {
        self.key = key
        self.quality = quality
    }
}

extension Scale {
    
    enum Quality: Int, CaseIterable, Codable {
        case major,
        minor,
        pentatonic,
        dorian,
        phrygrian,
        lydian,
        mixolydian,
        locrian
        
        var intervals: [Interval] {
            switch self {
            case .major:
                return [.p0, .M2, .M3, .p4, .p5, .M6, .M7]
            case .minor:
                return [.p0, .M2, .m3, .p4, .p5, .m6, .m7]
            case .pentatonic:
                return [.p0, .M3, .p4, .p5, .M6]
            case .dorian:
                return [.p0, .M2, .m3, .p4, .p5, .M6, .m7]
            case .phrygrian:
                return [.p0, .m2, .m3, .p4, .p5, .m6, .m7]
            case .lydian:
                return [.p0, .M2, .M3, .a4_d5, .p5, .M6, .M7]
            case .mixolydian:
                return [.p0, .M2, .M3, .p4, .p5, .M6, .m7]
            case .locrian:
                return [.p0, .m2, .m3, .p4, .a4_d5, .m6, .m7]
            }
        }
        
        var description: String {
            switch self {
            case .major:
                return "Ionian (Major)"
            case .minor:
                return "Aeolian (Minor)"
            case .pentatonic:
                return "Pentatonic"
            case .dorian:
                return "Dorian"
            case .phrygrian:
                return "Phrygrian"
            case .lydian:
                return "Lydian"
            case .mixolydian:
                return "Mixolydian"
            case .locrian:
                return "Locrian"
            }
        }
    }
}

extension Scale: Equatable {
    
    static func == (lhs: Scale, rhs: Scale) -> Bool {
        lhs.pitches == rhs.pitches
    }
}

extension Scale: CustomStringConvertible {
    
    var description: String {
        return "\(key.root.description)\(key.accidental.description)\(quality.description)"
    }
}
