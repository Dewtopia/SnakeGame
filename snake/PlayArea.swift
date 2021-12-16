//
//  PlayArea.swift
//  snake
//
//  Created by Anthony Borges on 12/15/21.
//

import UIKit

class PlayArea: UIView {
    
    let col: Int = 16
    let row: Int = 18
    
    let initialX: CGFloat = 3
    let initialY: CGFloat = 2
    let gridCellSize: CGFloat = 23
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        createGrid()
    }
    
    func createGrid() {
        let gridPath = UIBezierPath()
        for i in 0...row {
            gridPath.move(to: CGPoint(x: initialX, y: initialY + CGFloat(i) * gridCellSize))
            gridPath.addLine(to:CGPoint(x: initialX + CGFloat(col) * gridCellSize, y: initialY + CGFloat(i) * gridCellSize))
        }
        
        for i in 0...col{
            gridPath.move(to: CGPoint(x: initialX + CGFloat(i) * gridCellSize, y: initialY))
            gridPath.addLine(to: CGPoint(x: initialX + CGFloat(i) * gridCellSize, y: initialY + CGFloat(row) * gridCellSize))
        }
        UIColor.green.setStroke()
        gridPath.stroke()
    }

}
