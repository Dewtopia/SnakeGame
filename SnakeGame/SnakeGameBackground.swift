//
//  SnakeGameBackground.swift
//  SnakeGame
//
//  Created by JPL-ST-SPRING2021 on 12/15/21.
//  Copyright © 2021 csc. All rights reserved.
//

import Foundation

struct SnakeGameBackground: CustomStringConvertible {
    static let columns: Int = 9
    static let rows: Int = 7
    
    var snake: [SnakeCell] = []
    
    mutating func moveLeft() {
        snake = updateSnake(newHead: SnakeCell(column: snake[0].column - 1, row: snake[0].row))
    }
    mutating func moveRight() {
        snake = updateSnake(newHead: SnakeCell(column: snake[0].column + 1, row: snake[0].row))
    }
    mutating func moveUp() {
        snake = updateSnake(newHead: SnakeCell(column: snake[0].column, row: snake[0].row - 1))
    }
    mutating func moveDown() {
        snake = updateSnake(newHead: SnakeCell(column: snake[0].column, row: snake[0].row + 1))
    }
    
    func updateSnake(newHead: SnakeCell) -> [SnakeCell] {
        var newSnake: [SnakeCell] = []
        newSnake.append(newHead)
        
        for i in 0..<snake.count - 1 {
            newSnake.append(snake[i])
        }
        return newSnake
    }
    
    func isOnSnake(column: Int, row: Int) -> Bool {
        for cell in snake {
            if cell.column == column && cell.row == row {
                return true
            }
        }
        return false
    }
    
    var description: String {
        var desc = " "
  
        for i in 0..<SnakeGameBackground.columns {
            desc += " \(i)"
        }
        desc += "\n"
        
        for row in 0..<SnakeGameBackground.rows {
            desc += "\(row)"
            for column in 0..<SnakeGameBackground.columns {
                if isOnSnake(column: column, row: row) {
                    //let head = snake[0]
                    
                    if snake[0].column == column && snake[0].row == row {
                        desc += " x"
                    }
                    else {
                        desc += " o"
                    }
                }
                else {
                    desc += " ."
                }
            }
            desc += "\n"
        }
        return desc
    }
}
