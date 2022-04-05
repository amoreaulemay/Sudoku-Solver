//
//  CustomTypes.swift
//  Sudoku Solver
//
//  Created by Alexandre Moreau-Lemay on 05/04/2022.
//

import Foundation

typealias SudokuGrid = [[Int]];

extension SudokuGrid {
    mutating func clear() {
        self.removeAll()
        for _ in 0..<Constants.gridSize {
            self.append(Array<Int>(repeating: 0, count: 9));
        }
    }
    
    mutating func insert(_ num: Int, at index: Coordinates) {
        self[index.row][index.column] = num;
    }
    
    func rotate() -> SudokuGrid {
        var newArray: SudokuGrid = [];
        newArray.clear();
        
        for oldRow in 0..<self.count {
            for oldColumn in 0..<self.count {
                newArray[oldColumn][oldRow] = self[oldRow][oldColumn];
            }
        }
        
        return newArray;
    }
}

struct Coordinates {
    let row: Int;
    let column: Int;
    
    public static func random() -> Coordinates {
        return Coordinates(row: (0...8).randomElement()!, column: (0...8).randomElement()!);
    }
}

extension Array where Element == Coordinates {
    func contains(_ el: Coordinates) -> Bool {
        for coord in self {
            if coord.row == el.row && coord.column == el.column {
                return true;
            }
        }
        
        return false;
    }
}

struct Level {
    let grid: SudokuGrid;
    let solution: SudokuGrid;
}
