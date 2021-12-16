//
//  SnakeGameBackground.swift
//  SnakeGameTests
//
//  Created by JPL-ST-SPRING2021 on 12/15/21.
//  Copyright © 2021 csc. All rights reserved.
//

import XCTest
@testable import SnakeGame

class SnakeGameBackgroundTest: XCTestCase {
    func testPrintBackground() {
        var background = SnakeGameBackground()
        background.snake.append(SnakeCell(column: 2, row: 1))
        print(background)
    }
}
