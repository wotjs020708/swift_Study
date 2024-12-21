//
//  ViewController.swift
//  useSnapKit
//
//  Created by 어재선 on 9/19/24.
//

import UIKit
import SnapKit
class ViewController: UIViewController {
    
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .red
        
        return label
    }()

    private lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("SnapKit", for: .normal)
        button.backgroundColor = .green
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    
    func setupUI() {
        self.view.backgroundColor = .blue
        self.view.addSubview(label)
        self.view.addSubview(button)
        label.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            make.center.equalToSuperview()
            
        }
        button.snp.makeConstraints { mae in
                
            mae.width.height.equalTo(100)
            mae.center.equalToSuperview()
        }
        
//        NSLayoutConstraint.activate([
//            label.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
//            label.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor),
//            label.heightAnchor.constraint(equalToConstant: 100),
//            label.widthAnchor.constraint(equalToConstant: 100),
//        ])
    }
    
}

