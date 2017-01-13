//
//  SecondViewController.swift
//  scoreKeeper
//
//  Created by admin on 13/01/17.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit

//WARNING: This code will update the score but you must go back to the starting page...

class UpdateScoreViewController: UIViewController {
    
    var scoreboard = Scoreboard.shareInstance
    //current player you are on - acts as a counter
    var currentPlayer = 0
    
    @IBOutlet weak var QuestionLabel: UILabel!
    @IBOutlet weak var UpdateValueField: UITextField!
    
    @IBOutlet weak var name: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if currentPlayer >= scoreboard.playerList.count {
            //do nothing
        }else{
            QuestionLabel.text = "How do you want to change \(scoreboard.playerList[currentPlayer])'s score?"
            
        }
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //function for when add button is clicked
    @IBAction func addScore(_ sender: UIButton) {
        let value:Int? = Int(UpdateValueField.text!)
        //safety
        if value! > 20 {
            let sorryAC = UIAlertController(title: "Sorry", message: "Enter a number between 0-20.", preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil)
            sorryAC.addAction(ok)
            
            present(sorryAC, animated: true, completion: nil)
        }else{
            //add score if its not the end of the list, otherwise, it resets
            if currentPlayer >= scoreboard.playerList.count{
                currentPlayer = 0
            }else{
                let score = Scoreboard.shareInstance
                scoreboard.scores[currentPlayer] += value!
                currentPlayer += 1
                score.score(score:value!)
            }
            viewDidLoad()
        }
    }
    
    
    //function for when subtract button is clicked
    @IBAction func subtractScore(_ sender: UIButton) {
        let value:Int? = Int(UpdateValueField.text!)
        //safety
        if value! > 20 {
            let sorryAC = UIAlertController(title: "Sorry", message: "Enter a number between 0-20.", preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
            sorryAC.addAction(ok)
            
            present(sorryAC, animated: true, completion: nil)
        }else{
            //subtract score if its not the end of the list, otherwise, it starts over
            if currentPlayer >= scoreboard.playerList.count{
                currentPlayer = 0
            }else{
                scoreboard.scores[currentPlayer] -= value!
                currentPlayer += 1
            }
            viewDidLoad()
        }
    }
    
    //function to skip player - just adds one to counter or resets
    @IBAction func skipPlayer(_ sender: UIButton) {
        if currentPlayer > scoreboard.playerList.count-2{
            currentPlayer = 0
        }else{
            currentPlayer += 1
        }
        viewDidLoad()
    }
    
}
