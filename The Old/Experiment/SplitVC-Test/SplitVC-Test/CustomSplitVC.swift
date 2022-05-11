//
//  CustomSplitVC.swift
//  SplitVC-Test
//
//  Created by 张维熙 on 2022/2/14.
//

import UIKit

class CustomSplitVC: UISplitViewController, UISplitViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
        view.backgroundColor = .white
        self.preferredDisplayMode = .oneBesideSecondary
        self.preferredSplitBehavior = .automatic
        presentsWithGesture = true
        
        let bookListVC = BookListVC()
        let articleListVC = ArticleListVC()
        let articleField = ViewController()
        
        let articleListNav = UINavigationController(rootViewController: articleListVC)
        let articleFieldNav = UINavigationController(rootViewController: articleField)
        
        setViewController(bookListVC, for: .primary)
        setViewController(articleListNav, for: .supplementary)
        setViewController(articleFieldNav, for: .secondary)
        
        preferredPrimaryColumnWidth = 200
        preferredSupplementaryColumnWidth = 200
        
        let articleFieldCompact = ViewController()
        let aFCompactNav = UINavigationController(rootViewController: articleFieldCompact)
        
        setViewController(aFCompactNav, for: .compact)
        show(.supplementary)
        
        
    }
    


}
