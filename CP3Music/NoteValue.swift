//
//  NoteValue.swift
//  CP3Music
//
//  Created by Corné on 13/02/2021.
//  Copyright © 2021 cp3.io. All rights reserved.
//

import UIKit

public enum NoteValue: Int, Codable, CaseIterable {
    
    // define a fake class to reference the bundle to, for showing images
    class SpoofClass {}
    
    case doubleWholeNote
    case dottedWholeNote
    case wholeNote
    case wholeNoteTriplet
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
    case dottedThirthySecondNote
    case thirthySecondNote
    case thirthySecondNoteTriplet
    case dottedSixtyFourthNote
    case sixtyFourthNote
    case sixtyFourthNoteTriplet
    
    public var duration: Float {
        
        switch self {
        case .doubleWholeNote:
            return NoteValue.wholeNote.duration * 2.0
        case .dottedWholeNote:
            return NoteValue.wholeNote.duration * 1.5
        case .wholeNote:
            return 1.0
        case .wholeNoteTriplet:
            return NoteValue.doubleWholeNote.duration / 3.0
        case .dottedHalfNote:
            return NoteValue.halfNote.duration * 1.5
        case .halfNote:
            return NoteValue.wholeNote.duration / 2.0
        case .halfNoteTriplet:
            return NoteValue.wholeNote.duration / 3.0
        case .dottedQuarterNote:
            return NoteValue.quarterNote.duration * 1.5
        case .quarterNote:
            return NoteValue.wholeNote.duration / 4.0
        case .quarterNoteTriplet:
            return NoteValue.halfNote.duration / 3.0
        case .dottedEighthNote:
            return NoteValue.eighthNote.duration * 1.5
        case .eighthNote:
            return NoteValue.wholeNote.duration / 8.0
        case .eighthNoteTriplet:
            return NoteValue.quarterNote.duration / 3.0
        case .dottedSixteenthNote:
            return NoteValue.sixteenthNote.duration * 1.5
        case .sixteenthNote:
            return NoteValue.wholeNote.duration / 16.0
        case .sixteenthNoteTriplet:
            return NoteValue.eighthNote.duration / 3.0
        case .dottedThirthySecondNote:
            return NoteValue.thirthySecondNote.duration * 1.5
        case .thirthySecondNote:
            return NoteValue.wholeNote.duration / 32.0
        case .thirthySecondNoteTriplet:
            return NoteValue.sixteenthNote.duration / 3.0
        case .dottedSixtyFourthNote:
            return NoteValue.sixtyFourthNote.duration * 1.5
        case .sixtyFourthNote:
            return NoteValue.wholeNote.duration / 64.0
        case .sixtyFourthNoteTriplet:
            return NoteValue.thirthySecondNote.duration / 3.0
        }
    }
    
    public var image: UIImage? {
        let bundle = Bundle(for: SpoofClass.self)
        switch self {
        case .doubleWholeNote:
            return UIImage(named: "double_whole_note", in: bundle, compatibleWith: nil)
        case .dottedWholeNote:
            return UIImage(named: "whole_note_dotted", in: bundle, compatibleWith: nil)
        case .wholeNote:
            return UIImage(named: "whole_note", in: bundle, compatibleWith: nil)
        case .wholeNoteTriplet:
            return UIImage(named: "whole_note_triplet", in: bundle, compatibleWith: nil)
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
        case .dottedThirthySecondNote:
            return UIImage(named: "32nd_note_dotted", in: bundle, compatibleWith: nil)
        case .thirthySecondNote:
            return UIImage(named: "32nd_note", in: bundle, compatibleWith: nil)
        case .thirthySecondNoteTriplet:
            return UIImage(named: "32nd_note_triplet", in: bundle, compatibleWith: nil)
        case .dottedSixtyFourthNote:
            return UIImage(named: "64th_note_dotted", in: bundle, compatibleWith: nil)
        case .sixtyFourthNote:
            return UIImage(named: "64th_note", in: bundle, compatibleWith: nil)
        case .sixtyFourthNoteTriplet:
            return UIImage(named: "64th_note_triplet", in: bundle, compatibleWith: nil)
        }
    }
}

extension NoteValue: CustomStringConvertible {
    
    public var description: String {
        switch self {
        case .doubleWholeNote:
            return "double whole note"
        case .dottedWholeNote:
            return "dotted whole note"
        case .wholeNoteTriplet:
            return "whole note triplet"
        case .wholeNote:
            return "whole note"
        case .dottedHalfNote:
            return "dotted half note"
        case .halfNote:
            return "half note"
        case .halfNoteTriplet:
            return "half note triplet"
        case .dottedQuarterNote:
            return "dotted quarter note"
        case .quarterNote:
            return "quarter note"
        case .quarterNoteTriplet:
            return "quarter note triplet"
        case .dottedEighthNote:
            return "dotted eighth note"
        case .eighthNote:
            return "eighth note"
        case .eighthNoteTriplet:
            return "eighth note triplet"
        case .dottedSixteenthNote:
            return "dotted 16th note"
        case .sixteenthNote:
            return "16th note"
        case .sixteenthNoteTriplet:
            return "16th note triplet"
        case .dottedThirthySecondNote:
            return "dotted 32nd note"
        case .thirthySecondNote:
            return "32nd note"
        case .thirthySecondNoteTriplet:
            return "32nd note triplet"
        case .dottedSixtyFourthNote:
            return "dotted 64th note"
        case .sixtyFourthNote:
            return "64th note"
        case .sixtyFourthNoteTriplet:
            return "64th note triplet"
        }
    }
}
