//
//  Solver.swift
//  Sudoku Solver
//
//  Created by Alexandre Moreau-Lemay on 05/04/2022.
//

import Foundation

@discardableResult
func sudokuSolver(for grid: inout SudokuGrid) -> Bool {
    for row in 0..<Constants.gridSize {
        for column in 0..<Constants.gridSize {
            if grid[row][column] == 0 {
                for i in 1...Constants.gridSize {
                    if isValidPlacement(for: i, in: grid, at: Coordinates(row: row, column: column)) {
                        grid[row][column] = i;
                        
                        if sudokuSolver(for: &grid) {
                            return true;
                        } else {
                            grid[row][column] = 0;
                        }
                    }
                }
                
                return false;
            }
        }
    }
    
    return true;
}
