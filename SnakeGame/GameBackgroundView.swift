//
//  GameBackgroundView.swift
//  Snake
//
//  Created by JPL-ST-SPRING2021 on 12/14/21.
//  Copyright © 2021 csc. All rights reserved.
//

import UIKit

class GameBackgroundView: UIView {
    let startX: CGFloat = 3
    let startY: CGFloat = 5
    let cellSize: CGFloat = 23
    var score: Int = Int.min
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
        UIColor.red.setFill()
        UIBezierPath(roundedRect: CGRect(x: startX + CGFloat(shadowFoodColumns) * cellSize, y: startY + CGFloat(shadowFoodRows) * cellSize, width: cellSize, height: cellSize), cornerRadius: 8).fill()
    }
    
    func drawSnake() {
        if shadowSnake.isEmpty {
            return
        }
        
        let head = shadowSnake.first!
        UIColor.green.setFill()
        UIBezierPath(roundedRect: CGRect(x: startX + CGFloat(head.column) * cellSize, y: startY + CGFloat(head.row) * cellSize, width: cellSize, height: cellSize), cornerRadius: 0).fill()
        
        UIColor.white.setFill()
        for i in 1..<shadowSnake.count {
            let cell = shadowSnake[i]
            UIBezierPath(roundedRect: CGRect(x: startX + CGFloat(cell.column) * cellSize, y: startY + CGFloat(cell.row) * cellSize, width: cellSize, height: cellSize), cornerRadius: 0).fill()
        }
    }
    
    func drawGrid() {
        let gridPath = UIBezierPath()
        
        for i in 0...SnakeGameBackground.rows {
            gridPath.move(to: CGPoint(x: startX, y: startY + CGFloat(i) * cellSize))
            gridPath.addLine(to: CGPoint(x: startX + CGFloat(SnakeGameBackground.columns) * cellSize, y: startY + CGFloat(i) * cellSize))
        }
        for i in 0...SnakeGameBackground.columns{
            gridPath.move(to: CGPoint(x: startX + CGFloat(i) * cellSize, y: startY))
            gridPath.addLine(to: CGPoint(x: startX + CGFloat(i) * cellSize, y: startY + CGFloat(SnakeGameBackground.rows) * cellSize))
        }
        UIColor.green.setStroke()
        gridPath.stroke()
    }
}
