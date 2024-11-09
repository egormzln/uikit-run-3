//
//  ViewController.swift
//  UiKitRun3
//
//  Created by Егор Мизюлин on 09.11.2024.
//

import UIKit

class ViewController: UIViewController {
    lazy var squareView: UIView = {
        let squareView = UIView()
        squareView.translatesAutoresizingMaskIntoConstraints = false
        squareView.backgroundColor = .orange
        squareView.layer.cornerRadius = 12
        return squareView
    }()

    lazy var slider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.value = 0
        slider.addTarget(self, action: #selector(sliderChanged(_:)), for: .valueChanged)
        slider.addTarget(self, action: #selector(sliderReleased(_:)), for: [.touchUpInside, .touchUpOutside])
        return slider
    }()
    
    private let animator = UIViewPropertyAnimator(duration: 0.8, curve: .easeInOut)
    
    private let initSize: CGFloat = 100
    private let finalScale: CGFloat = 1.5
    private let layoutMargins: CGFloat = 16
    private let rotation: CGFloat = .pi / 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.layoutMargins = UIEdgeInsets(top: 0, left: layoutMargins, bottom: 0, right: layoutMargins)
        
        view.addSubview(squareView)
        view.addSubview(slider)
        
        NSLayoutConstraint.activate([
            squareView.heightAnchor.constraint(equalToConstant: initSize),
            squareView.widthAnchor.constraint(equalToConstant: initSize),
            squareView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            squareView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),

            slider.topAnchor.constraint(equalTo: squareView.bottomAnchor, constant: 60),
            slider.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            slider.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
        ])
        
        animator.pausesOnCompletion = true
        
        animator.addAnimations { [unowned self, unowned squareView] in
            squareView.transform = CGAffineTransform(rotationAngle: rotation).scaledBy(x: finalScale, y: finalScale)
            squareView.center.x = self.view.frame.width - finalScale / 2 * initSize - layoutMargins
        }
    }
    
    @objc func sliderChanged(_ sender: UISlider) {
        animator.fractionComplete = CGFloat(sender.value)
    }
    
    @objc func sliderReleased(_ sender: UISlider) {
        animator.continueAnimation(withTimingParameters: nil, durationFactor: 1 - CGFloat(sender.value))
        slider.setValue(1, animated: true)
    }
}
