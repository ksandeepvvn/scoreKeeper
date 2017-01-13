//
//  ViewController.swift
//  scoreKeeper
//
//  Created by admin on 13/01/17.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit

var firstController = FirstViewController()

class FirstViewController: UIViewController {
    
    @IBOutlet weak var AddPlayerButton: UIBarButtonItem!
    @IBOutlet weak var Count: UILabel!
    @IBOutlet weak var Play: UIButton!
    
    //creates new scoreboard
    var scoreboard = Scoreboard.shareInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstController = self
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showAlert))
        self.view.backgroundColor = UIColor.blue
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Add player alert: pop up when plus button is pushed
    @IBAction func showAlert() {
        //if you have five or more players
        if scoreboard.playerList.count >= 5 {
            let sorryAC = UIAlertController(title: "Sorry", message: "You have reached the player limit.", preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "Word", style: UIAlertActionStyle.cancel, handler: nil)
            sorryAC.addAction(ok)
            
            present(sorryAC, animated: true, completion: nil)
            
        } else {
            let alertController = UIAlertController(title: "Add a player", message: "(Maximum of 5)", preferredStyle: .alert)
            alertController.addTextField()
            
            let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
            alertController.addAction(cancel)
            
            let addPlayer = UIAlertAction(title: "Add Player", style: .default){ [unowned self, alertController] (action: UIAlertAction!) in
                let answer = alertController.textFields![0]
                self.scoreboard.addPlayer(name: answer.text!)
                self.Count.text = "Player Count: \(self.scoreboard.count)"
                
            }
            alertController.addAction(addPlayer)
            present(alertController, animated: true, completion: nil)
        }
        
    }
    
    //warning alert: if user tries to start playing before there are players
    @IBAction func showWarning() {
        if self.scoreboard.count == 0{
            let warningController = UIAlertController(title: "Warning", message: "You need at least 1 player to play the game", preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
            warningController.addAction(ok)
            
            present(warningController, animated: true, completion: nil)
        }else{//no game to play yet
            let sorryAlertController = UIAlertController(title: "Sorry", message: "There is no game to play yet...", preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil)
            sorryAlertController.addAction(ok)
            present(sorryAlertController, animated: true, completion: nil)
        }
    }
    //navigate to scoreboard
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSecondViewController" {
            // let secondViewController = segue.destination as! SecondViewController
            //secondViewController.Player1Score =
        }
    }
    
    //starts a new game and resets player count
    @IBAction func resetGame(_ sender: UIButton) {
        //resets game
        scoreboard.newGame()
        self.Count.text = "Player Count: "
    }
}
