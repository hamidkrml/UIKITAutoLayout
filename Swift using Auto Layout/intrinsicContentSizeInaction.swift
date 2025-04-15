//
//  intrinsicContentSizeInaction.swift
//  Swift using Auto Layout
//
//  Created by hamid on 15.04.2025.
//

import UIKit

protocol intrinsicContentSizeInactionProtocol{
    func setupView()
    func makeLabel(withtext text:String) -> UILabel
    func makeTextFieald(withtext text: String) -> UITextField
}

class intrinsicContentSizeInaction: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
       
    }
    


}

extension intrinsicContentSizeInaction:intrinsicContentSizeInactionProtocol{
    func setupView() {
        let label = makeLabel(withtext: "label")
        let textfield = makeTextFieald(withtext: "textField")
        view.addSubview(label)
        view.addSubview(textfield)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 8),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 8),
       
            textfield.trailingAnchor.constraint(equalTo: label.trailingAnchor, constant: 8),
            textfield.firstBaselineAnchor.constraint(equalTo: label.firstBaselineAnchor),
            textfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8)
        ])
        
    }
    
    func makeLabel(withtext text: String) -> UILabel {
        let label = UILabel().useAutoLayout()
        label.text = text
        label.font = UIFont.systemFont(ofSize: 35)
        label.backgroundColor = .yellow
     
        return label
    }
    func makeTextFieald(withtext text: String) -> UITextField {
        let textfield = UITextField().useAutoLayout()
        textfield.placeholder = text
        textfield.font = UIFont.systemFont(ofSize: 35)
        textfield.backgroundColor = .black
     
        return textfield
    }
}


#Preview{
    intrinsicContentSizeInaction()
}

class biglabel: UILabel{
    override var intrinsicContentSize: CGSize{
        return CGSize(width: 200, height: 200)
    }
}

