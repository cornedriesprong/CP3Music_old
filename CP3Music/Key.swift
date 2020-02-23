//
//  Key.swift
//  CP3Music
//
//  Created by Corné on 23/02/2020.
//  Copyright © 2020 cp3.io. All rights reserved.
//

import Foundation

// TODO:
// transpose
// pitches in key + scale
// parallel/relative keys

struct Key {
    
    var root: Root
    var accidental: Accidental
    
    init(_ root: Root, _ accidental: Accidental = .natural) {
        self.root = root
        self.accidental = accidental
    }
}

extension Key {
    
    enum Root: Int, CaseIterable, CustomStringConvertible {
        case c = 0
        case d = 2
        case e = 4
        case f = 5
        case g = 7
        case a = 9
        case b = 11
        
        var description: String {
            switch self {
            case .c:
                return "C"
            case .d:
                return "D"
            case .e:
                return "E"
            case .f:
                return "F"
            case .g:
                return "G"
            case .a:
                return "A"
            case .b:
                return "B"
            }
        }
    }
}
