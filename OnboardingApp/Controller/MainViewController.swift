//
//  ViewController.swift
//  OnboardingApp
//
//  Created by Евгений Езепчук on 30.12.23.
//

import UIKit

final class MainViewController: UIViewController {
    
    var viewModel: ViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewModel()
    }
    
    private func configureViewModel() {
        viewModel = ViewModel()
        guard let viewModel else { return }
        viewModel.frame = view.bounds
        view.addSubview(viewModel)
    }
}
