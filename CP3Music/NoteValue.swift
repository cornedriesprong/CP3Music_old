//
//  NoteValue.swift
//  CP3Music
//
//  Created by Corné on 13/02/2021.
//  Copyright © 2021 cp3.io. All rights reserved.
//

import UIKit

public struct NoteValue: Codable {
    
    // define a fake class to reference the bundle to, for showing images
    private class SpoofClass {}
    
    public enum Duration: Int, Codable, CaseIterable, CustomStringConvertible {
        
        case doubleWholeNote
        case wholeNote
        case halfNote
        case quarterNote
        case eighthNote
        case sixteenthNote
        case thirthySecondNote
        case sixtyFourthNote
        
        public var description: String {
            switch self {
            case .doubleWholeNote:
                return "double whole note"
            case .wholeNote:
                return "whole note"
            case .halfNote:
                return "half note"
            case .quarterNote:
                return "quarter note"
            case .eighthNote:
                return "eighth note"
            case .sixteenthNote:
                return "16th note"
            case .thirthySecondNote:
                return "32nd note"
            case .sixtyFourthNote:
                return "64th note"
            }
        }
        
        var value: Double {
            switch self {
            case .doubleWholeNote:
                return 1.0 * 2.0
            case .wholeNote:
                return 1.0
            case .halfNote:
                return 1.0 / 2.0
            case .quarterNote:
                return 1.0 / 4.0
            case .eighthNote:
                return 1.0 / 8.0
            case .sixteenthNote:
                return 1.0 / 16.0
            case .thirthySecondNote:
                return 1.0 / 32.0
            case .sixtyFourthNote:
                return 1.0 / 64.0
            }
        }
        
        public var image: UIImage? {
            let bundle = Bundle(for: SpoofClass.self)
            switch self {
            case .doubleWholeNote:
                return UIImage(named: "double_whole_note", in: bundle, compatibleWith: nil)
            case .wholeNote:
                return UIImage(named: "whole_note", in: bundle, compatibleWith: nil)
            case .halfNote:
                return UIImage(named: "half_note", in: bundle, compatibleWith: nil)
            case .quarterNote:
                return UIImage(named: "quarter_note", in: bundle, compatibleWith: nil)
            case .eighthNote:
                return UIImage(named: "eighth_note", in: bundle, compatibleWith: nil)
            case .sixteenthNote:
                return UIImage(named: "sixteenth_note", in: bundle, compatibleWith: nil)
            case .thirthySecondNote:
                return UIImage(named: "32nd_note", in: bundle, compatibleWith: nil)
            case .sixtyFourthNote:
                return UIImage(named: "64th_note", in: bundle, compatibleWith: nil)
            }
        }
        
        func next() -> Duration? {
            if let currentIndex = Duration.allCases.firstIndex(of: self), currentIndex + 1 < Duration.allCases.count {
                return Duration.allCases[currentIndex + 1]
            } else {
                return nil
            }
        }
        
        func previous() -> Duration? {
            if let currentIndex = Duration.allCases.firstIndex(of: self), currentIndex - 1 >= 0 {
                return Duration.allCases[currentIndex - 1]
            } else {
                return nil
            }
        }
    }
    
    public enum Dot: Int, Codable, CaseIterable, CustomStringConvertible {
        case single, double
        
        var value: Double {
            switch self {
            case .single:
                return 1.5
            case .double:
                return 1.75
            }
        }
        
        public var description: String {
            switch self {
            case .single:
                return "dotted"
            case .double:
                return "double dotted"
            }
        }
        
        public var image: UIImage? {
            let bundle = Bundle(for: SpoofClass.self)
            switch self {
            case .single:
                return UIImage(named: "dotted", in: bundle, compatibleWith: nil)
            case .double:
                return UIImage(named: "double dotted", in: bundle, compatibleWith: nil)
            }
        }
    }
    
    public enum Tuplet: Int, Codable, CaseIterable, CustomStringConvertible {
        case duplet, triplet, quintuplet, septuplet/*, nonuplet*/
        
        var value: Double {
            switch self {
            case .duplet:
                return 3 / 2
            case .triplet:
                return 2 / 3
            case .quintuplet:
                return 2 / 5
            case .septuplet:
                return 2 / 7
//            case .nonuplet:
//                return 2 / 9
            }
        }
        
        public var description: String {
            switch self {
            case .duplet:
                return "duplet"
            case .triplet:
                return "triplet"
            case .quintuplet:
                return "quintuplet"
            case .septuplet:
                return "septuplet"
//            case .nonuplet:
//                return "nonuplet"
            }
        }
        
        public var image: UIImage? {
            let bundle = Bundle(for: SpoofClass.self)
            switch self {
            case .duplet:
                return UIImage(named: "duplet", in: bundle, compatibleWith: nil)
            case .triplet:
                return UIImage(named: "triplet", in: bundle, compatibleWith: nil)
            case .quintuplet:
                return UIImage(named: "quintuplet", in: bundle, compatibleWith: nil)
            case .septuplet:
                return UIImage(named: "septuplet", in: bundle, compatibleWith: nil)
//            case .nonuplet:
//                return UIImage(named: "nonuplet", in: bundle, compatibleWith: nil)
            }
        }
    }
    
    // MARK: - Properties
    
    private let duration: Duration
    private var dot: Dot?
    private var tuplet: Tuplet?
    
    // MARK: - Initialization
    
    public init(duration: Duration, dot: Dot? = nil, tuplet: Tuplet? = nil) {
        self.duration = duration
        self.dot = dot
        self.tuplet = tuplet
    }
    
    public func value() -> Double {
        
        let dotValue = dot?.value ?? 1.0
        let tupletValue = tuplet?.value ?? 1.0
        let value = duration.value * dotValue * tupletValue
        return value
    }
    
    public func getDuration() -> Duration {
        return duration
    }
    
    public func getDot() -> Dot? {
        return dot
    }
    
    public func getTuplet() -> Tuplet? {
        return tuplet
    }
    
    public func next() -> NoteValue? {
        if let nextDuration = duration.next() {
            return NoteValue(duration: nextDuration, dot: dot, tuplet: tuplet)
        } else {
            return nil
        }
    }
    
    public func previous() -> NoteValue? {
        if let previousDuration = duration.previous() {
            return NoteValue(duration: previousDuration, dot: dot, tuplet: tuplet)
        } else {
            return nil
        }
    }
    
    public func image() -> UIImage? {
        return duration.image
    }
}

extension NoteValue: CustomStringConvertible {
    
    public var description: String {
        return "\(dot?.description ?? "") \(duration.description) \(tuplet?.description ?? "")"
    }
}
