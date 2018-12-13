//
//  ViewController.swift
//  Game Tic Tac Toe
//
//  Created by Abdalah on 9/12/18.
//  Copyright © 2018 Abdalah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var lable: UILabel!
    @IBOutlet var plarbutton: UIButton!
    
    
    var activePlayer = 1
   var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var gameIsActive = true
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
         plarbutton.layer.cornerRadius = plarbutton.bounds.width / 10.0
        plarbutton.layer.masksToBounds = true


    }

    @IBAction func action(_ sender: Any) {
        if(gameState[(sender as AnyObject).tag-1] == 0 && gameIsActive == true)
            
 { gameState[(sender as AnyObject).tag-1] = activePlayer
    if (activePlayer == 1)
    {
        (sender as AnyObject).setImage(UIImage(named: "Cross.png"), for: UIControl.State())
        activePlayer = 2
    }
    else
    {
        (sender as AnyObject).setImage(UIImage(named: "Nought.png"), for: UIControl.State())
        activePlayer = 1
    }        }
        for comination in winningCombinations{
            if gameState[comination[0]] != 0 && gameState[comination[0]] ==  gameState[comination[1]] &&  gameState[comination[1]] ==  gameState[comination[2]] {
                gameIsActive = false
                if gameState[comination[0]] == 1{
                    //cross has win
                    
                    lable.text = "Cross has won!"
                }else{
                    //nought has win
                    lable.text = " NOUGHT has won!"
                }
                plarbutton.isHidden = false
                   lable.isHidden = false
            }
            
        }
        gameIsActive = false
        
        for i in gameState
        {
            if i == 0
            {
                gameIsActive = true
                break
            }
        }
        
        if gameIsActive == false
        {
            lable.text = "IT WAS A DRAW"
            lable.isHidden = false
            plarbutton.isHidden = false
        }
    }
    
    
    @IBAction func playagain(_ sender: Any) {
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        activePlayer = 1
        lable.isHidden = true
        for i in 1...9{
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
        }
    }
}



