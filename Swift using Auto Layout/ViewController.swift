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
    func makeButton(withtext text:String)->UIButton
    func makeView()->UIView
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
        let upperBottomLabel = makeLabel(withtext: "upperBottom")
        let upperBottomButon = makeButton(withtext: "upperButon")
        let yellovView = makeView()
        view.addSubview(upperLeftLabel)
        view.addSubview(upperRightLabel)
        view.addSubview(upperBottomLabel)
        view.addSubview(upperBottomButon)
        view.addSubview(yellovView)
        
        
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
        
        
        
        
        
        // MARK: - Sol Alt köşeye
        NSLayoutConstraint.activate([
            //topAnchor: alt kenarını
            upperBottomLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            // leadingAnchor: bitiş (sol) kenarını
            upperBottomLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 8)
        ])
        // MARK: - Sah Alt köşeye
        NSLayoutConstraint.activate([
            //topAnchor: alt kenarını
            upperBottomButon.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            // trailingAnchor: bitiş (sağ) kenarını
            upperBottomButon.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -8)
        ])
        // MARK: - Tam Ekran Ortasi
        NSLayoutConstraint.activate([
           
            yellovView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            yellovView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
//            option : 1
//            yellovView.heightAnchor.constraint(equalToConstant: 50),
//            yellovView.widthAnchor.constraint(equalToConstant: 100)
            
            //option : 2
            
            //width
            yellovView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            yellovView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            //heigth
            yellovView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 100),
            yellovView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -100)
            
            
            
        ])
        
    }
    func makeLabel(withtext text: String) -> UILabel {
        let label = UILabel().useAutoLayout()
        label.text = text
        label.backgroundColor = .orange
        return label
    }
    
    func makeButton(withtext text: String) -> UIButton {
        let button = UIButton().useAutoLayout()
        button.setTitle(text,for: .normal)
        button.setTitleColor(.yellow, for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 10
        
        
        return button
    }
    func makeView() -> UIView {
        let view = UIView().useAutoLayout()
        
        view.backgroundColor = .yellow
        
        return view
    }
}
#Preview{
    ViewController()
}
