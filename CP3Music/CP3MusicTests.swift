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
}
