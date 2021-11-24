//
//  ViewController.swift
//  New-HelloWorld
//
//  Created by 张维熙 on 2021/11/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        
        configureButton()
    }

//    var firstButton = UIButton()
    
    func configureButton() {
//        firstButton.addTarget(self, action: #selector(handleTap(_:)), for: .touchUpInside)
        let tapAction = UIAction(title: "Tap me", handler: { (tapAction) in
            let alert = UIAlertController(title: tapAction.title, message: "You just tapped on the Tap Me button!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Done", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        })
        let firstButton = UIButton(type: .system, primaryAction: tapAction)
        firstButton.setTitle("Hello World", for: .normal)
        firstButton.setTitleColor(.systemBlue, for: .normal)
        firstButton.setTitleColor(.systemGray, for: .highlighted)
        firstButton.setTitleColor(.gray, for: .selected)
        
        view.addSubview(firstButton)
        
        setConstraints(firstButton)
    }
    
    func setConstraints(_ button: UIButton) {
        button.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    @objc func handleTap(_ sender: Any) {
        let alert = UIAlertController(title: "Hello there!", message: "You just tapped on the Tap Me button!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}

