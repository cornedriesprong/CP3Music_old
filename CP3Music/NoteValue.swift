//
//  NoteValue.swift
//  CP3Music
//
//  Created by Corné on 13/02/2021.
//  Copyright © 2021 cp3.io. All rights reserved.
//

import UIKit

public enum NoteValue: Int, CaseIterable {
    
    // define a fake class to reference the bundle to, for showing images
    class SpoofClass {}
    
    case wholeNote
    case dottedHalfNote
    case halfNote
    case halfNoteTriplet
    case dottedQuarterNote
    case quarterNote
    case quarterNoteTriplet
    case dottedEighthNote
    case eighthNote
    case eighthNoteTriplet
    case dottedSixteenthNote
    case sixteenthNote
    case sixteenthNoteTriplet
    
    public var clockDivision: Float {
        switch self {
        case .wholeNote:
            return 1.0
        case .dottedHalfNote:
            return 1.0 / 1.5
        case .halfNote:
            return 1.0 / 2.0
        case .halfNoteTriplet:
            return 1.0 / 3.0
        case .dottedQuarterNote:
            return 1.0 / 4.0
        case .quarterNote:
            return 1.0 / 4.0
        case .quarterNoteTriplet:
            return 1.0 / 6.0
        case .dottedEighthNote:
            return 1.0 / 7.0
        case .eighthNote:
            return 1.0 / 8.0
        case .eighthNoteTriplet:
            return 1.0 / 10.0
        case .dottedSixteenthNote:
            return 1.0 / 16.0
        case .sixteenthNote:
            return 1.0 / 16.0
        case .sixteenthNoteTriplet:
            return 1.0 / 20.0
        }
    }
    
    public var image: UIImage? {
        let bundle = Bundle(for: SpoofClass.self)
        switch self {
        case .wholeNote:
            return UIImage(named: "whole_note", in: bundle, compatibleWith: nil)
        case .dottedHalfNote:
            return UIImage(named: "half_note_dotted", in: bundle, compatibleWith: nil)
        case .halfNote:
            return UIImage(named: "half_note", in: bundle, compatibleWith: nil)
        case .halfNoteTriplet:
            return UIImage(named: "half_note_triplet", in: bundle, compatibleWith: nil)
        case .dottedQuarterNote:
            return UIImage(named: "quarter_note_dotted", in: bundle, compatibleWith: nil)
        case .quarterNote:
            return UIImage(named: "quarter_note", in: bundle, compatibleWith: nil)
        case .quarterNoteTriplet:
            return UIImage(named: "quarter_note_triplet", in: bundle, compatibleWith: nil)
        case .dottedEighthNote:
            return UIImage(named: "eighth_note_dotted", in: bundle, compatibleWith: nil)
        case .eighthNote:
            return UIImage(named: "eighth_note", in: bundle, compatibleWith: nil)
        case .eighthNoteTriplet:
            return UIImage(named: "eighth_note_triplet", in: bundle, compatibleWith: nil)
        case .dottedSixteenthNote:
            return UIImage(named: "sixteenth_note_dotted", in: bundle, compatibleWith: nil)
        case .sixteenthNote:
            return UIImage(named: "sixteenth_note", in: bundle, compatibleWith: nil)
        case .sixteenthNoteTriplet:
            return UIImage(named: "sixteenth_note_triplet", in: bundle, compatibleWith: nil)
        }
    }
}
