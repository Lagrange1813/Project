//
//  ActionsViewController.swift
//  PickersMenusActions
//
//  Created by Gabriel Theodoropoulos.
//

import UIKit

class ActionsViewController: UIViewController {
    
    var label: UILabel?
    
    enum FontStyle: String, CaseIterable {
        case Normal, Bold, Italic
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        createButton()
        createTestLabel()
        createSegmentedControl()
    }

    
    func createButton() {
        let action = UIAction(title: "Tap Me") { (action) in
            print("You tapped me!")
        }
        let button = UIButton(type: .custom, primaryAction: action)
//        let button = UIButton(type: .custom, primaryAction: UIAction(title: "Tap Me", handler: { (action) in
//            print("You tapped me!")
//        }))
        // 上面的代码片段非常重要: 它既是按钮初始化，也是它在一个地方的主要操作
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.lightGray, for: .highlighted)
        
        createButtonConstraints(button)
    }
    
    
    func createSegmentedControl() {
        //        let normal = UIAction(title: FontStyle.Normal.rawValue) { (action) in
        //            self.label?.font = UIFont.systemFont(ofSize: 17)
        //        }
        //        let bold = UIAction(title: FontStyle.Bold.rawValue) { (action) in
        //            self.label?.font = UIFont.boldSystemFont(ofSize: 17)
        //        }
        //        let italic = UIAction(title: FontStyle.Italic.rawValue) { (action) in
        //            self.label?.font = UIFont.italicSystemFont(ofSize: 17)
        //        }
        //        let segmented = UISegmentedControl(frame: .zero, actions: [normal, bold, italic])
        let segmented = UISegmentedControl(frame: .zero, actions: FontStyle.allCases.map({ fontStyle in
            UIAction(title: fontStyle.rawValue) { (action) in
                switch fontStyle {
                case .Normal: self.label?.font = UIFont.systemFont(ofSize: 17)
                case .Bold: self.label?.font = UIFont.boldSystemFont(ofSize: 17)
                case .Italic: self.label?.font = UIFont.italicSystemFont(ofSize: 17)
                }
            }
        }))
        segmented.selectedSegmentIndex = 0
        createSegmentedControlConstraints(segmented)
    }
    
    
    func createButtonConstraints(_ button: UIButton) {
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 150).isActive = true
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 70).isActive = true
        button.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
    
    func createSegmentedControlConstraints(_ segmented: UISegmentedControl) {
        guard let label = label else { return }
        self.view.addSubview(segmented)
        segmented.translatesAutoresizingMaskIntoConstraints = false
        segmented.bottomAnchor.constraint(equalTo: label.topAnchor, constant: -40).isActive = true
        segmented.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    
    func createTestLabel() {
        label = UILabel(frame: .zero)
        label?.text = "Hello World!"
        label?.font = UIFont.systemFont(ofSize: 17)
        label?.textColor = .label
        
        self.view.addSubview(label!)
        label?.translatesAutoresizingMaskIntoConstraints = false
        label?.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -100).isActive = true
        label?.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        label?.widthAnchor.constraint(equalToConstant: 100).isActive = true
        label?.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}
