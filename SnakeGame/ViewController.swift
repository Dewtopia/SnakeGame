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
        backgroundView.shadowSnake = background.snake
    }

    @IBAction func leftButton(_ sender: Any) {
        background.moveLeft()
        backgroundView.shadowSnake = background.snake
        backgroundView.setNeedsDisplay()
    }
    @IBAction func rightButton(_ sender: Any) {
        background.moveRight()
        backgroundView.shadowSnake = background.snake
        backgroundView.setNeedsDisplay()
    }
    @IBAction func upButton(_ sender: Any) {
        background.moveUp()
        backgroundView.shadowSnake = background.snake
        backgroundView.setNeedsDisplay()
    }
    @IBAction func downButton(_ sender: Any) {
        background.moveDown()
        backgroundView.shadowSnake = background.snake
        backgroundView.setNeedsDisplay()
    }
}

