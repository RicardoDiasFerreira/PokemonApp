//
//  UIViewController+Ext.swift
//  PokemonApp
//
//  Created by Ricardo Ferreira on 08/04/2020.
//  Copyright © 2020 Ricardo Ferreira. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func presentAlertVCOnMainTread(title: String, message: String, btnText: String) {
        
        DispatchQueue.main.async {
            self.present(PAAlertVC(title: title, message: message, buttonTitle: btnText), animated: true)
        }
    }
    
}
