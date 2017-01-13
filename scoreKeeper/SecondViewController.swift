//
//  SecondViewController.swift
//  scoreKeeper
//
//  Created by admin on 13/01/17.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    //scoreboard object
    var scoreboard = Scoreboard.shareInstance
    
    //player names should be here
    @IBOutlet weak var ScoreboardLabel: UILabel!
    @IBOutlet weak var PlayerLabel1: UILabel!
    @IBOutlet weak var PlayerLabel2: UILabel!
    @IBOutlet weak var PlayerLabel3: UILabel!
    @IBOutlet weak var PlayerLabel4: UILabel!
    @IBOutlet weak var PlayerLabel5: UILabel!
    
    //players score should be here
    @IBOutlet weak var Player1Score: UITextField!
    @IBOutlet weak var Player2Score: UITextField!
    @IBOutlet weak var Player3Score: UITextField!
    @IBOutlet weak var Player4Score: UITextField!
    @IBOutlet weak var Player5Score: UITextField!
    
    //button to update scores
    @IBOutlet weak var UpdateScoresButton: UIButton!
    
    override func viewDidLoad() {
        //arrays of textfields and labels
        var playerScores = [Player1Score, Player2Score, Player3Score, Player4Score, Player5Score]
        var playerLabels = [PlayerLabel1, PlayerLabel2, PlayerLabel3, PlayerLabel4, PlayerLabel5]
        
        //string for adding new players and scores to scoreboard - this is where the problem is
        
        let Score = Scoreboard.shareInstance
        for i in 0..<scoreboard.count {
            playerLabels[i]?.text = scoreboard.playerList[i]
            playerScores[i]?.text = String(scoreboard.scores[i])
        print("Score is ", Score.count)
            
            //ignore: prints lines for debugging
            
            print("player i value: \(i)")
            print("Playerlist: \(scoreboard.playerList)")
        }
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func resetScores(_ sender: UIButton) {
        //reset scores back to zero
        Player1Score.text = ""
        Player2Score.text = ""
        Player3Score.text = ""
        Player4Score.text = ""
        Player5Score.text = ""
        scoreboard.scores = [0,0,0,0,0]
        viewDidLoad()
    }
}
