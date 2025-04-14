//
//  LayoutMarginsAsSpacer.swift
//  Swift using Auto Layout
//
//  Created by hamid on 14.04.2025.
//

import UIKit

protocol LayoutMarginsAsSpacerProtocol{
    func setupView()
    func makeButton(text:String,color:UIColor) ->UIButton
}



class LayoutMarginsAsSpacer: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
  
}





extension LayoutMarginsAsSpacer:LayoutMarginsAsSpacerProtocol{
    func setupView() {
        let leadingGuide = UILayoutGuide()
        let okButton = makeButton(text: "ok", color: UIColor.darkBlue)
        let middleGuide = UILayoutGuide()
        let cancelButton = makeButton(text: "cancel", color: UIColor.darkGreen)
        let trailingGuide = UILayoutGuide()
     
        // view.layoutMarginsGuide, ekranın kenar boşluklarını tanımlar
        let margins = view.layoutMarginsGuide
        
        view.addLayoutGuide(leadingGuide)
        view.addSubview(okButton)
        view.addLayoutGuide(middleGuide)
        view.addSubview(cancelButton)
        view.addLayoutGuide(trailingGuide)
        
        NSLayoutConstraint.activate([
            
            // leadingGuide sol kenara hizalanır
            margins.leadingAnchor.constraint(equalTo: leadingGuide.leadingAnchor),
            
            // leadingGuide ile okButton arasında boşluk oluştur
            leadingGuide.trailingAnchor.constraint(equalTo: okButton.leadingAnchor),
            
            // okButton ile middleGuide arasında boşluk oluştur
            okButton.trailingAnchor.constraint(equalTo: middleGuide.leadingAnchor),
            
            // middleGuide ile cancelButton arasında boşluk oluştur
            middleGuide.trailingAnchor.constraint(equalTo: cancelButton.leadingAnchor),
            
            // cancelButton ile trailingGuide arasında boşluk oluştur
            cancelButton.trailingAnchor.constraint(equalTo: trailingGuide.leadingAnchor),
            
            // trailingGuide sağ kenara hizalanır
            trailingGuide.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            
            // butonlar aynı genişlikte olsun
            okButton.widthAnchor.constraint(equalTo: cancelButton.widthAnchor),
            
            // tüm boşluklar (spacer'lar) aynı genişlikte olsun
            leadingGuide.widthAnchor.constraint(equalTo: middleGuide.widthAnchor),
            leadingGuide.widthAnchor.constraint(equalTo: trailingGuide.widthAnchor),
            
            // her şey dikeyde ortalansın
            leadingGuide.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            middleGuide.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            trailingGuide.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            okButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            cancelButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        
    }
    
    func makeButton(text: String, color: UIColor) -> UIButton {
        let button = UIButton().useAutoLayout()
        var config = UIButton.Configuration.filled()
        config.title = text
        config.baseBackgroundColor = color
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)

        button.configuration = config
        return button
    }
    
    
}


extension UIColor{
    static let darkBlue = UIColor(red: 10/255, green: 132/255, blue: 255/255, alpha: 1)
    static let darkGreen = UIColor(red: 48/255, green: 209/255, blue: 88/255, alpha: 1)
}
#Preview{
    LayoutMarginsAsSpacer()
}
