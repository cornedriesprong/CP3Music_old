//
//  Accidental.swift
//  CP3Music
//
//  Created by Corné on 23/02/2020.
//  Copyright © 2020 cp3.io. All rights reserved.
//

import Foundation

public enum Accidental: Int8, Codable, CaseIterable {
    case flat = -1
    case natural = 0
    case sharp = 1
}

extension Accidental: CustomStringConvertible {
    
    public var description: String {
        switch self {
        case .flat:
            return "♭"
        case .natural:
            return "♮"
        case .sharp:
            return "♯"
        }
    }
}
