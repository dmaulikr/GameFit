//
//  BattleViewController.swift
//  GameFit
//
//  Created by Pranav Kundra on 9/26/15.
//  Copyright © 2015 Pranav Kundra. All rights reserved.
//

import Foundation
import UIKit

class BattleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var battleHistory = ["Player1 used defense on Player2", "Player2 used tackle on Player1", "Player1 used heal on Player2"]
    var players = ["Player1", "Player2"]
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return battleHistory.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("BattleHistoryCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = battleHistory[indexPath.row]
        
        return cell
    }
    
    @IBAction func chooseAttack (segue: UIStoryboardSegue) {
        if segue.identifier == "AttackChoice" {
            let sourceVC = segue.sourceViewController as! AttackListController
            
            let theAttack = sourceVC.chosenAttack
            
            battleHistory.append(players[0] + " used " + String(theAttack[0]) + " on " + players[1])
            
            let indexPath = NSIndexPath(forRow: battleHistory.count-1, inSection: 0)
            tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            
        }
    }
}
