//
//  Key.swift
//  CP3Music
//
//  Created by Corné on 23/02/2020.
//  Copyright © 2020 cp3.io. All rights reserved.
//

import Foundation

public struct Key {
    
    var root: Root
    var accidental: Accidental
    
    init(pitchNumber: Int) {
        let modPitchNumber = pitchNumber % 12
        let root = Root.allCases
            .sorted(by: { $0.rawValue > $1.rawValue })
            .first(where: { $0.rawValue <= modPitchNumber })!
        let accidental: Accidental = modPitchNumber > root.rawValue ? .sharp : .natural
        self.init(root, accidental)
    }
    
    init(_ root: Root, _ accidental: Accidental = .natural) {
        self.root = root
        self.accidental = accidental
    }
}

extension Key {
    
    public enum Root: Int, CaseIterable, CustomStringConvertible {
        case c = 0
        case d = 2
        case e = 4
        case f = 5
        case g = 7
        case a = 9
        case b = 11
        
        public var description: String {
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
