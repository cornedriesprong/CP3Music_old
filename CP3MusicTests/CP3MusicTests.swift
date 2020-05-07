//
//  CP3MusicTests.swift
//  CP3MusicTests
//
//  Created by Corné on 23/02/2020.
//  Copyright © 2020 cp3.io. All rights reserved.
//

import XCTest
@testable import CP3Music

class CP3MusicTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testScales() {
        
        // C major
        let cMajorScale = Scale(Key(.c), .major)
        let cMajorPitches: [Pitch.Class] = [.c, .d, .e, .f, .g, .a, .b]
        XCTAssertEqual(cMajorScale.pitches, cMajorPitches)
        
        // D♯ minor
        let dSharpMinorScale = Scale(Key(.d, .sharp), .minor)
        let dSharpMinorPitches: [Pitch.Class] = [.ds, .f, .fs, .gs, .as, .b, .cs]
        XCTAssertEqual(dSharpMinorScale.pitches, dSharpMinorPitches)
        
        // G♭ dorian
        let gFlatDorianScale = Scale(Key(.g, .flat), .dorian)
        let gFlatDorianPitches: [Pitch.Class] = [.fs, .gs, .a, .b, .cs, .ds, .e]
        XCTAssertEqual(gFlatDorianScale.pitches, gFlatDorianPitches)
        
        // E lydian
        let eLydianScale = Scale(Key(.e), .lydian)
        let eLydianPitches: [Pitch.Class] = [.e, .fs, .gs, .as, .b, .cs, .ds]
        XCTAssertEqual(eLydianScale.pitches, eLydianPitches)
        
        // A♯ locrian
        let eSharpLocrianScale = Scale(Key(.a, .sharp), .locrian)
        let eSharpLocrianPitches: [Pitch.Class] = [.as, .b, .cs, .ds, .e, .fs, .gs]
        XCTAssertEqual(eSharpLocrianScale.pitches, eSharpLocrianPitches)
        
        // A♯ locrian
        let aMixolydianScale = Scale(Key(.f), .mixolydian)
        let aMixolydianPitches: [Pitch.Class] = [.f, .g, .a, .as, .c, .d, .ds]
        XCTAssertEqual(aMixolydianScale.pitches, aMixolydianPitches)
    }
    
    func testPitchNumbers() {
        
        // A
        let lowA = Key(pitchNumber: 21)
        XCTAssertEqual(lowA.root, Key.Root.a)
        XCTAssertEqual(lowA.accidental, Accidental.natural)
        
        // C
        let c = Key(pitchNumber: 60)
        XCTAssertEqual(c.root, Key.Root.c)
        XCTAssertEqual(c.accidental, Accidental.natural)
        
        // C#
        let cSharp = Key(pitchNumber: 61)
        XCTAssertEqual(cSharp.root, Key.Root.c)
        XCTAssertEqual(cSharp.accidental, Accidental.sharp)
        
        // D
        let d = Key(pitchNumber: 62)
        XCTAssertEqual(d.root, Key.Root.d)
        XCTAssertEqual(d.accidental, Accidental.natural)
        
        // D#
        let dSharp = Key(pitchNumber: 63)
        XCTAssertEqual(dSharp.root, Key.Root.d)
        XCTAssertEqual(dSharp.accidental, Accidental.sharp)
        
        // A
        let a = Key(pitchNumber: 69)
        XCTAssertEqual(a.root, Key.Root.a)
        XCTAssertEqual(a.accidental, Accidental.natural)
        
        // A#
        let aSharp = Key(pitchNumber: 70)
        XCTAssertEqual(aSharp.root, Key.Root.a)
        XCTAssertEqual(aSharp.accidental, Accidental.sharp)
        
        // B
        let b = Key(pitchNumber: 71)
        XCTAssertEqual(b.root, Key.Root.b)
        XCTAssertEqual(b.accidental, Accidental.natural)
        
        // C
        let highC = Key(pitchNumber: 108)
        XCTAssertEqual(highC.root, Key.Root.c)
        XCTAssertEqual(highC.accidental, Accidental.natural)
    }
}
