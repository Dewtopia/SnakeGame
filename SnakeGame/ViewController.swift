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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        background.snake.append(SnakeCell(column: 2, row: 1))
        background.snake.append(SnakeCell(column: 3, row: 1))
        background.snake.append(SnakeCell(column: 3, row: 2))
        background.snake.append(SnakeCell(column: 3, row: 3))
        
        updateGameBoard()
    }
    
    private func updateGameBoard(){
        backgroundView.shadowSnake = background.snake
        backgroundView.shadowFoodColumns = background.foodColumns
        backgroundView.shadowFoodRows = background.foodRows
        backgroundView.setNeedsDisplay()
    }
    
    @IBAction func leftButton(_ sender: Any) {
        background.moveLeft()
        updateGameBoard()
    }
    @IBAction func rightButton(_ sender: Any) {
        background.moveRight()
        updateGameBoard()
    }
    @IBAction func upButton(_ sender: Any) {
        background.moveUp()
        updateGameBoard()
    }
    @IBAction func downButton(_ sender: Any) {
        background.moveDown()
        updateGameBoard()
    }
}

