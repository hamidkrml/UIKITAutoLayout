//
//  SafeAreaGuids.swift
//  Swift using Auto Layout
//
//  Created by hamid on 13.04.2025.
//

import UIKit


protocol SafeAreaProtocol{
    func setupView()
    func makeLabel(withtext text:String) ->UILabel
}



final class SafeAreaGuids1: UIViewController {

    private let padding : CGFloat = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
}

extension SafeAreaGuids1:SafeAreaProtocol{
    func setupView() {
        let topLabel = makeLabel(withtext: "top")
        let bottomLabel = makeLabel(withtext: "bottom")
        
        let leadingLabel = makeLabel(withtext: "leading")
        let trailingLabel = makeLabel(withtext: "trailing")
        
        view.addSubview(topLabel)
        view.addSubview(bottomLabel)
        view.addSubview(leadingLabel)
        view.addSubview(trailingLabel)
       
        // MARK: - Ekranın üst kısmına.
        NSLayoutConstraint.activate([
            topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // MARK: - Alt kısmına.

        NSLayoutConstraint.activate([
            bottomLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        // MARK: leadingLabel: Sol kenara, ortalanmış - trailingLabel: Sağ kenara, ortalanmış
        NSLayoutConstraint.activate([
            leadingLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: padding),
            leadingLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            
            trailingLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -padding),
            trailingLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }
    
    
    // MARK: - Commpenetler
    func makeLabel(withtext text: String) -> UILabel {
        let label = UILabel().useAutoLayout()
        label.text = text
        label.backgroundColor = .yellow
        label.font = UIFont.systemFont(ofSize: 32)
        return label
    }
    
}


#Preview{
    SafeAreaGuids1()
}
