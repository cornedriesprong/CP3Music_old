//
//  Note.swift
//  CP3Music
//
//  Created by Corné on 22/05/2020.
//  Copyright © 2020 cp3.io. All rights reserved.
//

import Foundation

public class Note {
    
    public var pitch: Pitch
    public var velocity: Int8
    public var startTime: UInt64
    public var endTime: UInt64?
    
    public var duration: TimeInterval? {
        guard let endTime = endTime else { return nil }
        let hostTicks = endTime - startTime
        return Double(hostTicks) * ticksToSeconds
    }
    
    public init(pitch: Pitch, velocity: Int8) {
        self.pitch = pitch
        self.velocity = velocity
        self.startTime = mach_absolute_time()
    }
    
    public func stop() {
        self.endTime = mach_absolute_time()
    }
}

extension Note: Hashable {
    
    
    
    public var hashValue: Int {
        return ObjectIdentifier(self).hashValue
    }
}

extension Note: Equatable {
    
    public static func == (lhs: Note, rhs: Note) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}
