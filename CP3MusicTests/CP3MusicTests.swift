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
        let lowA = Key(midiNoteNumber: 21)
        XCTAssertEqual(lowA.root, Key.Root.a)
        XCTAssertEqual(lowA.accidental, Accidental.natural)
        
        // C
        let c = Key(midiNoteNumber: 60)
        XCTAssertEqual(c.root, Key.Root.c)
        XCTAssertEqual(c.accidental, Accidental.natural)
        
        // C#
        let cSharp = Key(midiNoteNumber: 61)
        XCTAssertEqual(cSharp.root, Key.Root.c)
        XCTAssertEqual(cSharp.accidental, Accidental.sharp)
        
        // D
        let d = Key(midiNoteNumber: 62)
        XCTAssertEqual(d.root, Key.Root.d)
        XCTAssertEqual(d.accidental, Accidental.natural)
        
        // D#
        let dSharp = Key(midiNoteNumber: 63)
        XCTAssertEqual(dSharp.root, Key.Root.d)
        XCTAssertEqual(dSharp.accidental, Accidental.sharp)
        
        // A
        let a = Key(midiNoteNumber: 69)
        XCTAssertEqual(a.root, Key.Root.a)
        XCTAssertEqual(a.accidental, Accidental.natural)
        
        // A#
        let aSharp = Key(midiNoteNumber: 70)
        XCTAssertEqual(aSharp.root, Key.Root.a)
        XCTAssertEqual(aSharp.accidental, Accidental.sharp)
        
        // B
        let b = Key(midiNoteNumber: 71)
        XCTAssertEqual(b.root, Key.Root.b)
        XCTAssertEqual(b.accidental, Accidental.natural)
        
        // C
        let highC = Key(midiNoteNumber: 108)
        XCTAssertEqual(highC.root, Key.Root.c)
        XCTAssertEqual(highC.accidental, Accidental.natural)
    }
    
    func testScaleDegrees() {
        
        // I
        let cMajorTriad = Chord(pitches: [
            Pitch(.c, .natural, 3),
            Pitch(.e, .natural, 3),
            Pitch(.g, .natural, 3)
        ])!
        let cMajorScale = Scale(Key(.c), .major)
        XCTAssertEqual(Degree(chord: cMajorTriad, in: cMajorScale)?.description, "I")
        
        // v
        let gMinorTriad = Chord(pitches: [
            Pitch(.g, .natural, 3),
            Pitch(.a, .sharp, 3),
            Pitch(.d, .natural, 4)
        ])!
        XCTAssertEqual(Degree(chord: gMinorTriad, in: cMajorScale)?.description, "v")
    }
    
    func testInverseInterval() {
        
        XCTAssertEqual(Interval.p0.inverse(), .p8)
        XCTAssertEqual(Interval.p5.inverse(), .p4)
        XCTAssertEqual(Interval.p4.inverse(), .p5)
        XCTAssertEqual(Interval.m3.inverse(), .M6)
        XCTAssertEqual(Interval.M6.inverse(), .m3)
        XCTAssertEqual(Interval.M7.inverse(), .m2)
        XCTAssertEqual(Interval.p12.inverse(), .p5)
        XCTAssertEqual(Interval.a15.inverse(), .m9)
    }
    
    func testInterval() {
        
        // perfect 4th/perfect 5th
        let c = Pitch(.c, .natural, 3)
        let g = Pitch(.g, .natural, 3)
        XCTAssertEqual(g.interval(to: c), .p4)
        XCTAssertEqual(c.interval(to: g), .p5)
        
        // major 3rd/minor 6th
        let f = Pitch(.f, .natural, 3)
        let a = Pitch(.a, .natural, 3)
        XCTAssertEqual(f.interval(to: a), .M3)
        XCTAssertEqual(a.interval(to: f), .m6)
        
        // minor 10th/major 6th
        let gSharp = Pitch(.g, .sharp, 4)
        let b = Pitch(.b, .natural, 5)
        XCTAssertEqual(gSharp.interval(to: b), .m10)
        XCTAssertEqual(b.interval(to: gSharp), .M6)
    }
    
    func testChord() {
        
        // C major
        let cMajor = Chord(pitches: [
            Pitch(.c, .natural, 3),
            Pitch(.e, .natural, 3),
            Pitch(.g, .natural, 3)
        ])!
        XCTAssertEqual(cMajor.description, "CM")
        
        // D# minor
        let dSharpMinor = Chord(pitches: [
            Pitch(.d, .sharp, 3),
            Pitch(.f, .sharp, 3),
            Pitch(.a, .sharp, 4)
        ])!
        XCTAssertEqual(dSharpMinor.description, "D#m")
        
        let fFlat = Pitch(.f, .flat, 3)
        let fFlatMinor = Chord(root: fFlat, quality: .minor)!
        XCTAssertEqual(fFlatMinor.description, "Em")
    }
}
