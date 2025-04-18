//
//  workingWithImages.swift
//  Swift using Auto Layout
//
//  Created by hamid on 17.04.2025.
//

import UIKit

protocol workingWithImagesProtocol{
    func setupView()
    func makeImage(named: String) ->UIImageView
    func makeLabel(withText text : String) ->UILabel
    func makeButton(withText text : String) ->UIButton
}



class workingWithImages: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
      
    }
    

}

extension workingWithImages:workingWithImagesProtocol{
    func setupView() {
        let image = makeImage(named: "image")
        let label = makeLabel(withText: "title")
        let button = makeButton(withText: "get Startet")
        
        view.addSubview(image)
        view.addSubview(label)
        view.addSubview(button)
        
        
        // MARK: - Auto Layout Constraints
       
        // 1. Görsel (image): Üstten 16pt boşlukla, ekran genişliğine duyarlı ve yüksekliği 300pt.
        // 2. Başlık (label): Görselin altına 10pt boşlukla gelir, sağ ve soldan 8pt boşlukla hizalanır.
        // 3. Buton (button): Ekranın en altına sabitlenir, yatayda kenarlardan 8pt boşlukla yayılır.
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
 
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            image.heightAnchor.constraint(equalToConstant: 300),

            label.topAnchor.constraint(equalTo: image.bottomAnchor,constant: 10),
            
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 8),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -8),
          
            
            
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 8),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -8)
          
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
    workingWithImages()
}
