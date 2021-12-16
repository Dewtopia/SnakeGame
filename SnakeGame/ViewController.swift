//
//  ViewController.swift
//  SnakeGame
//
//  Created by JPL-ST-SPRING2021 on 12/14/21.
//  Copyright © 2021 csc. All rights reserved.
//

import UIKit

//MVC design pattern
class ViewController: UIViewController {

    var background: SnakeGameBackground = SnakeGameBackground()
    @IBOutlet weak var backgroundView: GameBackgroundView!
    var snakeDirection: snakeMovement = .down
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        background.snake.append(SnakeCell(column: 2, row: 1))
        background.snake.append(SnakeCell(column: 3, row: 1))
        background.snake.append(SnakeCell(column: 3, row: 2))
        background.snake.append(SnakeCell(column: 3, row: 3))
        
        updateGameBoard()
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] (Timer) in
            switch self.snakeDirection {
            case .up:
                self.background.moveUp()
            case .down:
                self.background.moveDown()
            case .left:
                self.background.moveLeft()
            case .right:
                self.background.moveRight()
            }
            self.updateGameBoard()
        }
    }
    
    private func updateGameBoard(){
        backgroundView.shadowSnake = background.snake
        backgroundView.shadowFoodColumns = background.foodColumns
        backgroundView.shadowFoodRows = background.foodRows
        backgroundView.setNeedsDisplay()
    }
    
    @IBAction func leftButton(_ sender: Any) {
        snakeDirection = .left
    }
    @IBAction func rightButton(_ sender: Any) {
        snakeDirection = .right
    }
    @IBAction func upButton(_ sender: Any) {
        snakeDirection = .up
    }
    @IBAction func downButton(_ sender: Any) {
        snakeDirection = .down
    }
    
}

