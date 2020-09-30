//
//  FactTableViewCell.swift
//  FactApp
//
//  Created by Giorgi Gogichaishvili on 9/15/20.
//  Copyright © 2020 giorgi gogichaishvili. All rights reserved.
//

import UIKit

class FactTableViewCell: UITableViewCell {
       
    
    @IBOutlet weak var factImageView: UIImageView!
    
    
//    @IBOutlet weak var factTitleLabel: UILabel!
//
//
//    @IBOutlet weak var factSuperscriptionLabel: UILabel!
//
//    @IBOutlet weak var MoreLabel: UILabel!
    
    @IBOutlet weak var factTitleLabel: UILabel!


    @IBOutlet weak var factSuperscriptionLabel: UILabel!


    @IBOutlet weak var MoreLabel: UILabel!
    
    
    
    
    
    
   
    
   
    
    
    
    
    
    

var fact: Fact? {
        didSet {
            self.updateUI()
        }
    }
    func updateUI()
    {
        factImageView?.image = fact?.image
        factTitleLabel?.text = fact?.title
        factSuperscriptionLabel.text = fact?.superscription
    }
}

