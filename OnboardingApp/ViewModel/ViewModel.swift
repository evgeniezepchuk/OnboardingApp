//
//  ViewModel.swift
//  OnboardingApp
//
//  Created by Евгений Езепчук on 31.12.23.
//

import UIKit

final class ViewModel: UIView {
    
    private lazy var bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .bottomViewBackgroundcolor
        return view
    }()
    
    private lazy var button: UIButton = {
        let but = UIButton()
        but.setTitle("Start", for: .normal)
        but.setTitleColor(.buttonColor, for: .normal)
        but.addTarget(self, action: #selector(nextCard), for: .touchUpInside)
        return but
    }()
    
    private var cardToShow = 4
    
    private let gradient = CAGradientLayer()
    
    private let gesture = UIPanGestureRecognizer()
    
    private let views = CardView()
    private let views1 = CardView()
    private let views2 = CardView()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureView()
        configureTapGesture()
        configureBottomView()
        addGradient()
        configureStartButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        
        backgroundColor = .backgroundColor
        
        views.configureView(model:  Constants.models[0])
        views1.configureView(model: Constants.models[1])
        views2.configureView(model: Constants.models[2])
        
        [views2, views1, views].forEach { card in
            card.frame = Constants.startFrame
            card.alpha = 0
            addSubview(card)
        }
    }
    
    private func configureBottomView() {
        addSubview(bottomView)
        bottomView.frame = CGRect(x: 0, y: UIScreen.main.bounds.height - 80, width: UIScreen.main.bounds.width, height: 80)
        bottomView.layer.shadowColor = UIColor.shadowColor.cgColor
        bottomView.layer.shadowOffset = CGSize(width: 0, height: -5)
        bottomView.layer.shadowOpacity = 1
    }
    
    private func configureStartButton() {
        button.frame = CGRect(x: bottomView.bounds.width - 100, y: (bottomView.bounds.height / 2) - 30, width: 100, height: 50)
        bottomView.addSubview(button)
    }
    
    private func configureTapGesture() {
        gesture.addTarget(self, action: #selector(handlePanGesture))
        views.addGestureRecognizer(gesture)
    }
    
    private func addGradient() {
        gradient.startPoint = CGPoint(x: 0, y: 1)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.frame = bottomView.bounds
        gradient.colors = [UIColor.leftBottomViewGradientColor.cgColor, UIColor.rightBottomViewGradientColor.cgColor]
        bottomView.layer.addSublayer(gradient)
    }
    
    @objc func nextCard() {

        switch cardToShow {
        case 3:
            UIView.animate(withDuration: 0.5) {
                self.views.translatesAutoresizingMaskIntoConstraints = true
                self.views.frame = CGRect(x: 600, y: Constants.coordinateY, width: Constants.thirdFrame.width, height: Constants.thirdFrame.height)
                self.views.alpha = 0
                
                self.views1.translatesAutoresizingMaskIntoConstraints = true
                self.views1.frame = Constants.thirdFrame
                
                self.views2.translatesAutoresizingMaskIntoConstraints = true
                self.views2.frame = Constants.secondFrame
            }
            cardToShow -= 1
            
        case 2:
            UIView.animate(withDuration: 0.5) {
                self.views1.frame = CGRect(x: 600, y: Constants.coordinateY, width: Constants.thirdFrame.width, height: Constants.thirdFrame.height)
                self.views1.alpha = 0
                self.views2.frame = Constants.thirdFrame
                self.button.setTitle("rifiuta", for: .normal)
            }
            views.removeFromSuperview()
            cardToShow -= 1
            
        case 1:
            UIView.animate(withDuration: 0.5) {
                self.views2.frame = Constants.startFrame
                self.views.alpha = 0
                
            }
            views1.removeFromSuperview()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.configureView()
                self.configureTapGesture()
                self.configureBottomView()
                self.addGradient()
                self.configureStartButton()
                self.cardToShow = 4
                self.button.setTitle("Start", for: .normal)
                self.button.setTitleColor(.buttonColor, for: .normal)
            }
            
        default:
            UIView.animate(withDuration: 0.6) {
                [self.views2, self.views1, self.views].forEach { card in
                    card.alpha = 1
                    self.views.frame = Constants.thirdFrame
                    self.views1.frame = Constants.secondFrame
                    self.views2.frame = Constants.firstFrame
                    self.gradient.removeFromSuperlayer()
                    self.button.setTitle("accetta", for: .normal)
                    self.button.setTitleColor(.leftBottomViewGradientColor, for: .normal)
                }
            }
            cardToShow -= 1
        }
    }
    
    @objc func handlePanGesture(sender: UIPanGestureRecognizer){
        switch sender.state {
        case .ended:
            nextCard()
            switch cardToShow {
            case 2:
                views.removeGestureRecognizer(gesture)
                views1.addGestureRecognizer(gesture)
            case 1:
                views1.removeGestureRecognizer(gesture)
                views2.addGestureRecognizer(gesture)
            default: break
            }
        default:
            break
        }
    }
}

extension ViewModel: DeleteCardDelegate {
    func tap(_ sender: UIButton) {
        sender.addTarget(nil, action: #selector(nextCard), for: .touchUpInside)
    }
}
