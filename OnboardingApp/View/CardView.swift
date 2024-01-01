//
//  CardView.swift
//  OnboardingApp
//
//  Created by Евгений Езепчук on 30.12.23.
//

import UIKit

final class CardView: UIView {
    
    private var delegate: DeleteCardDelegate?
    
    private lazy var cardImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var cardLabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(descriptor: .preferredFontDescriptor(withTextStyle: .title2), size: 21)
        label.textColor = .textColor
        return label
    }()
    
    private lazy var cardButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(actionButton), for: .allEvents)
        button.setTitleColor(.buttonColor, for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        addViews()
        configureConstraints()
        configureShadow()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func actionButton(sender: UIButton) {
        delegate = ViewModel()
        guard let delegate else { return }
        delegate.tap(sender)
    }
    
    public func configureView(model: CardsModel) {
        cardImageView.image = model.image
        cardLabel.text = model.textLabel
        cardButton.setTitle(model.buttonLabel, for: .normal)
    }
    
    private func addViews() {
        [cardImageView, cardLabel, cardButton].forEach { view in
            addSubview(view)
        }
    }
    
    private func configureConstraints() {
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardLabel.translatesAutoresizingMaskIntoConstraints = false
        cardButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cardImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cardImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cardImageView.heightAnchor.constraint(equalToConstant: 220),
            cardImageView.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            
            cardLabel.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 10),
            cardLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            cardLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            cardLabel.heightAnchor.constraint(equalToConstant: 120),
            
            cardButton.topAnchor.constraint(equalTo: cardLabel.bottomAnchor, constant: 40),
            cardButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            cardButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            cardButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)   
        ])
    }
    
    private func configureShadow() {
        backgroundColor = .viewsBackgroundColor
        layer.shadowColor = UIColor.shadowColor.cgColor
        layer.cornerRadius = 6
        layer.shadowOffset = CGSize(width: 0, height: 10)
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 6
    }
}

