//
//  CustomTableVC.swift
//  SplitVC-Test
//
//  Created by 张维熙 on 2022/2/14.
//

import UIKit

class ArticleListVC: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)! as! CatCell
        cell.set(cat: cats[indexPath.row])

        return cell
    }
}
