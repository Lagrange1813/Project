//
//  ViewController.swift
//  HelloWorld
//
//  Created by Lagrange1813 on 2021/10/31.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // view.backgroundColor = UIColor.black
    }

    @IBAction func showMessage(sender: UIButton) {
        let emojiDict:[String:String] = ["👻":"Ghost",
                                         "👾":"Monster",
                                         "🤓":"睿智",
                                         "🤖":"Robot"]
//        var ghost = "👻", monster = "👾", 睿智 = "🤓", robot = "🤖"
        let selectedButton = sender
        if let wordToLookup = selectedButton.titleLabel?.text {
            let meaning = emojiDict[wordToLookup]
            let alertController = UIAlertController(title: "Meaning", message: meaning, preferredStyle: UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
    }
}

