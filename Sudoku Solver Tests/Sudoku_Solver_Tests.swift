//
//  Sudoku_Solver_Tests.swift
//  Sudoku Solver Tests
//
//  Created by Alexandre Moreau-Lemay on 05/04/2022.
//

import XCTest

func ==<E: Equatable>(lhs: [[E]], rhs: [[E]]) -> Bool {
    guard lhs.count == rhs.count else { return false; }
    
    for i in 0..<lhs.count {
        guard lhs[i] == rhs[i] else { return false; }
    }
    
    return true;
}

class Sudoku_Solver_Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGridOne() throws {
        var grid1: SudokuGrid = [
            [0, 8, 0, 7, 0, 1, 0, 3, 0],
            [4, 0, 9, 0, 0, 0, 0, 0, 0],
            [0, 5, 0, 0, 6, 0, 4, 1, 8],
            [7, 0, 0, 0, 0, 9, 0, 0, 0],
            [8, 0, 0, 6, 1, 0, 5, 0, 0],
            [0, 3, 5, 0, 0, 0, 0, 2, 9],
            [0, 6, 0, 4, 0, 7, 0, 9, 0],
            [1, 0, 0, 0, 0, 8, 0, 0, 4],
            [0, 2, 0, 0, 5, 0, 0, 7, 0],
        ];
        
        let expectedSolution: SudokuGrid = [
            [2, 8, 6, 7, 4, 1, 9, 3, 5],
            [4, 1, 9, 3, 8, 5, 7, 6, 2],
            [3, 5, 7, 9, 6, 2, 4, 1, 8],
            [7, 4, 1, 5, 2, 9, 3, 8, 6],
            [8, 9, 2, 6, 1, 3, 5, 4, 7],
            [6, 3, 5, 8, 7, 4, 1, 2, 9],
            [5, 6, 8, 4, 3, 7, 2, 9, 1],
            [1, 7, 3, 2, 9, 8, 6, 5, 4],
            [9, 2, 4, 1, 5, 6, 8, 7, 3],
        ];
        
        sudokuSolver(for: &grid1);
        
        XCTAssertTrue(grid1 == expectedSolution, "Grid 1 should match solution.");
    }

}
