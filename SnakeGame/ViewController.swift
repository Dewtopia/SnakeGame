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


    //@IBOutlet var scoreLabel: UITextField!
    
    var snakeDirection: snakeMovement = .down
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        background.snake.append(SnakeCell(column: 2, row: 4))
        background.snake.append(SnakeCell(column: 2, row: 3))
        background.snake.append(SnakeCell(column: 2, row: 2))
        background.snake.append(SnakeCell(column: 2, row: 1))
        
        updateGameBoard()
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] (Timer) in
            switch self.snakeDirection {
            case .up:
                if !self.background.dead {
                    self.background.moveUp()
                }
            case .down:
                if !self.background.dead {
                    self.background.moveDown()
                }
            case .left:
                if !self.background.dead {
                    self.background.moveLeft()
                }
            case .right:
                if !self.background.dead {
                    self.background.moveRight()
                }
            }
            
            if self.background.dead {
                self.gameOver()
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
    
    @IBAction func gameOver(){
        guard let endGameScreen = (storyboard?.instantiateViewController(withIdentifier: "gameEndVC") as? GameEndViewController) else{
            return
        }
            present(endGameScreen, animated: true)
    }
    
    @IBAction func resetGameState(_ sender: Any) {
        
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
    
    @IBAction func tapMovement(_ sender: UITapGestureRecognizer) {
        let snakeMovement = sender.location(in: backgroundView)
        let snakeHead = background.snake[0]
        let snakeHeadX: CGFloat = backgroundView.startX + (CGFloat(snakeHead.column) + 0.5) * backgroundView.cellSize
        let snakeHeadY: CGFloat = backgroundView.startY + (CGFloat(snakeHead.row) + 0.5) * backgroundView.cellSize
        
        switch snakeDirection {
        case .up, .down:
            if snakeMovement.x > snakeHeadX {
                snakeDirection = .right
            }else{
                snakeDirection = .left
            }
        case .left, .right:
            if snakeMovement.y > snakeHeadY {
                snakeDirection = .down
            }else{
                snakeDirection = .up
            }
        updateGameBoard()
        }
    }
}

