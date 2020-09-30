//
//  Fact.swift
//  FactApp
//
//  Created by Giorgi Gogichaishvili on 9/14/20.
//  Copyright © 2020 giorgi gogichaishvili. All rights reserved.
//


import UIKit
enum FactRating {
    case unrated
    case average
    case ok
    case good
    case brilliant
}

class Fact {
    var image: UIImage
    var title: String
    var superscription: String
    var description: String
    var rating: FactRating
    init(titled: String, superscription: String, description: String, imageName: String)
{
    self.title = titled
    self.superscription = superscription
    self.description = description
    if let image = UIImage(named: imageName) {
        self.image = image
    } else {
        self.image = UIImage(named: "rodrigo-rodriguez-x7bbQIY6H04-unsplash")!
    }
    rating = .unrated
}
}
