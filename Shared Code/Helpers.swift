//
//  Helpers.swift
//  Sudoku Solver
//
//  Created by Alexandre Moreau-Lemay on 05/04/2022.
//

import Foundation

/// Checks if a number is in a row of a Sudoku grid.
///
/// - Parameters:
///  - grid: The Sudoku grid.
///  - number: The number to look for.
///  - row: The row to check in.
/// - Returns: `true` if the number is in the row, `false` otherwise.
func isInRow(check grid: SudokuGrid, for number: Int, at row: Int) -> Bool {
    for i in 0..<Constants.gridSize {
        if grid[row][i] == number {
            return true;
        }
    }
    
    return false;
}

func isInColumn(check grid: SudokuGrid, for number: Int, at column: Int) -> Bool {
    for i in 0..<Constants.gridSize {
        if grid[i][column] == number {
            return true;
        }
    }
    
    return false;
}

func isInBox(check grid: SudokuGrid, for number: Int, at coordinates: Coordinates) -> Bool {
    let localBoxRow = coordinates.row - coordinates.row % 3;
    let localBoxColumn = coordinates.column - coordinates.column % 3;
    
    for i in localBoxRow..<(localBoxRow + 3) {
        for j in localBoxColumn..<(localBoxColumn + 3) {
            if grid[i][j] == number {
                return true;
            }
        }
    }
    
    return false;
}

func isValidPlacement(for number: Int, in grid: SudokuGrid, at coordinates: Coordinates) -> Bool {
    return !isInRow(check: grid, for: number, at: coordinates.row)
        && !isInColumn(check: grid, for: number, at: coordinates.column)
        && !isInBox(check: grid, for: number, at: coordinates);
}

func printGrid(_ grid: SudokuGrid) {
    for row in 0..<Constants.gridSize {
        if row % 3 == 0 && row != 0 {
            print("===========\n");
        }
        
        for column in 0..<Constants.gridSize {
            if column % 3 == 0 && column != 0 {
                print("|", terminator: "");
            }
            
            print(grid[row][column], terminator: "");
        }
        
        print("\n");
    }
}
