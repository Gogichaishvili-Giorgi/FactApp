//
//  FactsTableViewController.swift
//  FactApp
//
//  Created by Giorgi Gogichaishvili on 9/15/20.
//  Copyright © 2020 giorgi gogichaishvili. All rights reserved.
//

import UIKit

class FactsTableViewController: UITableViewController {
var factLines: [FactLine] = FactLine.getFactLines()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Facts of World War 2"
        
       
        navigationItem.rightBarButtonItem = editButtonItem
    }

    // Mark: UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return factLines.count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return factLines[section].facts.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FactCell", for: indexPath) as! FactTableViewCell
        let factLine = factLines[indexPath.section]
        let facts = factLine.facts
        let fact = facts[indexPath.row]
        cell.fact = fact
        return cell
        
    }
    // Multiple Sections
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        let factLine = factLines[section]
        return factLine.name
    }
    // delete Rows
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete {
            // 1 - delete the product from the productLine's products array
            let factLine = factLines[indexPath.section]
            factLine.facts.remove(at: indexPath.row)
            // 2 - update the table view with new data
            //tableView.reloadData() //badway
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    // Moving cells
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath)
    {
        let factToMove = factLines[sourceIndexPath.section].facts[sourceIndexPath.row]
        // move productToMove to destination products
        factLines[destinationIndexPath.section].facts.insert(factToMove, at: destinationIndexPath.row)
        // delete the productToMove from the source products
        factLines[sourceIndexPath.section].facts.remove(at: sourceIndexPath.row)
    }
    // Mark: - UITableViewDelegate
    var selectedFact: Fact?
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let factLine = factLines[indexPath.section]
        let fact = factLine.facts[indexPath.row]
        selectedFact = fact
        performSegue(withIdentifier: "ShowFactDetail", sender: nil)
    }
    // Mark: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "ShowFactDetail" {
            let factDetailTVC = segue.destination as! FactDetailTableViewController
            factDetailTVC.fact = selectedFact
            
        }
    }
}
  

    



