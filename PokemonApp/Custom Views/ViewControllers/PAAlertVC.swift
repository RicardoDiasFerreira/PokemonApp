//
//  PAAlertVC.swift
//  PokemonApp
//
//  Created by Ricardo Ferreira on 07/04/2020.
//  Copyright © 2020 Ricardo Ferreira. All rights reserved.
//

import UIKit

class PAAlertVC: UIViewController {
    
    let containerView = PAAlertContainerView()
    let titleLabel =  PATitleLabel(textAligment: .center, fontSize: 20)
    let messageLabel = PABodyLabel(textAligment: .center)
    let actionButton = PAButton()
    
    var alertTitle:String?
    var alertMessage:String?
    var alertButtonTitle:String?

    init(title: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        alertTitle = title
        alertMessage = message
        alertButtonTitle = buttonTitle
        
        configureVCModalType()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        view.addSubviews(containerView, titleLabel, messageLabel, actionButton)
        
        configureContainerView()
        configureTitleLabel()
        configureMessageLabel()
        configureActionButton()

    }
    
    private func configureVCModalType() {
        modalPresentationStyle = .overFullScreen
        modalTransitionStyle = .crossDissolve
    }
    
    private func configureContainerView() {
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 280),
            containerView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func configureTitleLabel() {
        titleLabel.text = alertTitle ?? "No title label!"
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            titleLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
    }
    
    private func configureMessageLabel() {
        messageLabel.text = alertMessage ?? "No message available!"
        messageLabel.numberOfLines = 4
        
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            messageLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -10)
        ])
    }
    
    private func configureActionButton() {
        actionButton.setTitle(alertButtonTitle ?? "Ok", for: .normal)
        actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
            actionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            actionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            actionButton.heightAnchor.constraint(equalToConstant: 45)
        
        ])
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }

}
