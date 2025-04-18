//
//  uiStackView.swift
//  Swift using Auto Layout
//
//  Created by hamid on 18.04.2025.
//

import UIKit
protocol example1Protocol{
    func setupView()
    func makeImage(named: String) ->UIImageView
    func makeLabel(withText text : String) ->UILabel
    func makeButton(withText text : String) ->UIButton
}

class example1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    


}

extension example1:uiStackViewProtocol{
    func setupView() {
        let button1 = makeButton(withText: "button1")
        let button4 = makeButton(withText: "button1")
        let button2 = makeButton(withText: "button2")
        let button3 = makeButton(withText: "button3")
        
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button3)
        view.addSubview(button4)

        NSLayoutConstraint.activate([
            button1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 150),
            button1.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 140),
            button1.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -140),
            
            button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 10),
            button2.leadingAnchor.constraint(equalTo: button1.leadingAnchor),
            button2.trailingAnchor.constraint(equalTo: button1.trailingAnchor),
            
            button3.topAnchor.constraint(equalTo: button2.bottomAnchor,constant: 8),
            button3.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            button3.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            button4.topAnchor.constraint(equalTo: button3.bottomAnchor,constant: 8),
            button4.leadingAnchor.constraint(equalTo: button1.leadingAnchor),
            button4.trailingAnchor.constraint(equalTo: button1.trailingAnchor),
        ])
    }
    func makeImage(named: String) -> UIImageView {
        let image = UIImageView().useAutoLayout()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: named)
        return image
    }
    func makeLabel(withText text: String) -> UILabel {
        let label = UILabel().useAutoLayout()
        label.text = text
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 32)
        label.backgroundColor = .yellow
        return label
    }
    func makeButton(withText text: String) -> UIButton {
        let button = UIButton().useAutoLayout()
        var config = UIButton.Configuration.filled()
        config.title = text
        config.baseBackgroundColor = .blue
        config.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)

        button.configuration = config
        return button
        
        
        
    }
}

#Preview{
    example1()
}
