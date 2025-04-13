//
//  ViewController.swift
//  Swift using Auto Layout
//
//  Created by hamid on 13.04.2025.
//

import UIKit
protocol ViewControllerProtocol{
    func setupView()
    func makeLabel(withtext text:String)->UILabel
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }


}

extension ViewController :ViewControllerProtocol{
    
    func setupView() {
        let upperLeftLabel = makeLabel(withtext: "upperLeft")
        let upperRightLabel = makeLabel(withtext: "upperRiht")
        
        view.addSubview(upperLeftLabel)
        view.addSubview(upperRightLabel)
        
        
        
        
        // MARK: - Sol üst köşeye
        NSLayoutConstraint.activate([
            
            //topAnchor: üst kenarını
            upperLeftLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            // leadingAnchor: başlangıç (sol) kenarını
            upperLeftLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 8)
          
        ])
        // MARK: - Sağ üst köşeye
        NSLayoutConstraint.activate([
            
            upperRightLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            // trailingAnchor: bitiş (sağ) kenarını
            upperRightLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -8)
        ])
        
        
        
        
    }
    func makeLabel(withtext text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.backgroundColor = .orange
        return label
    }
    
    
}
#Preview{
    ViewController()
}
