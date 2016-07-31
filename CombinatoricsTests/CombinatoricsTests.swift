//
//  CombinatoricsTests.swift
//  CombinatoricsTests
//
//  Created by Albert Mata Guerra on 29/07/16.
//  Copyright © 2016 Albert Mata Guerra. All rights reserved.
//

import XCTest
@testable import Combinatorics

class CombinatoricsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testNumberOfPermutationsWithoutRepetitionFrom() {
        // n = elements
        // t = taking
        // Expected result = n! / (n-r)!
        XCTAssertEqual(Combinatorics.permutationsWithoutRepetitionFrom([1], taking: 1).count, 1)
        XCTAssertEqual(Combinatorics.permutationsWithoutRepetitionFrom([1, 2], taking: 2).count, 2)
        XCTAssertEqual(Combinatorics.permutationsWithoutRepetitionFrom([1, 2, 3], taking: 3).count, 6)
        XCTAssertEqual(Combinatorics.permutationsWithoutRepetitionFrom([1, 2, 3, 4], taking: 4).count, 24)
        XCTAssertEqual(Combinatorics.permutationsWithoutRepetitionFrom([1, 2, 3, 4, 5], taking: 5).count, 120)
        XCTAssertEqual(Combinatorics.permutationsWithoutRepetitionFrom([1, 2, 3, 4, 5], taking: 4).count, 120)
        XCTAssertEqual(Combinatorics.permutationsWithoutRepetitionFrom([1, 2, 3, 4, 5], taking: 3).count, 60)
        XCTAssertEqual(Combinatorics.permutationsWithoutRepetitionFrom([1, 2, 3, 4, 5], taking: 2).count, 20)
        XCTAssertEqual(Combinatorics.permutationsWithoutRepetitionFrom([1, 2, 3, 4, 5], taking: 1).count, 5)
    }
    
    func testNumberOfPermutationsWithoutRepetitionFromEdgeCases() {
        XCTAssertEqual(Combinatorics.permutationsWithoutRepetitionFrom([Int](), taking: 0).count, 1)
        XCTAssertEqual(Combinatorics.permutationsWithoutRepetitionFrom([Int](), taking: 1).count, 0)
        XCTAssertEqual(Combinatorics.permutationsWithoutRepetitionFrom([1, 2], taking: 3).count, 0)
        XCTAssertEqual(Combinatorics.permutationsWithoutRepetitionFrom([1, 2, 3, 4, 5], taking: 0).count, 1)
    }
    
    func testElementsOfPermutationsWithoutRepetitionFrom() {
        let permutations = Combinatorics.permutationsWithoutRepetitionFrom([1, 2, 3], taking: 3)
        XCTAssert(permutations.contains({$0 == [1, 2, 3]}))
        XCTAssert(permutations.contains({$0 == [1, 3, 2]}))
        XCTAssert(permutations.contains({$0 == [2, 1, 3]}))
        XCTAssert(permutations.contains({$0 == [2, 3, 1]}))
        XCTAssert(permutations.contains({$0 == [3, 1, 2]}))
        XCTAssert(permutations.contains({$0 == [3, 2, 1]}))
    }
    
    func testElementsOfPermutationsWithoutRepetitionFromEdgeCases() {
        XCTAssertEqual(Combinatorics.permutationsWithoutRepetitionFrom([Int](), taking: 0)[0], [])
        XCTAssertEqual(Combinatorics.permutationsWithoutRepetitionFrom([1, 2, 3, 4, 5], taking: 0)[0], [])
    }
    
    func testNumberOfPermutationsWithRepetitionFrom() {
        // n = elements
        // t = taking
        // Expected result = n^r
        XCTAssertEqual(Combinatorics.permutationsWithRepetitionFrom([1], taking: 1).count, 1)
        XCTAssertEqual(Combinatorics.permutationsWithRepetitionFrom([1, 2], taking: 2).count, 4)
        XCTAssertEqual(Combinatorics.permutationsWithRepetitionFrom([1, 2], taking: 3).count, 8)
        XCTAssertEqual(Combinatorics.permutationsWithRepetitionFrom([1, 2, 3], taking: 3).count, 27)
        XCTAssertEqual(Combinatorics.permutationsWithRepetitionFrom([1, 2, 3, 4], taking: 4).count, 256)
        XCTAssertEqual(Combinatorics.permutationsWithRepetitionFrom([1, 2, 3, 4, 5], taking: 5).count, 3125)
        XCTAssertEqual(Combinatorics.permutationsWithRepetitionFrom([1, 2, 3, 4, 5], taking: 4).count, 625)
        XCTAssertEqual(Combinatorics.permutationsWithRepetitionFrom([1, 2, 3, 4, 5], taking: 3).count, 125)
        XCTAssertEqual(Combinatorics.permutationsWithRepetitionFrom([1, 2, 3, 4, 5], taking: 2).count, 25)
        XCTAssertEqual(Combinatorics.permutationsWithRepetitionFrom([1, 2, 3, 4, 5], taking: 1).count, 5)
    }
    
    func testNumberOfPermutationsWithRepetitionFromEdgeCases() {
        XCTAssertEqual(Combinatorics.permutationsWithRepetitionFrom([Int](), taking: 0).count, 1)
        XCTAssertEqual(Combinatorics.permutationsWithRepetitionFrom([Int](), taking: 1).count, 0)
        XCTAssertEqual(Combinatorics.permutationsWithRepetitionFrom([1, 2, 3, 4, 5], taking: 0).count, 1)
    }
    
    func testElementsOfPermutationsWithRepetitionFrom() {
        let permutations = Combinatorics.permutationsWithRepetitionFrom([1, 2, 3], taking: 3)
        XCTAssert(permutations.contains({$0 == [1, 1, 1]}))
        XCTAssert(permutations.contains({$0 == [1, 1, 2]}))
        XCTAssert(permutations.contains({$0 == [1, 1, 3]}))
        XCTAssert(permutations.contains({$0 == [1, 2, 1]}))
        XCTAssert(permutations.contains({$0 == [1, 2, 2]}))
        XCTAssert(permutations.contains({$0 == [1, 2, 3]}))
        XCTAssert(permutations.contains({$0 == [1, 3, 1]}))
        XCTAssert(permutations.contains({$0 == [1, 3, 2]}))
        XCTAssert(permutations.contains({$0 == [1, 3, 3]}))
        
        XCTAssert(permutations.contains({$0 == [2, 1, 1]}))
        XCTAssert(permutations.contains({$0 == [2, 1, 2]}))
        XCTAssert(permutations.contains({$0 == [2, 1, 3]}))
        XCTAssert(permutations.contains({$0 == [2, 2, 1]}))
        XCTAssert(permutations.contains({$0 == [2, 2, 2]}))
        XCTAssert(permutations.contains({$0 == [2, 2, 3]}))
        XCTAssert(permutations.contains({$0 == [2, 3, 1]}))
        XCTAssert(permutations.contains({$0 == [2, 3, 2]}))
        XCTAssert(permutations.contains({$0 == [2, 3, 3]}))
        
        XCTAssert(permutations.contains({$0 == [3, 1, 1]}))
        XCTAssert(permutations.contains({$0 == [3, 1, 2]}))
        XCTAssert(permutations.contains({$0 == [3, 1, 3]}))
        XCTAssert(permutations.contains({$0 == [3, 2, 1]}))
        XCTAssert(permutations.contains({$0 == [3, 2, 2]}))
        XCTAssert(permutations.contains({$0 == [3, 2, 3]}))
        XCTAssert(permutations.contains({$0 == [3, 3, 1]}))
        XCTAssert(permutations.contains({$0 == [3, 3, 2]}))
        XCTAssert(permutations.contains({$0 == [3, 3, 3]}))
    }
    
    func testElementsOfPermutationsWithRepetitionFromEdgeCases() {
        XCTAssertEqual(Combinatorics.permutationsWithRepetitionFrom([Int](), taking: 0)[0], [])
        XCTAssertEqual(Combinatorics.permutationsWithRepetitionFrom([1, 2, 3, 4, 5], taking: 0)[0], [])
    }
    
    func testNumberOfCombinationsWithoutRepetitionFrom() {
        // n = elements
        // t = taking
        // Expected result = n! / (r! × (n-r)!)
        XCTAssertEqual(Combinatorics.combinationsWithoutRepetitionFrom([1], taking: 1).count, 1)
        XCTAssertEqual(Combinatorics.combinationsWithoutRepetitionFrom([1, 2], taking: 2).count, 1)
        XCTAssertEqual(Combinatorics.combinationsWithoutRepetitionFrom([1, 2, 3], taking: 3).count, 1)
        XCTAssertEqual(Combinatorics.combinationsWithoutRepetitionFrom([1, 2, 3, 4], taking: 4).count, 1)
        XCTAssertEqual(Combinatorics.combinationsWithoutRepetitionFrom([1, 2, 3, 4, 5], taking: 5).count, 1)
        XCTAssertEqual(Combinatorics.combinationsWithoutRepetitionFrom([1, 2, 3, 4, 5], taking: 4).count, 5)
        XCTAssertEqual(Combinatorics.combinationsWithoutRepetitionFrom([1, 2, 3, 4, 5], taking: 3).count, 10)
        XCTAssertEqual(Combinatorics.combinationsWithoutRepetitionFrom([1, 2, 3, 4, 5], taking: 2).count, 10)
        XCTAssertEqual(Combinatorics.combinationsWithoutRepetitionFrom([1, 2, 3, 4, 5], taking: 1).count, 5)
    }
    
    func testNumberOfCombinationsWithoutRepetitionFromEdgeCases() {
        XCTAssertEqual(Combinatorics.combinationsWithoutRepetitionFrom([Int](), taking: 0).count, 1)
        XCTAssertEqual(Combinatorics.combinationsWithoutRepetitionFrom([Int](), taking: 1).count, 0)
        XCTAssertEqual(Combinatorics.combinationsWithoutRepetitionFrom([1, 2], taking: 3).count, 0)
        XCTAssertEqual(Combinatorics.combinationsWithoutRepetitionFrom([1, 2, 3, 4, 5], taking: 0).count, 1)
    }
    
    func testElementsOfCombinationsWithoutRepetitionFrom() {
        let combinations1 = Combinatorics.combinationsWithoutRepetitionFrom([1, 2, 3], taking: 3)
        XCTAssert(combinations1.contains({Set($0) == Set([1, 2, 3])}))
        let combinations2 = Combinatorics.combinationsWithoutRepetitionFrom([1, 2, 3], taking: 2)
        XCTAssert(combinations2.contains({Set($0) == Set([1, 2])}))
        XCTAssert(combinations2.contains({Set($0) == Set([1, 3])}))
        XCTAssert(combinations2.contains({Set($0) == Set([2, 3])}))
        let combinations3 = Combinatorics.combinationsWithoutRepetitionFrom([1, 2, 3], taking: 1)
        XCTAssert(combinations3.contains({Set($0) == Set([1])}))
        XCTAssert(combinations3.contains({Set($0) == Set([2])}))
        XCTAssert(combinations3.contains({Set($0) == Set([3])}))
    }
    
    func testElementsOfCombinationsWithoutRepetitionFromEdgeCases() {
        XCTAssertEqual(Combinatorics.combinationsWithoutRepetitionFrom([Int](), taking: 0)[0], [])
        XCTAssertEqual(Combinatorics.combinationsWithoutRepetitionFrom([1, 2, 3, 4, 5], taking: 0)[0], [])
    }

    func testNumberOfCombinationsWithRepetitionFrom() {
        // n = elements
        // t = taking
        // Expected result = (n+r-1)! / (r! × (n-1)!)
        XCTAssertEqual(Combinatorics.combinationsWithRepetitionFrom([1], taking: 1).count, 1)
        XCTAssertEqual(Combinatorics.combinationsWithRepetitionFrom([1, 2], taking: 2).count, 3)
        XCTAssertEqual(Combinatorics.combinationsWithRepetitionFrom([1, 2], taking: 3).count, 4)
        XCTAssertEqual(Combinatorics.combinationsWithRepetitionFrom([1, 2, 3], taking: 3).count, 10)
        XCTAssertEqual(Combinatorics.combinationsWithRepetitionFrom([1, 2, 3, 4], taking: 4).count, 35)
        XCTAssertEqual(Combinatorics.combinationsWithRepetitionFrom([1, 2, 3, 4, 5], taking: 5).count, 126)
        XCTAssertEqual(Combinatorics.combinationsWithRepetitionFrom([1, 2, 3, 4, 5], taking: 4).count, 70)
        XCTAssertEqual(Combinatorics.combinationsWithRepetitionFrom([1, 2, 3, 4, 5], taking: 3).count, 35)
        XCTAssertEqual(Combinatorics.combinationsWithRepetitionFrom([1, 2, 3, 4, 5], taking: 2).count, 15)
        XCTAssertEqual(Combinatorics.combinationsWithRepetitionFrom([1, 2, 3, 4, 5], taking: 1).count, 5)
    }
    
    func testNumberOfCombinationsWithRepetitionFromEdgeCases() {
        XCTAssertEqual(Combinatorics.combinationsWithRepetitionFrom([Int](), taking: 0).count, 1)
        XCTAssertEqual(Combinatorics.combinationsWithRepetitionFrom([Int](), taking: 1).count, 0)
        XCTAssertEqual(Combinatorics.combinationsWithRepetitionFrom([1, 2, 3, 4, 5], taking: 0).count, 1)
    }
    
    func testElementsOfCombinationsWithRepetitionFrom() {
        let combinations1 = Combinatorics.combinationsWithRepetitionFrom([1, 2, 3], taking: 3)
        XCTAssert(combinations1.contains({Set($0) == Set([1, 1, 1])}))
        XCTAssert(combinations1.contains({Set($0) == Set([1, 1, 2])}))
        XCTAssert(combinations1.contains({Set($0) == Set([1, 1, 3])}))
        XCTAssert(combinations1.contains({Set($0) == Set([1, 2, 2])}))
        XCTAssert(combinations1.contains({Set($0) == Set([1, 2, 3])}))
        XCTAssert(combinations1.contains({Set($0) == Set([1, 3, 3])}))
        XCTAssert(combinations1.contains({Set($0) == Set([2, 2, 2])}))
        XCTAssert(combinations1.contains({Set($0) == Set([2, 2, 3])}))
        XCTAssert(combinations1.contains({Set($0) == Set([3, 3, 3])}))
        XCTAssert(combinations1.contains({Set($0) == Set([3, 3, 2])}))
        let combinations2 = Combinatorics.combinationsWithRepetitionFrom([1, 2, 3], taking: 2)
        XCTAssert(combinations2.contains({Set($0) == Set([1, 1])}))
        XCTAssert(combinations2.contains({Set($0) == Set([1, 2])}))
        XCTAssert(combinations2.contains({Set($0) == Set([1, 3])}))
        XCTAssert(combinations2.contains({Set($0) == Set([2, 2])}))
        XCTAssert(combinations2.contains({Set($0) == Set([2, 3])}))
        XCTAssert(combinations2.contains({Set($0) == Set([3, 3])}))
        let combinations3 = Combinatorics.combinationsWithRepetitionFrom([1, 2, 3], taking: 1)
        XCTAssert(combinations3.contains({Set($0) == Set([1])}))
        XCTAssert(combinations3.contains({Set($0) == Set([2])}))
        XCTAssert(combinations3.contains({Set($0) == Set([3])}))
    }
    
    func testElementsOfCombinationsWithRepetitionFromEdgeCases() {
        XCTAssertEqual(Combinatorics.combinationsWithRepetitionFrom([Int](), taking: 0)[0], [])
        XCTAssertEqual(Combinatorics.combinationsWithRepetitionFrom([1, 2, 3, 4, 5], taking: 0)[0], [])
    }
    
}
