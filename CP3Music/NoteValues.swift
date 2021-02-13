//
//  NoteValues.swift
//  CP3Music
//
//  Created by Corné on 13/02/2021.
//  Copyright © 2021 cp3.io. All rights reserved.
//

import UIKit

public enum NoteValue {
    
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
