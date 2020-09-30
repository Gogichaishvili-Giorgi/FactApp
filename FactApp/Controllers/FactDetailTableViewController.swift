//
//  FactDetailTableViewController.swift
//  FactApp
//
//  Created by Giorgi Gogichaishvili on 9/15/20.
//  Copyright © 2020 giorgi gogichaishvili. All rights reserved.
//

import UIKit

class FactDetailTableViewController: UITableViewController {
     
    @IBOutlet weak var factImageView: UIImageView!
    
    @IBOutlet weak var factTitleTextField: UITextField!
    
    @IBOutlet weak var factDescriptionTextView: UITextView!
    
var fact: Fact?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Edit Product"
        // CC -
        factImageView.image = fact?.image
        factTitleTextField.text = fact?.title
        factTitleTextField.delegate = self
        factDescriptionTextView.text = fact?.description
    }
    //Mark: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath?
    {
        if indexPath.section == 0 && indexPath.row == 0 {
            return indexPath
        } else {
            return nil
        }
    }
}

extension FactDetailTableViewController : UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
// Mark: - UIScrollViewDelegate
extension FactDetailTableViewController
{
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView)
    {
        factDescriptionTextView.resignFirstResponder()
        factTitleTextField.resignFirstResponder()
    }
}
