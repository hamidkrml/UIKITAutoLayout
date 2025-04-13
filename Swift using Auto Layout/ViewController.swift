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
        view.addSubview(upperLeftLabel)
        
        
        NSLayoutConstraint.activate([
            upperLeftLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 2),
            upperLeftLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 2)
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
