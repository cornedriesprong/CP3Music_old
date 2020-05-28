//
//  Key.swift
//  CP3Music
//
//  Created by Corné on 23/02/2020.
//  Copyright © 2020 cp3.io. All rights reserved.
//

import Foundation

public struct Key: Codable {
    
    var root: Root
    var accidental: Accidental
    
    public var rootValue: Int {
        return root.rawValue + accidental.rawValue
    }
    
    public static var allKeys: [Key] {
        return [
            Key(.c),
            Key(.c, .sharp),
            Key(.d),
            Key(.d, .sharp),
            Key(.e),
            Key(.f),
            Key(.f, .sharp),
            Key(.g),
            Key(.g, .sharp),
            Key(.a),
            Key(.a, .sharp),
            Key(.b)
        ]
    }
    
    public init(midiNoteNumber: Int) {
        let modMidiNoteNumber = midiNoteNumber % 12
        let root = Root.allCases
            .sorted(by: { $0.rawValue > $1.rawValue })
            .first(where: { $0.rawValue <= modMidiNoteNumber })!
        let accidental: Accidental = modMidiNoteNumber > root.rawValue ? .sharp : .natural
        self.init(root, accidental)
    }
    
    public init(pitch: Pitch) {
        self.init(midiNoteNumber: pitch.midiNoteNumber)
    }
    
    public init(_ root: Root, _ accidental: Accidental = .natural) {
        self.root = root
        self.accidental = accidental
    }
}

extension Key {
    
    public enum Root: Int, Codable, CaseIterable, CustomStringConvertible {
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

extension Key: CustomStringConvertible {

    public var description: String {
        
        let accidentalString = accidental != .natural ? accidental.description : ""
        return "\(root.description)\(accidentalString)"
    }
}
