//
//  Accidental.swift
//  CP3Music
//
//  Created by Corné on 23/02/2020.
//  Copyright © 2020 cp3.io. All rights reserved.
//

import Foundation

enum Accidental: Int, CaseIterable {
//    case doubleFlat = -2
    case flat = -1
    case natural = 0
    case sharp = 1
//    case doubleSharp = 2
}

extension Accidental: CustomStringConvertible {
    
    var description: String {
        switch self {
//        case .doubleFlat:
//            return "♭♭"
        case .flat:
            return "♭"
        case .natural:
            return "♮"
        case .sharp:
            return "♯"
//        case .doubleSharp:
//            return "♯♯"
        }
    }
}
