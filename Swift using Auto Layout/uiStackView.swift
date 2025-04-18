//
//  uiStackView.swift
//  Swift using Auto Layout
//
//  Created by hamid on 18.04.2025.
//

import UIKit
protocol uiStackViewProtocol{
    func setupView()
    func makeImage(named: String) ->UIImageView
    func makeLabel(withText text : String) ->UILabel
    func makeButton(withText text : String) ->UIButton
}

class uiStackView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    


}

extension uiStackView:uiStackViewProtocol{
    func setupView() {
        let button1 = makeButton(withText: "button1")
        let button2 = makeButton(withText: "button2")
        let button3 = makeButton(withText: "button3")
        
        
        
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button1)
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
