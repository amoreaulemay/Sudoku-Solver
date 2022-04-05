//
//  GridGenerator.swift
//  Sudoku Generator
//
//  Created by Alexandre Moreau-Lemay on 05/04/2022.
//

import Foundation

fileprivate enum Difficulty {
    case easy, medium, difficult;
}

fileprivate extension Level {
    static let easy = 72;
    static let medium = 48;
    static let difficult = 24;
    
    static func getLevel(with difficulty: Difficulty) -> Int {
        switch (difficulty) {
        case .easy:
            return ((Level.medium + 1)...Level.easy).randomElement()!;
        case .medium:
            return ((Level.difficult + 1)...Level.medium).randomElement()!;
        case .difficult:
            return (Level.difficult...(Level.medium - 1)).randomElement()!;
        }
    }
}

func generateGrid() -> Level {
    var grid: SudokuGrid = [];
    grid.clear();
    
    rotatingGenerator(for: &grid);
    
    let solution = makeLevel(for: &grid);

    return Level(grid: grid, solution: solution);
}

fileprivate func rotatingGenerator(for grid: inout SudokuGrid, rotations: Int = 3) {
    grid[0] = Array(1...9).shuffled();
    
    for n in 1..<Constants.gridSize {
        var shiftDistance = 3;
        
        if n == 3 || n == 6 {
            shiftDistance = 1;
        }
        
        grid[n] = grid[n - 1].shift(withDistance: shiftDistance);
    }
    
    for _ in 0..<rotations {
        shuffle(for: &grid);
    }
}

fileprivate func shuffle(for grid: inout SudokuGrid) {
    shuffleColumns(for: &grid);
    shuffleRows(for: &grid);
}

fileprivate func shuffleColumns(for grid: inout SudokuGrid) {
    grid = grid.rotate();
    
    shuffleRows(for: &grid);
    
    grid = grid.rotate();
}

fileprivate func shuffleRows(for grid: inout SudokuGrid) {
    for n in 0..<3 {
        let index = n * 3;
        
        var subGroup: [[Int]] = [];
        
        for i in 0..<3 {
            subGroup.append(grid[index + i]);
        }
        
        subGroup = subGroup.shuffled();
        
        for i in 0..<3 {
            grid[index + i] = subGroup[i];
        }
        
        subGroup.removeAll();
    }
}

@discardableResult
fileprivate func makeLevel(for grid: inout SudokuGrid, difficulty: Difficulty = .medium) -> SudokuGrid {
    let solution = grid;
    let iter = 81 - Level.getLevel(with: difficulty);
    
    var chosenCoord: [Coordinates] = [];
    
    for _ in 0..<iter {
        var tempCoord = Coordinates.random();
        while chosenCoord.contains(tempCoord) {
            tempCoord = Coordinates.random();
        }
        
        chosenCoord.append(tempCoord);
        
        grid.insert(0, at: tempCoord);
    }
    
    return solution;
}

extension Array {
    func shift(withDistance distance: Int = 1) -> Array<Element> {
        let offsetIndex = distance >= 0 ?
        self.index(startIndex, offsetBy: distance, limitedBy: endIndex) :
        self.index(endIndex, offsetBy: distance, limitedBy: startIndex)
        
        guard let index = offsetIndex else { return self }
        return Array(self[index ..< endIndex] + self[startIndex ..< index])
    }
}
