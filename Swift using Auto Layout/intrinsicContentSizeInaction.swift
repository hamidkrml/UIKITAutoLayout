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
        
        
        
        // label'ın kendi içeriğine göre genişliğini koruması için öncelik verildi
        label.setContentHuggingPriority(UILayoutPriority(rawValue:251), for: .horizontal)
        
        NSLayoutConstraint.activate([
            // label'ı üstte güvenli alanın 8 birim altına yerleştir
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 8),
            // label'ı sol kenardan 8 birim içeri yerleştir
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 8),
       
            // textfield'ı label'ın sağından 8 birim uzağa yerleştir
            textfield.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 8),
            // textfield ve label aynı yatay hizaya (baseline) sahip olsun
            textfield.firstBaselineAnchor.constraint(equalTo: label.firstBaselineAnchor),
            // textfield'ı sağ kenardan 8 birim içeride konumlandır
            textfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            
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
        textfield.backgroundColor = .gray
     
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
