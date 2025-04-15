//
//  intrinsicContentSizeInaction.swift
//  Swift using Auto Layout
//
//  Created by hamid on 15.04.2025.
//

import UIKit

protocol intrinsicContentSizeInactionProtocol{
    func setupView()
    func makeLabel(withtext text:String) ->UILabel
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
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 8),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 8)
        ])
        
    }
    
    func makeLabel(withtext text: String) -> UILabel {
        let label = UILabel().useAutoLayout()
        label.text = text
        label.font = UIFont.systemFont(ofSize: 35)
        label.backgroundColor = .yellow
     
        return label
    }
}


#Preview{
    intrinsicContentSizeInaction()
}
