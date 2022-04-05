//
//  main.swift
//  Sudoku Solver
//
//  Created by Alexandre Moreau-Lemay on 05/04/2022.
//

import Foundation

var sudokuGrid: SudokuGrid = [
    [7, 0, 2, 0, 5, 0, 6, 0, 0],
    [0, 0, 0, 0, 0, 3, 0, 0, 0],
    [1, 0, 0, 0, 0, 9, 5, 0, 0],
    [8, 0, 0, 0, 0, 0, 0, 9, 0],
    [0, 4, 3, 0, 0, 0, 7, 5, 0],
    [0, 9, 0, 0, 0, 0, 0, 0, 8],
    [0, 0, 9, 7, 0, 0, 0, 0, 5],
    [0, 0, 0, 2, 0, 0, 0, 0, 0],
    [0, 0, 7, 0, 4, 0, 2, 0, 3],
];


print("Before solving: \n\n");

printGrid(sudokuGrid);

if sudokuSolver(for: &sudokuGrid) {
    print("\nGrid was successfully solved! Here's the result: \n\n");
    printGrid(sudokuGrid);
} else {
    print("\nGrid could not be solved.\n");
}
