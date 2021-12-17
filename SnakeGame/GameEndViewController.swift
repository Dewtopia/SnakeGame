//
//  GameEndViewController.swift
//  SnakeGame
//
//  Created by JPL-ST-SPRING2021 on 12/16/21.
//  Copyright © 2021 csc. All rights reserved.
//

import UIKit

class GameEndViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backToGame() {
        let resetGame = storyboard?.instantiateViewController(withIdentifier: "gameBoard") as! ViewController
        present(resetGame, animated: true)
    }
}
