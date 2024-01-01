//
//  CardModel.swift
//  OnboardingApp
//
//  Created by Евгений Езепчук on 30.12.23.
//

import UIKit

struct CardsModel {
    
    let image: UIImage
    let textLabel: String
    let buttonLabel: String
    
    init(image: UIImage, textLabel: String, buttonLabel: String) {
        self.image = image
        self.textLabel = textLabel
        self.buttonLabel = buttonLabel
    }
}
