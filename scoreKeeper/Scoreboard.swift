//
//  Scoreboard.swift
//  scoreKeeper
//
//  Created by admin on 13/01/17.
//  Copyright © 2017 admin. All rights reserved.
//

import Foundation
import UIKit

class Scoreboard{
    
    //allows views to share class
    static let shareInstance = Scoreboard()
    //initializers
    var playerList: [String] = []
    var scores: [Int] = [0,0,0,0,0]
    var count = 0
    
    //adds a player and adds to a counter to keep track of players
    func addPlayer(name: String) {
        playerList.append(name)
        count += 1
        print(playerList)
    }
    
    func score(score: Int)
    {
        scores.append(score)
        print(scores)
    }
    
    //resets values for a new game
    func newGame() {
        playerList = []
        scores = [0,0,0,0,0]
        count = 0
    }
    
}
