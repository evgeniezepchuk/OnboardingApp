//
//  Constants.swift
//  OnboardingApp
//
//  Created by Евгений Езепчук on 31.12.23.
//

import UIKit

struct Constants {
    
    static let models = [CardsModel(image: .sushi,
                                  textLabel: "Ordina a domicilio senza limiti di distanza. Non è magia, è Moovenda!",
                                  buttonLabel: "Далее"),
                       
                       CardsModel(image: .bagel,
                                  textLabel: "Ogni tanto inviamo degli sconti esclusivi tramite notifiche push, ci stai?",
                                  buttonLabel: "Далее"),
                       
                       CardsModel(image: .iceCream,
                                  textLabel: "Per sfruttare al massimo l'app, puoi condividerci la tua posizione?",
                                  buttonLabel: "Закрыть")]
    
    static let coordinateY = UIScreen.main.bounds.height / 8
    
    static let thirdFrame: CGRect = {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        let literalDistance: CGFloat = 25
        let cardWidth = screenWidth - (literalDistance * 2)
        let cardHeight = (screenHeight / 4) * 2.5
        let coordinateX = literalDistance
        let coordinateY = screenHeight / 8
        let frame = CGRect(x: coordinateX, y: coordinateY, width: cardWidth, height: cardHeight)
        return frame
    }()
    
    static let secondFrame: CGRect = {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        let literalDistance: CGFloat = 40
        let cardWidth = screenWidth - (literalDistance * 2)
        let cardHeight = (screenHeight / 4) * 2.5
        let coordinateX = literalDistance
        let coordinateY = (screenHeight / 8) + 15
        let frame = CGRect(x: coordinateX, y: coordinateY, width: cardWidth, height: cardHeight)
        return frame
    }()
    
    static let firstFrame: CGRect = {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        let literalDistance: CGFloat = 55
        let cardWidth = screenWidth - (literalDistance * 2)
        let cardHeight = (screenHeight / 4) * 2.5
        let coordinateX = literalDistance
        let coordinateY = (screenHeight / 8) + 30
        let frame = CGRect(x: coordinateX, y: coordinateY, width: cardWidth, height: cardHeight)
        return frame
    }()
    
    static let startFrame: CGRect = {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        let literalDistance: CGFloat = 25
        let cardWidth = screenWidth - (literalDistance * 2)
        let cardHeight = (screenHeight / 4) * 2.5
        let coordinateX = literalDistance
        let coordinateY: CGFloat = screenHeight
        let frame = CGRect(x: coordinateX, y: coordinateY, width: cardWidth, height: cardHeight)
        return frame
    }()
}
