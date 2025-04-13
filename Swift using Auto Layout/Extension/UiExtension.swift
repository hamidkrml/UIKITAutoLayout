//
//  UiExtension.swift
//  Swift using Auto Layout
//
//  Created by hamid on 13.04.2025.
//

import UIKit


protocol UiExtension{
    func useAutoLayout() -> Self
}

extension UIView:UiExtension{
    func useAutoLayout() -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        return self
    }
    
    
}
