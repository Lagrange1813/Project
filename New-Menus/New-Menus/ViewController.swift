//
//  ViewController.swift
//  New-Menus
//
//  Created by 张维熙 on 2021/11/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewWillLayoutSubviews() {
        configureNavigationBar()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
    }
    
    
    func configureNavigationBar() {
        let width = self.view.frame.width
        let navigationBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 40, width: width, height: 40))
        view.addSubview(navigationBar)
        configureButton(navigationBar)
    }
    
    
    func configureButton(_ navigationBar: UINavigationBar) {
        let navigationItem = UINavigationItem(title: "Navigation bar")
        
        let tapAction = UIAction(title: "Tap me", handler: { (tapAction) in
            let alert = UIAlertController(title: tapAction.title, message: "You just tapped on the Tap Me button!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Done", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        })
        
//        let add = UIAction(title: "Add new...", image: UIImage(systemName: "plus.circle")) { (action) in
//            print("Add new action was selected")
//        }
//        let edit = UIAction(title: "Edit", image: UIImage(systemName: "pencil.circle")) { (action) in
//            print("Edit action was selected")
//        }
//        let delete = UIAction(title: "Delete", image: UIImage(systemName: "minus.circle"), attributes: .destructive) { (action) in
//            print("Delete action was selected")
//        }
//        let menu = UIMenu(title: "Actions", children: [add, edit, delete])
        
        let menu = UIMenu(title: "Actions", children: [UIAction(title: "Add new...", image: UIImage(systemName: "plus.circle"), handler: { (action) in
                print("Option 1 was selected")
            }), UIAction(title: "Edit", image: UIImage(systemName: "pencil.circle"), handler: { (action) in
                print("Option 2 was selected")
            }), UIAction(title: "Delete", image: UIImage(systemName: "minus.circle"), attributes: .destructive, handler: { (action) in
                print("Option 2 was selected")
            })])
        
        let testButton = UIBarButtonItem(systemItem: .action, primaryAction: tapAction, menu: menu)
        
        navigationItem.rightBarButtonItem = testButton
        navigationBar.setItems([navigationItem], animated: false)
    }
    
    
}

