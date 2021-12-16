//
//  GameBackgroundView.swift
//  Snake
//
//  Created by JPL-ST-SPRING2021 on 12/14/21.
//  Copyright © 2021 csc. All rights reserved.
//

import UIKit

class GameBackgroundView: UIView {
    let originX: CGFloat = 3
    let originY: CGFloat = 1
    let cellSize: CGFloat = 23
  
    var shadowSnake: [SnakeCell] = []
    var shadowFoodColumns: Int = Int.min
    var shadowFoodRows: Int = Int.min
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        drawGrid()
        drawSnake()
        drawFood()
    }
    
    func drawFood(){
        UIColor.orange.setFill()
        UIBezierPath(roundedRect: CGRect(x: originX + CGFloat(shadowFoodColumns) * cellSize, y: originY + CGFloat(shadowFoodRows) * cellSize, width: cellSize, height: cellSize), cornerRadius: 6).fill()
    }
    
    func drawSnake() {
        if shadowSnake.isEmpty {
            return
        }
        
        let head = shadowSnake.first!
        UIColor.green.setFill()
        UIBezierPath(roundedRect: CGRect(x: originX + CGFloat(head.column) * cellSize, y: originY + CGFloat(head.row) * cellSize, width: cellSize, height: cellSize), cornerRadius: 6).fill()

        /*
        guard !background.snake.isEmpty else {
            return
        }
        */
        
        UIColor.brown.setFill()
        for i in 1..<shadowSnake.count {
            let cell = shadowSnake[i]
            UIBezierPath(roundedRect: CGRect(x: originX + CGFloat(cell.column) * cellSize, y: originY + CGFloat(cell.row) * cellSize, width: cellSize, height: cellSize), cornerRadius: 6).fill()
        }
    }
    
    func drawGrid() {
        let gridPath = UIBezierPath()
        
        for i in 0...SnakeGameBackground.rows {
            gridPath.move(to: CGPoint(x: originX, y: originY + CGFloat(i) * cellSize))
            gridPath.addLine(to: CGPoint(x: originX + CGFloat(SnakeGameBackground.columns) * cellSize, y: originY + CGFloat(i) * cellSize))
        }
        for i in 0...SnakeGameBackground.columns{
            gridPath.move(to: CGPoint(x: originX + CGFloat(i) * cellSize, y: originY))
            gridPath.addLine(to: CGPoint(x: originX + CGFloat(i) * cellSize, y: originY + CGFloat(SnakeGameBackground.rows) * cellSize))
        }
        UIColor.green.setStroke()
        gridPath.stroke()
    }
}
