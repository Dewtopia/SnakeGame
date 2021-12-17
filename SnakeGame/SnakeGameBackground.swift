//
//  SnakeGameBackground.swift
//  SnakeGame
//
//  Created by JPL-ST-SPRING2021 on 12/15/21.
//  Copyright © 2021 csc. All rights reserved.
//

import Foundation
//import UIKit

struct SnakeGameBackground: CustomStringConvertible {
    //How to make columns and rows based on screen size?
    //let screenSize: CGRect = UIScreen.main.bounds
    //let columns = Int(UIScreen.main.bounds.width) / 10
    
    static let columns: Int = 10
    static let rows: Int = 10
    var dead: Bool = false
    
    var foodColumns: Int = Int(arc4random()) % SnakeGameBackground.columns
    //var foodColumns: Int = Int(arc4random()) % SnakeGameBackground.columns
    var foodRows: Int = Int(arc4random()) % SnakeGameBackground.rows
    var score: Int = 0
    
    var snake: [SnakeCell] = []
    
    mutating func renderNextFood() {
        foodColumns = Int(arc4random()) % SnakeGameBackground.columns
        foodRows = Int(arc4random()) % SnakeGameBackground.rows
    }
    
    mutating func moveLeft() {
        updateGameBoard(newHead: SnakeCell(column: snake[0].column - 1, row: snake[0].row))
    }
    mutating func moveRight() {
        updateGameBoard(newHead: SnakeCell(column: snake[0].column + 1, row: snake[0].row))
    }
    mutating func moveUp() {
        updateGameBoard(newHead: SnakeCell(column: snake[0].column, row: snake[0].row - 1))
    }
    mutating func moveDown() {
        updateGameBoard(newHead: SnakeCell(column: snake[0].column, row: snake[0].row + 1))
    }
    
    mutating func updateGameBoard(newHead: SnakeCell) {
        if !dead {
            deathCheck()
            var newSnake: [SnakeCell] = []
            newSnake.append(newHead)
            
            for i in 0..<snake.count - 1 {
                newSnake.append(snake[i])
            }
            let currentTail = snake[snake.count - 1]
            if snake[0].column == foodColumns && snake[0].row == foodRows{
                newSnake.append(currentTail)
                renderNextFood()
                score += 1
            }
            if deathCheck() {
                newSnake.removeAll()
            }
            snake = newSnake
        }
    }
    
    mutating func deathCheck() -> Bool {
        for i in 1..<snake.count {
            if snake[0].column == snake[i].column && snake[0].row == snake[i].row {
                dead = true
                return true
            }
            else if snake[0].column < 0 || snake[0].column > SnakeGameBackground.columns || snake[0].row < 0 || snake[0].row > SnakeGameBackground.rows {
                dead = true
                return true
            }
        }
        return false
    }
    
    /*mutating func die() {
        snake.removeAll()
        return true
        //var newSnake: [SnakeCell] = []
        //newSnake.removeAll()
        //snake = newSnake
        //call game over screen
    }*/
    
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
